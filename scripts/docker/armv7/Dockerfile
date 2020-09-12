FROM node:14.10

COPY . /app

RUN cd /app && npm install

WORKDIR "/app"

CMD [ "node", "bot.js" ]