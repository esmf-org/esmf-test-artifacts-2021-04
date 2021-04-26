#!/bin/bash 

set -x 
cd ~/esmf-test-artifacts
git config --global user.email "mark.potts@noaa.gov"
git config --global user.name "dcv-bot"
git branch
export hash=`git for-each-ref --sort=-committerdate refs/heads/ | head -n 1 | awk -F" " '{print $1}'`
export host=${CIRCLE_BRANCH}
export branch=${branch:-'develop'}
echo $host
echo $branch
echo $message
git cherry-pick $hash
find $branch -iname summary.dat | xargs grep -l "hash = $hash" | xargs grep -L "hash = $hash." | xargs grep "test results" | sed 's/\// /g'  | sed -e 's/\t/ /g' | sed -e 's/ \+/ /g' | sed -e 's/mpiuni/mpiuni none/g'  | awk -F " " '{print $2,$3,$4,$6,$7,$5,$12,$14}' > "$branch/$hash.summary"
