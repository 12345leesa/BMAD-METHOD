# Use official Node.js LTS image
FROM node:22

# Set working directory
WORKDIR /app

# Copy package files for dependencies
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the project
COPY . .

# Expose port
EXPOSE 8080

# Start the agent
CMD ["node", "src/modules/my-first-agent/index.js"]
