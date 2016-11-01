for file in $(find . -type f | grep -v update.sh | xargs grep -l Atlassian)
do
    sed -i -e  's!Atlassian!Rancher!g' $file
done

for file in $(find . -type f | grep -v update.sh | xargs grep -l atlassian)
do
    sed -i -e 's!atlassian!rancher!g' $file
done
