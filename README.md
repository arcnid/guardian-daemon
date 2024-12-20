# Guardian Daemon

The Guardian Daemon is an event-driven, scalable, and fault-tolerant background service designed to process messages from an MQTT broker and store structured data into Supabase. It dynamically scales workers based on the load, handles batch inserts efficiently, and gracefully shuts down when needed.

## Features

- **Dynamic Worker Scaling**: Automatically scales workers based on task queue size.
- **MQTT Integration**: Subscribes to all MQTT topics and processes incoming messages.
- **Supabase Integration**: Stores parsed messages in a Supabase database.
- **Batch Processing**: Efficiently processes messages in batches to optimize database writes.
- **Graceful Shutdown**: Cleans up resources and processes remaining tasks on termination signals.
- **Fault Tolerance**: Handles errors gracefully without affecting the daemon's operations.

## Requirements

- **Go 1.20+**
- **Docker and Docker Compose** (optional for containerization)
- **Supabase Account**: For database storage
- **MQTT Broker**: Such as Eclipse Mosquitto

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/guardian-daemon.git
   cd guardian-daemon
   ```

### 2. Set Up Environment Variables

Create a `.env` file in the root directory and add the following:

```env
SUPABASE_URL=https://your-supabase-url.supabase.co
SUPABASE_KEY=your-supabase-key
```

### 3. Install Dependencies

Ensure you have Go installed. Run the following command to install dependencies:

```bash
go mod download
```

### 4. Run the Daemon Locally

Run the application locally:

```bash
go run main.go
```

## Docker Setup

### 1. Build the Docker Image

Ensure you have a `Dockerfile` and `docker-compose.yml` in the project directory. Then build the Docker image:

```bash
docker-compose build
```

### 2. Run the Daemon with Docker Compose

```bash
docker-compose up -d
```

### 2. Verify the Containers

```bash
docker ps
```

View logs to ensure everything is working correctly:

```bash
docker-compose logs -f
```
