FROM golang:1.21-alpine

# Set the working directory
WORKDIR /app

# Initialize go.mod if it doesn't exist
RUN if [ ! -f go.mod ]; then go mod init goverifier; fi

# Copy the project files into the container
COPY . .

# Install dependencies and build the Go app, specifying the correct output location
RUN go mod tidy && go build -o /app/goverifier .

# Expose the necessary port (update if needed)
EXPOSE 8080

# Set the entry point to the built executable
ENTRYPOINT ["/app/goverifier"]
