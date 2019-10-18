
echo "---"
echo "Executing Smoke Test..."

cmd="./golang-intro"
$cmd &
APP_PID=$!

output="$(curl -s http://localhost:3000/users)"
if [[ $output == "null" ]]; then
    kill $APP_PID
    echo "Smoke Test Successful."
    exit 0
fi

echo >&2 "Smoke Test Failure: Unexpected output: $output"
kill $APP_PID
exit 1
