FROM node:fermium-alpine3.12 as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM node:fermium-alpine3.12
WORKDIR /opt/
COPY --from=builder /app/dist/index.js .
ENTRYPOINT [ "node", "/opt/index.js" ]