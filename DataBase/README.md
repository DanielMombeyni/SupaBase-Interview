### Tables Structures:

#### Authors

```sql
    CREATE TABLE IF NOT EXISTS authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
    );
```


#### Books

```sql
    CREATE TABLE IF NOT EXISTS books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INTEGER NOT NULL REFERENCES authors(author_id),
    price NUMERIC(10, 2) NOT NULL,
    publish_date DATE NOT NULL
);
```
