FROM node:14.2.0 as builder
LABEL application="react-app"
LABEL owner="raja"
RUN mkdir /code
WORKDIR /code
COPY package*.json ./
RUN npm install
COPY . .
run yarn build
# CMD ["npm","start"]
#EXPOSE 3000
#CMD ["npm","start"]

#stage 2

from nginx
copy --from=builder /code/build/ /usr/share/nginx/html
