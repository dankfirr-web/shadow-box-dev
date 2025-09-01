LLM & PyTorch Setup on Flash Drive
==================================

1. Activate environment:
   source ~/pytorch-env/bin/activate

2. Your LLM model is at:
   /media/xavier/D4C0-942A/llm-studio-model/llama-2-13b-chat.Q2_K.gguf

3. To use with llama.cpp:
   from llama_cpp import Llama
   llm = Llama(model_path="/media/xavier/D4C0-942A/llm-studio-model/llama-2-13b-chat.Q2_K.gguf")

4. To use with Hugging Face transformers:
   from transformers import AutoTokenizer, AutoModelForCausalLM
   # (For appropriate model types)

5. Deactivate when done:
   deactivate
