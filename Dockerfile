FROM python:3.11-slim

WORKDIR /app

# Install system dependencies for Qiskit
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

# Install Python dependencies (includes Qiskit - this takes time!)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy ALL application files
COPY quantum_terminal_demo.py .
COPY quantum_lattice_core.py .
COPY app.py .

# Expose port
EXPOSE 7860

# Run the REAL quantum app
CMD ["python", "app.py"]
