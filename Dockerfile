FROM node:14.2.0
LABEL application="react-app"
LABEL owner="raja"
RUN mkdir /code
WORKDIR /code
COPY package*.json ./
RUN npm install
COPY . .
# CMD ["npm","start"]
EXPOSE 3000
CMD ["npm","start"]
