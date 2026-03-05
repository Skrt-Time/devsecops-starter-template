build:
	docker build -t devsecops-template -f docker/Dockerfile .

run:
	docker run -p 8000:8000 devsecops-template

test:
	curl http://localhost:8000/health
