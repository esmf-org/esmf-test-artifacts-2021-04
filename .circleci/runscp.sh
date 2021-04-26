#!/bin/bash 

set -x 
cd ~/esmf-test-artifacts
#echo "Host *" > ~/.ssh/config
#echo "  StrictHostKeyChecking no" >> ~/.ssh/config
#git clone git@github.com:mark-a-potts/esmf-test-artifacts.git
git config --global user.email "mark.potts@noaa.gov"
git config --global user.name "dcv-bot"
git branch
#git branch -r
#export host=`git show -s --format=%s |  awk -F " " '{print $10}'`
export host=${CIRCLE_BRANCH}
export branch=`git show -s --format=%s |  awk -F " " '{print $5}' | awk -F"_._" '{print $2}'`
export branch=${branch:-'develop'}
export hash=`git show -s --format=%s |  awk -F " " '{print $8}'`
export message=`git show -s --format=%s`
echo $host
echo $branch
git checkout origin/main
git checkout -b main
git checkout origin/$host $branch/$host
echo $message
find $branch -iname summary.dat | xargs grep -l "hash = $hash" | xargs grep -L "hash = $hash." | xargs grep "test results" | sed 's/\// /g'  | sed -e 's/\t/ /g' | sed -e 's/ \+/ /g' | sed -e 's/mpiuni/mpiuni none/g'  | awk -F " " '{print $2,$3,$4,$6,$7,$5,$12,$14}' > "$branch/$hash.summary"
git add $branch
git commit -a -m"$message"
git push origin main
