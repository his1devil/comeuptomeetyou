#!/bin/bash

cd $(dirname $0)

if [[ "${VIRTUAL_ENV}" != "" ]]; then
pip freeze > requirements.pip
fi

git status|grep "deleted:"|awk '{print$NF}'|while read fn;do
git rm ${fn}
done
git add .
if [[ $# -gt 0 ]];then
git commit -a -m $1
else
git commit -a -m $(date +%Y%m%d%H%M%S)
fi
git push
