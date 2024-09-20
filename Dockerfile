# Use Node.js 14 (Alpine for smaller image)
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json first (to leverage Docker cache)
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy the rest of the application code to the container
COPY . .

# Build the app
RUN npm run build

# Environment variable for NetflixMovieCatalog API
ENV MOVIE_CATALOG_SERVICE=http://localhost:8080

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
