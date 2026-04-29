FROM node:20

WORKDIR /app

COPY frontend/package*.json ./frontend/
COPY backend/package*.json ./backend/

WORKDIR /app/frontend
RUN npm install
COPY frontend .
RUN npm run build

WORKDIR /app/backend
RUN npm install
COPY backend .

EXPOSE 5000

CMD ["npm","start"]