@echo OFF 
cd   F:/github/myword

F:

echo "start git add commit fetch merge push"
echo "git add -A"
git add -A

set d=%date:~0,10%

echo "git commit -m '%d%'"
git commit -m '%d%'

echo "git fetch origin master"
git fetch origin master

echo "git merge origin/master"
git merge origin/master

echo "git push origin master:master"
git push origin master:master

exit