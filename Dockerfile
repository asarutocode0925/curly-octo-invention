# Build with devDependencies available (Vite is a devDependency), then prune them.
FROM node:20-alpine

WORKDIR /app

COPY package.json ./
RUN npm install --include=dev --no-audit --no-fund

COPY . .
RUN npm run build

ENV NODE_ENV=production \
    PORT=8080
RUN npm prune --omit=dev --no-audit --no-fund

EXPOSE 8080
CMD ["npm", "start"]
