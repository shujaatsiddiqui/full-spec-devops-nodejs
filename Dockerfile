FROM node:12 AS ui-build

WORKDIR /usr/src/app

COPY ./client  ./client/

RUN cd client && npm install && npm run build

FROM node:12 AS server-build
WORKDIR /root/
COPY --from=ui-build /usr/src/app/client/build ./client/build
COPY package*.json ./
RUN  npm install
RUN  npm install -g nodemon
COPY server.js ./

EXPOSE 5000

ENTRYPOINT ["npm","run"]
CMD ["start"]
