# Serve GitBook

Serve GitBook is a FastAPI-based service that fetches content from a GitBook space. This service allows you to retrieve GitBook content in different formats via a simple API.

## Features

- Fetch content from GitBook using the GitBook API.
- Supports different content formats (e.g., Markdown).
- Deployable via Docker for production environments.

## Prerequisites

Before you start, ensure you have the following installed:

- [Python 3.10+](https://www.python.org/downloads/)
- [Poetry](https://python-poetry.org/docs/#installation) (for dependency management)
- [Docker](https://docs.docker.com/get-docker/) (for containerization)
- [Docker Compose](https://docs.docker.com/compose/install/) (for multi-container management)

## Installation

### Local Setup

1. **Clone the repository**:

   ```bash
   git clone https://github.com/rijumone/serve-gitbook.git
   cd serve-gitbook
   ```

2. **Set up your environment**:

   Ensure you have the `GITBOOK_ACCESS_TOKEN` environment variable set:

   ```bash
   export GITBOOK_ACCESS_TOKEN=your_access_token_here
   ```

3. **Install dependencies**:

   Use Poetry to install the project dependencies:

   ```bash
   poetry install
   ```

4. **Run the service locally**:

   Start the FastAPI application using Uvicorn:

   ```bash
   poetry run uvicorn serve_gitbook.main:app --reload
   ```

   The service will be available at `http://127.0.0.1:8000`.

### Docker Setup

1. **Build the Docker image**:

   ```bash
   docker build -t serve-gitbook .
   ```

2. **Run the Docker container**:

   ```bash
   docker run -d -p 8000:8000 --name serve-gitbook-container serve-gitbook
   ```

   The service will be accessible at `http://localhost:8000`.

### Docker Compose Setup

For easier management in a production environment, you can use Docker Compose.

1. **Create a `.env` file**:

   In the root directory, create a `.env` file and add your environment variables:

   ```bash
   touch .env
   ```

   Add your GitBook access token:

   ```env
   GITBOOK_ACCESS_TOKEN=your_access_token_here
   ```

2. **Start the service using Docker Compose**:

   ```bash
   docker-compose up --build -d
   ```

   This will build the Docker image (if not already built) and start the container.

3. **Stopping the service**:

   To stop the service, use:

   ```bash
   docker-compose down
   ```

## Usage

Once the service is running, you can fetch content from your GitBook space using the following API endpoint:

### Fetch Content

**GET** `/spaces/{gitbook_space_id}/content/path/{top_path}?format={format}`

- **Parameters**:
  - `gitbook_space_id`: The ID of your GitBook space.
  - `top_path`: The path to the content you wish to retrieve.
  - `format`: (Optional) The format of the content (e.g., `markdown`, `json`). Defaults to `markdown`.

**Example Request**:

```bash
curl "http://localhost:8000/spaces/12345/content/path/introduction?format=markdown"
```

**Example Response**:

```json
{
  "content": "# Introduction\n\nThis is the introduction to our GitBook space..."
}
```

## Deployment

This project is production-ready with Docker and can be deployed on any Docker-compatible infrastructure. Ensure you have properly configured your `.env` file with the necessary environment variables before deploying.

## Troubleshooting

- **Command not found: gunicorn**: Ensure that `gunicorn` is listed in the `pyproject.toml` file under `[project.dependencies]`. Rebuild the Docker image if necessary.
- **Connection issues**: Ensure that your `GITBOOK_ACCESS_TOKEN` is correctly set and valid.

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
```