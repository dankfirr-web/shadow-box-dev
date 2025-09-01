#!/usr/bin/env bash

# Comprehensive setup script for AI development on Kali Linux with NVIDIA GPU support

set -euo pipefail

echo "--- Setting up AI Development Environment ---"

# --- 1. System Dependencies ---
echo "[+] Updating package lists and installing dependencies..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3-pip python3-venv git ffmpeg portaudio19-dev nvidia-cuda-toolkit

# --- 2. Project Directory Setup ---
PROJECT_DIR="$HOME/ai-development"
VENV_DIR="$PROJECT_DIR/venv"
echo "[+] Creating project directory and Python virtual environment in $PROJECT_DIR..."
mkdir -p "$PROJECT_DIR"
python3 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"

# --- 3. Python Packages ---
echo "[+] Installing Python packages..."
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
pip install transformers accelerate bitsandbytes faster-whisper TTS silero sounddevice pyaudio flask flask-socketio scipy Flask-HTTPAuth

# --- 4. Model Storage ---
echo "[+] Setting up model storage..."
SSD_MODEL_PATH="/media/$USER/ASTRA/models"
mkdir -p "$SSD_MODEL_PATH"
ln -sfn "$SSD_MODEL_PATH" models
echo "Models will be stored in $SSD_MODEL_PATH and linked to from $PROJECT_DIR/models"

# --- 5. Instructions ---
echo "--- Setup Complete! ---"
echo "Next steps:"
echo "1. Download models from Hugging Face and place them in '$SSD_MODEL_PATH'."
echo "2. To run your applications, activate the virtual environment:"
echo "   cd $PROJECT_DIR"
echo "   source venv/bin/activate"
