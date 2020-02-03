if [ "$1" != "" ]; then
    docker build --no-cache -t cbjuan/basic-ds:$1 .
else
    echo "No version specified"
fi