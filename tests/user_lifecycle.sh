
echo "---"
echo "Executing User Lifecycle Tests..."

cmd="./golang-intro"
$cmd &
APP_PID=$!

output="$(curl -s -X POST -d "{\"FirstName\":\"Nat\",\"LastName\":\"Powning\"}" http://localhost:3000/users)"
if [[ $output == "{\"ID\":1,\"FirstName\":\"Nat\",\"LastName\":\"Powning\"}" ]]; then
    output="$(curl -s -X GET http://localhost:3000/users)"
    if [[ $output == "[{\"ID\":1,\"FirstName\":\"Nat\",\"LastName\":\"Powning\"}]" ]]; then
        echo "First User Add Successful."
    else
        echo >&2 "First User Add Failure: Unexpected GET /users output: $output"
        kill $APP_PID
        exit 1
    fi
else
    echo >&2 "First User Add Failure: Unexpected output: $output"
    kill $APP_PID
    exit 1
fi

output="$(curl -s -X DELETE http://localhost:3000/users/1)"
if [[ $output == "" ]]; then
    output="$(curl -s -X GET http://localhost:3000/users)"
    if [[ $output == "[]" ]]; then
        echo "First User Delete Successful."
    else
        echo >&2 "First User Delete Failure: Unexpected GET /users output: $output"
        kill $APP_PID
        exit 1
    fi
else
    echo >&2 "First User List Failure: Unexpected output: $output"
    kill $APP_PID
    exit 1
fi

echo "User Lifecycle Tests Successful."
kill $APP_PID
exit 0
