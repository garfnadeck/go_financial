createDb:
	createdb --username=postgres --owner=postgres go_finance

postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres:14-alpine

migrationUp:
	migrate migrate -path db/migration -database "postgres://postgres:postgres@localhost:5432/go_finance?sslmode=disable" -verbose up

migrationDrop:
	migrate migrate -path db/migration -database "postgres://postgres:postgres@localhost:5432/go_finance?sslmode=disable" -verbose drop

.PHONY: createDb postgres