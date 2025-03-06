#!/bin/sh

# This init script install various useful VScode extensions
# NB : only extensions from the Open VSX Registry (https://open-vsx.org/) can be installed on code-server
# Expected parameters : None

# CONFORT EXTENSIONS -----------------

# latex add on
code-server --install-extension James-Yu.latex-workshop
# german spell checker
code-server --install-extension streetsidesoftware.code-spell-checker-german
# latex packages
tlmgr install epigraph emptypage bibtopic nextpage babel-german hyphen-german

echo "All installations completed successfully."
