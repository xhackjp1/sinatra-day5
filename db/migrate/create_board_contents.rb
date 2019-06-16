require './lib/mydatabase'

Mydatabase.exec("
  CREATE TABLE board_contents (
    id serial,
    name text,
    comment text,
    commented_at timestamp,
    PRIMARY KEY (id)
  );"
)
