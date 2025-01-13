# 使用 Anolis OS 作为基础镜像
FROM registry.openanolis.cn/openanolis/anolisos:8

# 安装必要工具
RUN yum update -y && yum install -y \
    python3 \
    python3-pip \
    curl \
    vim \
    net-tools && \
    yum clean all

# 安装常用 Python 库
RUN pip3 install --no-cache-dir flask requests

# 创建工作目录
WORKDIR /app

# 复制业务逻辑脚本
COPY main_ops.py /app/main_ops.py

# 暴露必要端口（如日志、监控服务）
EXPOSE 5000

# 启动主容器服务
CMD ["python3", "main_ops.py"]
