# Use an existing base image as a starting point
FROM debian:bookworm-slim

# Set the working directory inside the container
WORKDIR /autoseller

# Copy the rest of the application code into the container
COPY . .

# Expose a port the container listens on
EXPOSE 8005

# Specify the command to run when the container starts
CMD ["bash"]
