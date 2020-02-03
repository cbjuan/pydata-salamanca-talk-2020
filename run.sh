if [ "$1" != "" ]; then
    docker run -it --rm -p 8888:8888 cbjuan/basic-ds:$1
else
    echo "No version specified"
fi