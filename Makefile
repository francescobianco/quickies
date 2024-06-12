

start:
	docker compose up -d --build --force-recreate

push:
	git add .
	git commit -am "update"
	git push

test-entrypoint:
	rm -f data/quickies.db
	docker compose up --build --force-recreate
