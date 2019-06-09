case "$1" in
	-h|--help)
		echo "----HELP-----"
		echo "Floor 4:\tsh "`basename "$0"`" -4"
		echo "Floor 5:\tsh "`basename "$0"`" -5"
		echo "Help:\t\tsh "`basename "$0"`" -h"
		;;
	-4)
		echo "-----FLOOR 4-----"
		;;
	-5)
		echo "-----FLOOR 5-----"
		;;
	*)
		echo "Flag "$1" doesn't exist"
		echo "Help:\t\tsh "`basename "$0"`" -h"
		;;
esac
