# 使用官方 Node.js 作為基礎映像
FROM node:18

# 設置工作目錄
WORKDIR /app

# 安裝 pnpm
RUN npm install -g pnpm


# 設置 pnpm 儲存目錄
RUN pnpm config set store-dir /app/.pnpm-store --global


# 複製 package.json 和 pnpm-lock.yaml 到容器中
COPY package.json pnpm-lock.yaml ./

# 安裝應用程序依賴
RUN pnpm install

# 複製應用程序代碼到容器中
COPY . .

# 構建應用
RUN pnpm run build

# 暴露應用程序端口
EXPOSE 3000

# 啟動應用程序
CMD ["pnpm", "run", "start"]
