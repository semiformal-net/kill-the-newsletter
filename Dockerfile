# Use a Node image for building
FROM node:15 AS build

# Set the working directory
WORKDIR /app

# Clone the repository
RUN git clone --depth 1 --branch v1.0.1 https://github.com/leafac/kill-the-newsletter.git /app/kill-the-newsletter

WORKDIR /app/kill-the-newsletter

# Copy only package.json and package-lock.json first to leverage Docker caching
#COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Run tests and compile TypeScript
RUN npm test && npm run prepare

# Remove development dependencies and other unnecessary files
RUN npm prune --production && \
    rm -rf node_modules/.cache && \
    rm -rf tests && \
    rm -rf .git

# Use a smaller Node image to serve the production build
FROM node:15-alpine AS serve

# Set the working directory in the serve stage
WORKDIR /app

# Copy only the production-ready files from the build stage
COPY --from=build /app/kill-the-newsletter .
COPY configuration.js .

# Expose the appropriate port (update if needed)
EXPOSE 8080
EXPOSE 2525

# Run the binary
CMD ["node", "--max-old-space-size=256", "lib/index.js", "configuration.js" ]

