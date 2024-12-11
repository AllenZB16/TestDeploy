# Use a lightweight Node.js image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# Install dependencies using Yarn
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the application for production
RUN yarn build

# Expose the port your app runs on
EXPOSE 3000

# Start the app using a static file server
RUN yarn global add serve
CMD ["serve", "-s", "build", "-l", "3000"]
