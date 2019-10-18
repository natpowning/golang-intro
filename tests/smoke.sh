cmd="./golang-intro"
$cmd &

output="$(curl -s http://localhost:3000/users)"
if [[ $output == "Hello from the User Controller!" ]]; then
    exit 0
fi

echo >&2 "Failure: Unexpected output: $output"
exit 1
