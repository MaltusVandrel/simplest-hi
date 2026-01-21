FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN echo "1 AAA"
RUN npm install --production --silent 
RUN echo "2 AAA"
RUN mv node_modules ../
RUN echo "3 AAA"
COPY . .
EXPOSE 3000
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
