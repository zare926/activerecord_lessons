-- usersテーブルがあればドロップしてくださいという記述
drop table if exists users;
create table users (
  id integer primary key,
  name text,
  age integer,
  created_at,
  update_at
);

drop table if exists comments;
create table comments (
  id integer primary key,
  user_id integer,
  body text,
  created_at,
  update_at
);



