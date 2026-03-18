FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

# Install Python dependencies (lightweight - no Qiskit)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY quantum_simple.py .
COPY app.py .

# Expose port
EXPOSE 7860

# Run the app
CMD ["python", "app.py"]
