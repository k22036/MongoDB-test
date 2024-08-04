build:
	docker build -t app .

start:
	docker run -p 8000:8000 app