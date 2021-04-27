#!/bin/bash 

set -x 
cd ~/esmf-test-artifacts
#echo "Host *" > ~/.ssh/config
#echo "  StrictHostKeyChecking no" >> ~/.ssh/config
#git clone git@github.com:mark-a-potts/esmf-test-artifacts.git
git config --global user.email "mark.potts@noaa.gov"
git config --global user.name "dcv-bot"
git branch
export hash=${CIRCLE_SHA1}
export TERM=xterm
export host=${CIRCLE_BRANCH}
export message=`git log --format=%B -n 1 $hash | head -n 1`
export branch=`echo $message |  awk -F " " '{print $4}' | awk -F"_._" '{print $2}'`
export branch=${branch:-'develop'}
export branchhash=`echo $message |  awk -F " " '{print $8}' | awk -F"-" '{print $3}'`
echo $hash
echo $host
echo $branch
echo $message
git cherry-pick $hash
git cherry-pick --continue
find $branch -iname summary.dat | xargs grep -l "hash = $branchhash" | xargs grep -L "hash = $branchhash." | xargs grep "test results" | sed 's/\// /g'  | sed -e 's/\t/ /g' | sed -e 's/ \+/ /g' | sed -e 's/mpiuni/mpiuni none/g'  | awk -F " " '{print $2,$3,$4,$6,$7,$5,$12,$14}' > "$branch/$branchhash.summary"
git add $branch
git commit -a -m"$message"
git push origin main
