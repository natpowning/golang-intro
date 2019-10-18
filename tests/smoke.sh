if output="$(./golang-intro)"; then
    if [[ $output == "{2 Tricia McMillan}" ]]; then
	    exit 0
    fi
    echo >&2 "Failure: Unexpected output: $output"
else
    echo >&2 "Failure: Unable to execute binary."
fi

exit 1

