#!/usr/bin/bash

git checkout plavac develop/plavac
git status
git add develop/plavac
git commit -a -m'adding changes'
git log
git push origin main
return 0
