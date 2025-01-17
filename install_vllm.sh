#!/bin/bash

# Skript beendet sich bei Fehlern
set -e

# Argumente prüfen
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <huggingface-access-token>"
  exit 1
fi

# Argumente zuweisen
ACCESS_TOKEN=$1
# MODEL_NAME=$2

# vLLM und OpenAI Pakete installieren
echo "Installing vLLM and OpenAI Python packages..."
pip install vllm openai

# Hugging Face CLI Login
echo "Logging in to Hugging Face CLI..."
huggingface-cli login --token $ACCESS_TOKEN

# vLLM Modell bereitstellen
# echo "Serving model '$MODEL_NAME' with vLLM..."
# vllm serve "$MODEL_NAME"
