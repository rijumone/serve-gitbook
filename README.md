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
   git clone https://github.com/yourusername/serve-gitbook.git
   cd serve-gitbook
