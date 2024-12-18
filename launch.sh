#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Default values for the arguments
DEFAULT_TITLE="RENDERING"
DEFAULT_SUBTITLE="Please do not touch!"
DEFAULT_CONTACT=""

# If arguments are provided, use them, otherwise use the default values
TITLE="${1:-$DEFAULT_TITLE}"
SUBTITLE="${2:-$DEFAULT_SUBTITLE}"
CONTACT="${3:-$DEFAULT_CONTACT}"

# Run the Python script with the specified or default arguments
python3 $SCRIPT_DIR/main.py "$TITLE" "$SUBTITLE" "$CONTACT"