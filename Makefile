

start:
	@docker compose up -d --build --force-recreate --remove-orphans
	@echo
	@echo "Visit: <http://localhost:8000/>"
	@echo "Admin: <http://localhost:8000/admin/>"

push:
	git add .
	git commit -am "update"
	git push

test-entrypoint:
	rm -f data/quickies.db
	docker compose up --build --force-recreate
