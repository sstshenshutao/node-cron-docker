FROM node:10.19.0

EXPOSE 8080/tcp

RUN npm install --global http-server


ADD ./a.js /etc/xxx/a.js
ADD ./a.json /etc/xxx/a.json
ADD ./index.html /etc/xxx/index.html
ADD ./package.json /etc/xxx/package.json
WORKDIR /etc/xxx
RUN npm install

# crontab job
RUN apt-get update && apt-get install cron -y
RUN (crontab -l 2>/dev/null; echo "*/10 * * * * /usr/local/bin/node /etc/xxx/a.js") | crontab -
RUN chmod 777 /etc/xxx/a.json
RUN chmod 777 /etc/xxx/a.js

ENTRYPOINT /etc/init.d/cron start && http-server /etc/xxx/
