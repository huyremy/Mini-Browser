FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Tạo user thường
RUN useradd -m appuser

RUN apt-get update && apt-get install -y \
    curl \
    nodejs \
    npm \
    ttyd \
    libnss3 \
    libatk-bridge2.0-0 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libatk1.0-0 \
    libcups2 \
    libdrm2 \
    libxfixes3 \
    libxext6 \
    libxrender1 \
    libxkbcommon0 \
    libpango-1.0-0 \
    libcairo2 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g carbonyl

WORKDIR /app
COPY app.sh .

RUN chmod +x app.sh
RUN chown -R appuser:appuser /app

# chạy bằng user thường
USER appuser

CMD ["ttyd", "-p", "7860", "./app.sh"]
#CMD ["sh", "-c", "ttyd --port ${PORT:-7860} --check-origin=false ./app.sh"]