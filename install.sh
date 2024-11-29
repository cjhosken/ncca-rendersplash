#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define the target directory (where the folder will be copied)
TARGET_DIR="$HOME/.ncca"

# Check if the target directory exists, and create it if it doesn't
if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating directory $TARGET_DIR..."
    mkdir -p "$TARGET_DIR"
else
    echo "Directory $TARGET_DIR already exists."
fi

# Copy the folder where the script is located into the target directory
echo "Copying $SCRIPT_DIR to $TARGET_DIR..."
cp -r "$SCRIPT_DIR" "$TARGET_DIR"

ALIAS_NAME="splash"
ALIAS_COMMAND="$TARGET_DIR/splash/launch.sh 'RENDERING' 'Please do not touch!' 'username@bournemouth.ac.uk'"

# Check if the alias already exists in .bashrc
if ! grep -q "alias $ALIAS_NAME=" "$HOME/.bashrc"; then
    echo "Adding alias to .bashrc..."
    echo "" >> "$HOME/.bashrc"
    echo "alias $ALIAS_NAME=\"$ALIAS_COMMAND\"" >> "$HOME/.bashrc"
    echo "Alias added. Please restart your terminal or run 'source ~/.bashrc' to use the alias."
else
    echo "Alias '$ALIAS_NAME' already exists in .bashrc."
fi

echo "Installation complete."