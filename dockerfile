# Use the official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project
COPY . /app/

# Expose the port Django runs on
EXPOSE 8000

# Run the application
CMD ["gunicorn", "bioblast.wsgi:application", "--bind", "0.0.0.0:8000"]
