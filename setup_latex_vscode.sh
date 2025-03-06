#!/bin/bash

# Funktion zum Installieren von VS Code Erweiterungen
install_vscode_extensions() {
    echo "Installing VS Code extensions..."
    code --install-extension James-Yu.latex-workshop || {
        echo "Failed to install 'LaTeX Workshop' extension."; exit 1;
    }
    code --install-extension streetsidesoftware.code-spell-checker-german || {
        echo "Failed to install 'German - Code Spell Checker' extension."; exit 1;
    }
    echo "VS Code extensions installed successfully."
}

# Funktion zum Installieren von LaTeX-Paketen
install_latex_packages() {
    echo "Installing LaTeX packages..."
    packages=(
        "epigraph.sty"
        "emptypage.sty"
        "bibtopic.sty"
        "nextpage.sty"
        "babel-german.sty"
        "hyphen-german"
    )

    for package in "${packages[@]}"; do
        echo "Installing package: $package"
        tlmgr install "$package" || {
            echo "Failed to install $package."; exit 1;
        }
    done
    echo "LaTeX packages installed successfully."
}

# Prüfung, ob tlmgr installiert ist
if ! command -v tlmgr &> /dev/null; then
    echo "tlmgr is not installed. Please install TeX Live or TinyTeX before running this script."
    exit 1
fi

# Prüfung, ob VS Code installiert ist
if ! command -v code &> /dev/null; then
    echo "VS Code is not installed. Please install VS Code before running this script."
    exit 1
fi

# Ausführung der Installationen
install_vscode_extensions
install_latex_packages

echo "All installations completed successfully."
