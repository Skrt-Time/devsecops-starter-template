from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    # Root endpoint to verify the API is running
    return {"message": "Welcome to the DevSecOps Template API!"}

@app.get("/health")
def health_check():
    # Health check endpoint for container orchestration (e.g., Kubernetes)
    return {"status": "Application is healthy."}
