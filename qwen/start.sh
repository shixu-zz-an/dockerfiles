#!/bin/bash
# 设置 Ollama 服务绑定地址为 0.0.0.0
export OLLAMA_HOST=0.0.0.0

# 启动 Ollama 服务
echo "Starting Ollama..."
ollama start &

# 等待 Ollama 服务启动
sleep 10

# 加载 Qwen-2.5 7B 模型
echo "run Qwen-2.5 7B model..."
ollama run qwen2.5:7b

# 启动主应用服务
echo "Starting main_ops.py..."
python3 /app/main_ops.py
