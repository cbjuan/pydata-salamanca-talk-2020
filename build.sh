if [ "$1" != "" ]; then
    docker build --no-cache -t cbjuan/example-datascience:$1 .
else
    echo "No version specified"
fi