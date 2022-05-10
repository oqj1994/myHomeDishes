postgres:
	docker run -itd --name postgres12 -p 5432:5432 -e POSTGRES_PASSWORD=123456 -e POSTGRES_USER=root postgres:12-alpine
createdb:
	docker exec -it postgres12 createdb  --username=root --owner=root peoplejudgement

dropdb:
	docker exec -it postgres12 dropdb   peoplejudgement

migrateup:
	migrate -path db/migration -database "postgresql://root:123456@localhost:5432/peoplejudgement?sslmode=disable" --verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:123456@localhost:5432/peoplejudgement?sslmode=disable" --verbose down
sqlc:
	sqlc generate
.PHONY:createdb dropdb  postgres sqlc