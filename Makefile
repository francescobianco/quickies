

start:
	docker compose up -d

push:
	git add .
	git commit -am "update"
	git push
