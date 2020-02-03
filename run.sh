if [ "$1" != "" ]; then
    docker run -it --rm -p 8888:8888 cbjuan/example-datascience:$1
else
    echo "No version specified"
fi