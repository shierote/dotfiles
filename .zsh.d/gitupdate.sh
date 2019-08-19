# git add
printf "git add "
read ADD_FILE
git add $ADD_FILE

# git commit 
printf "git commit -m "
read MESSAGE
if [ -z "$MESSAGE" ]; then
TIME=`date "+%Y/%m/%d %H:%M"`
MESSAGE="${TIME} updated."
fi
printf "git commit -m ${MESSAGE}"
git commit -m "${MESSAGE}"

# git push
printf "Do you want to push? [Y/n] "
read ANSWER
case $ANSWER in
    "" | "Y" | "y" | "yes" | "Yes" | "YES" ) git push;;
    * ) echo "Done.";;
esac
