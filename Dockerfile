# 使用基础镜像
FROM skybro/ubuntu-cn:latest

# 设置环境变量
ENV PATH=/opt/maven/bin:/usr/lib/jvm/msopenjdk-21-amd64/bin:/opt/gradle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    M2_HOME=/opt/maven \
    JAVA_HOME=/usr/lib/jvm/msopenjdk-21-amd64 \
    GRADLE_HOME=/opt/gradle

# 将 install.sh 复制到容器中
COPY install.sh /install.sh


RUN    apt update &&    apt install dos2unix -y && apt clean && rm -rf /var/lib/apt/lists/*

RUN bash -c "find . -maxdepth 1 -type f -name \"*.sh\" -exec dos2unix {} \;"
# 执行安装脚本
RUN chmod +x /install.sh && /install.sh

# 清理临时文件
RUN apt clean && rm -rf /var/lib/apt/lists/*  && rm -rvf /install.sh

# 验证安装
CMD ["bash"]