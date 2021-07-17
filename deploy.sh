#!/bin/sh

# If a command fails then the deploy stops
set -e

# Print out commands before executing them
set -x

printf "Deploying updates to GitHub..."

# Build the project.
hugo -t maupassant

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin main

# Back to the origin folder
# cd ..

# rm -rf public