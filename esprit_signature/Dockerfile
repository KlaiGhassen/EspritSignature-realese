# Use the official Dart image as a base
FROM dart:stable AS build

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Pre-download Flutter dependencies
RUN flutter precache

# Enable Flutter web
RUN flutter config --enable-web

# Copy the project files
COPY . /app
WORKDIR /app

# Fetch the dependencies
RUN flutter pub get

# Build the project
RUN flutter build web --web-renderer html --release 

# Use a web server to serve the app (e.g., nginx)
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose the port
EXPOSE 80

# Start the nginx server
CMD ["nginx", "-g", "daemon off;"]
