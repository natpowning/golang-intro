DIR=`dirname "$0"`

echo "Executing All Tests..."

$DIR/smoke.sh
$DIR/user_lifecycle.sh

echo "---"
echo "All Tests Complete"
