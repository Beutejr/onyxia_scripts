#!/bin/bash

# Prüfen, ob pip installiert ist
if ! command -v pip &> /dev/null; then
    echo "pip ist nicht installiert. Bitte installieren Sie pip und versuchen Sie es erneut."
    exit 1
fi

# Installieren der Bibliothek vllm
echo "Installiere die Python-Bibliothek 'vllm'..."
pip install vllm

# Überprüfen, ob die Installation erfolgreich war
if pip show vllm &> /dev/null; then
    echo "Die Installation von 'vllm' war erfolgreich."
else
    echo "Die Installation von 'vllm' ist fehlgeschlagen."
    exit 1
fi
