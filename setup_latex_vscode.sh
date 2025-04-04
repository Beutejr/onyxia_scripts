#!/bin/sh

# This init script install various useful VScode extensions
# NB : only extensions from the Open VSX Registry (https://open-vsx.org/) can be installed on code-server
# Expected parameters : None

# CONFORT EXTENSIONS -----------------

# latex add on
code-server --install-extension James-Yu.latex-workshop
# german spell checker
code-server --install-extension streetsidesoftware.code-spell-checker-german

# update tex-live
URL="https://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh"
# SCRIPT_NAME="update-tlmgr-latest.sh"
wget -qO- URL | sh
tlmgr update --self --all
# sh "$SCRIPT_NAME" -- --upgrade
# latex packages
tlmgr install epigraph emptypage bibtopic nextpage babel-german hyphen-german pgfplots

echo "All installations completed successfully."

# Path to the VSCode settings.json file
SETTINGS_FILE="${HOME}/.local/share/code-server/User/settings.json"

# Check if the settings.json file exists, otherwise create a new one
if [ ! -f "$SETTINGS_FILE" ]; then
    echo "No existing settings.json found. Creating a new one."
    mkdir -p "$(dirname "$SETTINGS_FILE")"
    echo "{}" > "$SETTINGS_FILE"  # Initialize with an empty JSON object
fi

# Add or modify Python-related settings using jq
# We will keep the comments outside the jq block, as jq doesn't support comments inside JSON.
jq '. + {
    "latex-workshop.latex.outDir": "/home/onyxia/work/bachelorarbeit-tex/build",
}' "$SETTINGS_FILE" > "$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
