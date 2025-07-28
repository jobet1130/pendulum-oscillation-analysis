FROM python:3.12-slim

# Install Poetry
RUN pip install poetry==1.8.2

# Set working directory
WORKDIR /app

# Copy only required files
COPY pyproject.toml poetry.lock* ./

# Install dependencies (no project install)
RUN poetry install --no-root --no-interaction

# Copy source code
COPY src/ src/

# Default command (update if you have a different entry point)
CMD ["poetry", "run", "python", "src/main.py"]
