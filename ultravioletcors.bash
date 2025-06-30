#!/bin/bash

# Define the local port and the target server
LOCAL_PORT=8080
TARGET_SERVER="example.com"
TARGET_PORT=80

# Start the proxy using socat
socat TCP-LISTEN:$LOCAL_PORT,fork TCP:$TARGET_SERVER:$TARGET_PORT &

echo "Proxy server running on port $LOCAL_PORT, forwarding to $TARGET_SERVER:$TARGET_PORT"
wait
sudo apt-get install socat
chmod +x proxy.sh
#!/bin/bash

# Configuration
LOCAL_PORT=8080
TARGET_SERVER="example.com"
TARGET_PORT=80
LOG_FILE="proxy.log"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

# Start the proxy server
log_message "Starting proxy server on port $LOCAL_PORT, forwarding to $TARGET_SERVER:$TARGET_PORT"

while true; do
    # Listen for incoming connections
    { 
        # Read the request
        read request
        log_message "Received request: $request"

        # Parse the request method and URL
        METHOD=$(echo $request | awk '{print $1}')
        URL=$(echo $request | awk '{print $2}')

        # Handle GET requests
        if [[ "$METHOD" == "GET" ]]; then
            echo "HTTP/1.1 200 OK"
            echo "Content-Type: text/plain"
            echo ""
            echo "Forwarding GET request to $URL"
            curl -s "$URL"

        # Handle POST requests
        elif [[ "$METHOD" == "POST" ]]; then
            read -r -d '' body
            echo "HTTP/1.1 200 OK"
            echo "Content-Type: text/plain"
            echo ""
            echo "Forwarding POST request to $URL with body:"
            echo "$body"
            curl -s -X POST -d "$body" "$URL"

        else
            echo "HTTP/1.1 400 Bad Request"
            echo "Content-Type: text/plain"
            echo ""
            echo "Unsupported request method: $METHOD"
        fi
    } | nc -l -p $LOCAL_PORT
done
#!/bin/bash

# Configuration
LOCAL_PORT=8080
TARGET_SERVER="example.com"
TARGET_PORT=80
LOG_FILE="proxy.log"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

# Start the proxy server
log_message "Starting proxy server on port $LOCAL_PORT, forwarding to $TARGET_SERVER:$TARGET_PORT"

while true; do
    # Listen for incoming connections
    { 
        # Read the request
        read request
        log_message "Received request: $request"

        # Parse the request method and URL
        METHOD=$(echo $request | awk '{print $1}')
        URL=$(echo $request | awk '{print $2}')

        # Handle GET requests
        if [[ "$METHOD" == "GET" ]]; then
            echo "HTTP/1.1 200 OK"
            echo "Content-Type: text/plain"
            echo ""
            echo "Forwarding GET request to $URL"
            curl -s "$URL"

        # Handle POST requests
        elif [[ "$METHOD" == "POST" ]]; then
            read -r -d '' body
            echo "HTTP/1.1 200 OK"
            echo "Content-Type: text/plain"
            echo ""
            echo "Forwarding POST request to $URL with body:"
            echo "$body"
            curl -s -X POST -d "$body" "$URL"

        else
            echo "HTTP/1.1 400 Bad Request"
            echo "Content-Type: text/plain"
            echo ""
            echo "Unsupported request method: $METHOD"
        fi
    } | nc -l -p $LOCAL_PORT
done
