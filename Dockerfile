# Use Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install all dependencies (dev + prod)
RUN npm install

# Optional: remove devDependencies to make image smaller
RUN npm prune --production

# Copy rest of the project
COPY . .

# Expose port if needed
EXPOSE 3000

# Start the app
CMD ["node", "src/modules/my-first-agent/index.js"]

WORKDIR /app
COPY package*.json ./

# Disable husky hooks in container
ENV HUSKY=0
RUN npm install --production



