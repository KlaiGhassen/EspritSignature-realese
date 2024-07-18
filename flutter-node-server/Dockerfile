FROM node:16

LABEL maintainer="ghassen klai <aghassen.klai@esprit.tn>"

# Create the app directory and set permissions
RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

# Set the working directory
WORKDIR /home/node/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Set ownership of the app files
RUN chown -R node:node /home/node/app

# Switch to the node user
USER node

# Start the application
CMD ["node", "index.js"]

# Expose the application port
EXPOSE 3001
