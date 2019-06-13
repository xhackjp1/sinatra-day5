require './mydatabase'

Mydatabase.exec("
  CREATE TABLE myfavorite (
    id serial,
    name text,
    comment text,
    commented_at timestamp,
    PRIMARY KEY (id)
  );"
)
