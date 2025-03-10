FROM node:10.16-alpine
WORKDIR /opt/mre
ENV PORT 80
ENV BASE_URL=https://wear-a-hat.herokuapp.com


COPY package*.json ./
RUN ["npm", "install", "--unsafe-perm"]

COPY tsconfig.json ./
COPY src ./src/
RUN ["npm", "run", "build-only"]

COPY public ./public/

EXPOSE 3901/tcp
CMD ["npm", "start"]