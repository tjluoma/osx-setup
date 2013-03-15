
ERRORS=""

_log () {

	IMPORTANT="no"

	case "$1" in
		!)
				IMPORTANT="yes"
				shift
		;;
	esac

	LOG="$HOME/Desktop/$NAME.log.txt"

	zmodload zsh/datetime

	TIME=$(strftime %Y-%m-%d--%H.%M.%S "$EPOCHSECONDS")

	OUTPUT=`"$@" 2>&1`

	EXIT="$?"

	echo

	if [[ "$EXIT" = "0" ]]
	then
			if [[ "$OUTPUT" == "" ]]
			then
					echo "Success [$NAME @ $TIME]: $*	[no output]" | tee -a "$LOG"
			else
					echo "Success [$NAME @ $TIME]: $*\n\tOUTPUT: >$OUTPUT<" | tee -a "$LOG"
			fi
	else
					echo "Failure [$NAME @ $TIME]: $*\n\tOUTPUT: >$OUTPUT<\n\tExit: >$EXIT<\n\tIMPORTANT: $IMPORTANT" | tee -a "$LOG"

			[[ "$IMPORTANT" == "yes" ]] && exit $EXIT
			[[ "$IMPORTANT" == "no" ]] && IFS=$'\n' ERRORS=($(echo "$*: [$EXIT] OUTPUT: $OUTPUT\n$ERRORS"))
	fi
}
