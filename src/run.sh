#!/bin/bash

# make sure yum clears it's cache since we may have just added a repo or two 
yum clean all

if [ -z "$REPOS_NAME" ]; then
  # missing repo name declaration
  echo "[FATAL] Missing REPO_NAMES env var"
else
  # time to go
  reposync --repoid="${REPO_NAME}" --download_path=/data
fi