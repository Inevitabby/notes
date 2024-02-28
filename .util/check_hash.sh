function check_hash {
	INPUT_FILE="${1}"
	OUTPUT_DIR="${2}"
	HASH_DIR=".md5sums/${OUTPUT_DIR}" && mkdir -p "${HASH_DIR}"
	HASH_FILE="${HASH_DIR}/$(basename -- "${INPUT_FILE}").hash"
	CURRENT_HASH=$(md5sum "$INPUT_FILE" | cut -d' ' -f1)
	PREVIOUS_HASH=""
	[ -f "$HASH_FILE" ] && PREVIOUS_HASH=$(cat "$HASH_FILE")
	if [ "$CURRENT_HASH" == "$PREVIOUS_HASH" ]; then
		return 0  # Hash unchanged
	else
		echo "$CURRENT_HASH" >"$HASH_FILE"
		return 1  # Hash changed
	fi
}
