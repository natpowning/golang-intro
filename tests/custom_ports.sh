
echo "---"
echo "Executing Custom Ports Test..."

PORT=8081
export PORT
cmd="./golang-intro"
$cmd &
APP_PID=$!

output="$(curl -s http://localhost:$PORT/users)"
if [[ $output == "null" ]]; then
    kill $APP_PID
    echo "Custom Ports Test Successful."
    exit 0
fi

echo >&2 "Custom Ports Test Failure: Unexpected output: $output"
kill $APP_PID
exit 1

