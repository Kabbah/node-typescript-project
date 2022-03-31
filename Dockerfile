FROM node:16-alpine AS build

WORKDIR /build
COPY package*.json ./
RUN npm ci

COPY tsconfig*.json ./
COPY src ./src
RUN npm run build


FROM node:16-alpine

ENV NODE_ENV=production

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY --from=build /build/dist ./dist

ENTRYPOINT ["node", "dist/index.js"]
