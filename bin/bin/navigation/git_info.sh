#!/usr/bin/env zsh

# This script is used by the search_git script to show the status of the git directory in the preview window of the fzf.

git -C "$1" status --porcelain -b | awk '
BEGIN {
    modified = 0;
    added = 0;
    deleted = 0;
    untracked = 0;
    changed = "Nothing to do";
}
{
    if ($1 == "M") modified++;
    if ($1 == "A" || $1 == "D" || $1 == "M" || $1 == "??") changed = "Git directory modified";
    if ($1 == "D") deleted++;
    if ($1 == "??") untracked++;
    if ($1 == "A") added++;
}
END {
    print changed, "\n",
          "Added:     ", added, "\n",
          "Modified:  ", modified, "\n",
          "Deleted:   ", deleted, "\n",
          "Untracked: ", untracked;
}'
