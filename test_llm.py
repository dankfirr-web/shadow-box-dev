#!/usr/bin/env python3
import torch
from transformers import AutoTokenizer, AutoModelForCausalLM
import os

print("=== Testing PyTorch ===")
print(f"PyTorch version: {torch.__version__}")
print(f"CUDA available: {torch.cuda.is_available()}")
print(f"Random tensor: {torch.rand(2, 3)}")
print()

print("=== Testing LLM Model ===")
model_path = "/media/xavier/D4C0-942A/llm-studio-model/llama-2-13b-chat.Q2_K.gguf"

if os.path.exists(model_path):
    file_size = os.path.getsize(model_path) / (1024**3)  # Size in GB
    print(f"Model found: {model_path}")
    print(f"Model size: {file_size:.2f} GB")
    
    if file_size > 4.5:  # Should be ~5.1GB
        print("✓ Model appears to be complete")
    else:
        print("⚠ Model may be incomplete")
else:
    print("✗ Model not found")
print()

print("=== Setup Complete ===")
print("Your PyTorch and LLM environment is ready!")
print("Remember to activate the environment with: source ~/pytorch-env/bin/activate")
