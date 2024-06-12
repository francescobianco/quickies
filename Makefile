

start:
	docker compose up --build --force-recreate

push:
	git add .
	git commit -am "update"
	git push
