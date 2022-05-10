-- name: CreateAccount :one
INSERT INTO accounts (
  user_name,password_hash 
) VALUES (
  $1, $2)
  RETURNING *;

-- name: GetAccount :one
SELECT * FROM accounts
where id = $1  limit 1;


-- name: DeleteAccount :exec
DELETE FROM accounts 
where id = $1 ;

-- name: UpdateAccount :one
update accounts set user_name=$1 ,password_hash=$2 where id = $3 RETURNING *;

-- name: GetCommentsByID :many
select * from comments c where c.reviewers_id = $1;

-- name: GetUploadPeopleList :many
select user_name , p.name as  people_name from accounts a  inner join  peoples p on a.id = p.reviewers_id group by p.name; 