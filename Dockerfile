FROM python:3.9-slim

WORKDIR /app

# Copy application files
COPY python_web_application/app.py /app
COPY python_web_application/requirements.txt /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install pytest for running tests
RUN pip install pytest

EXPOSE 5000

CMD ["python", "app.py"]
