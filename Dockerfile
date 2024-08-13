# Use the official Python image as a base image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the pyproject.toml and README.md to the working directory
COPY pyproject.toml README.md /app/

# Install Poetry (a tool for dependency management)
RUN pip install --no-cache-dir poetry gunicorn

# Install the dependencies from pyproject.toml
RUN poetry config virtualenvs.create false && poetry lock && poetry install --no-root

# Copy the rest of the application code
COPY . /app

# Expose the port that FastAPI will run on
EXPOSE 8000

# Run the application using gunicorn with uvicorn workers
CMD poetry run gunicorn -w 4 -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:8000 serve_gitbook.main:app
