DIR=`dirname "$0"`

echo "Executing All Tests..."

# TODO: Handle failure exit codes
bash $DIR/smoke.sh
bash $DIR/user_lifecycle.sh

echo "---"
echo "All Tests Complete"
