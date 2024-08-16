# Use the official Node.js 18 image as the base image
FROM node:18

# Create and change to the app directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port (change the port number if needed)
EXPOSE 3000

# Command to run your application
CMD ["npm", "run", "dev"]
