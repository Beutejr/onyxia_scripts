#!/bin/bash

# Skript beendet sich bei Fehlern
set -e

# Argumente prüfen
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <huggingface-username> <huggingface-access-token> <model-name>"
  exit 1
fi

# Argumente zuweisen
USERNAME=$1
ACCESS_TOKEN=$2
MODEL_NAME=$3

# Hugging Face CLI Login
echo "Logging in to Hugging Face CLI..."
echo "$ACCESS_TOKEN" | huggingface-cli login --username "$USERNAME" --token

# vLLM und OpenAI Pakete installieren
echo "Installing vLLM and OpenAI Python packages..."
pip install vllm openai

# vLLM Modell bereitstellen
echo "Serving model '$MODEL_NAME' with vLLM..."
vllm serve "$MODEL_NAME"
