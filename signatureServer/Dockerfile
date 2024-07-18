FROM node:16

LABEL maintainer="ghassen klai<aghassen.klai@esprit.tn>"

RUN mkdir -p /home/node/app/utils && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install --production

COPY . .
# Copy utils folder
COPY utils /home/node/app/utils

RUN chown -R node:node /home/node/app

USER node

# Ensure MongoDB is up and running before seeding the database
CMD ["sh", "-c", "node utils/seed.js && node server.js"]

EXPOSE 3000
