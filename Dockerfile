FROM node:lts-alpine
# Set the working directory to /verdaccio
WORKDIR /verdaccio

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Verdaccio
RUN npm install
RUN npm install -g verdaccio

# Copy Verdaccio configuration
COPY config.yaml .

# Expose the default Verdaccio port
EXPOSE 80

# Start Verdaccio
CMD ["npx", "verdaccio", "--config", "config.yaml"]