# Use a base image with Ubuntu
FROM ubuntu:latest

# Install git, sudo, fortune-mod, and cowsay
RUN apt-get update \
    && apt-get install -y \
        git \
        sudo \
        fortune-mod \
        cowsay \
    && rm -rf /var/lib/apt/lists/*

# Clone the GitHub repository
RUN git clone https://github.com/Nachikeths99/wisecow1.git /app

# Copy wisecow.sh into the container
COPY wisecow.sh /app

# Set working directory
WORKDIR /app

# Set execute permission on the script
RUN chmod +x wisecow.sh

# Expose port 4499
EXPOSE 4499

# Default command to run when the container starts
CMD ["./wisecow.sh"]
