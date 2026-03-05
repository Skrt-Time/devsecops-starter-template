# 1. Use a lightweight base image to reduce the attack surface
FROM python:3.10-slim

# 2. Prevent running the application as 'root' for security reasons
# Create a non-root system user named 'appuser'
RUN adduser --disabled-password --gecos '' appuser

# 3. Set the working directory inside the container
WORKDIR /app

# 4. Copy only the requirements file first to leverage Docker cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application source code
COPY src/ .

# 6. Change ownership of the application files to our non-root user
RUN chown -R appuser:appuser /app

# 7. Switch to the non-root user
USER appuser

# 8. Expose the port the app runs on
EXPOSE 8000

# 9. Define the command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
