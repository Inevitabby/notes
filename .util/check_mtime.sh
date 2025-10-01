function check_mtime {
    INPUT_FILE="${1}"
    OUTPUT_DIR="${2}"
    MTIME_DIR="/dev/shm/.mtimes/${OUTPUT_DIR}" && mkdir -p "${MTIME_DIR}"
    MTIME_FILE="${MTIME_DIR}/$(basename -- "${INPUT_FILE}").mtime"
    
    if [ ! -f "$MTIME_FILE" ] || [ "$INPUT_FILE" -nt "$MTIME_FILE" ]; then
        touch "$MTIME_FILE"
        return 1  # File changed
    else
        return 0  # File unchanged
    fi
}
