FROM node:latest
WORKDIR /app
COPY package*.json ./

# generated prisma files
COPY prisma ./prisma/

# COPY ENV variable
#COPY .env ./

# COPY tsconfig.json file
COPY tsconfig.json ./

RUN apt update

RUN apt install git

RUN npm install

# COPY
COPY . .

RUN npx prisma migrate dev --name init

EXPOSE 3000

CMD ["npm", "run", "dev"]