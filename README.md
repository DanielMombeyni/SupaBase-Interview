# SupaBase-Interview

## Part 1: Database Design and Implementation

### Tables

#### Authors

- `author_id`: Primary Key
- `name`: Name of the author
- `country`: Country of the author

#### Books

- `book_id`: Primary Key
- `title`: Title of the book
- `author_id`: Foreign Key referencing `Authors`
- `price`: Price of the book
- `publish_date`: Date of publication

## Part 2: RESTful Edge Function

### Setup Instructions

1. Initialize Supabase Project

    ##### If you haven't already initialized your Supabase project, you can do so by installing the Supabase CLI and running the following commands

    ```bash
    npx supabase init
    npx supabase start
    ```
2. Create Edge Function

   ##### Create a new Deno script or TypeScript file for your Supabase Edge Function. You can name it booksEndpoint.ts or any suitable name.

   - Create a new Deno script or TypeScript file for your Supabase Edge Function. You can name it `booksEndpoint.ts` or any suitable name.
   - Copy the provided Supabase Edge Function code into your file.

3. Set Environment Variables

    ##### Ensure you have the following environment variables set in your environment or in a .env file in your project directory:

    ```bash
    SUPABASE_URL=https://your-supabase-url.supabase.co
    SUPABASE_ANON_KEY=your-supabase-anon-key
    ```

    ##### Replace `your-supabase-url`, `your-supabase-anon-key` with your actual Supabase project URL, anonymous key respectively.

### API Endpoint

- Endpoint: POST /getBooks

    - Optional Query Parameters:
        - `author_id`: Filter by `author ID`.
        - `sort`: Sort by column (default: `publish_date`).
        - `page`: Page number (default: `1`).
        - `pageSize`: Number of results per page (default: `10`).


## Part 3: Queries

1. Find all authors who have published more than 5 books.

   ```sql
    SELECT a.name, COUNT(b.book_id) AS book_count
    FROM authors a, books b
    WHERE a.author_id = b.author_id
    GROUP BY a.author_id, a.name
    HAVING COUNT(b.book_id) > 5;
   ```

    #### Explanation:

     - This query selects the `name` from `authors` and counts the `book_id` from `books`.
     - It joins `authors` and `books` on `author_id`.
     - Groups results by `author_id` and `name` and filters to show only those with more than 5 books.

2. Calculate the average book price for each country.

    ```sql
    SELECT a.country, AVG(b.price) AS avg_price
    FROM authors a, books b
    WHERE a.author_id = b.author_id
    GROUP BY a.country;
    ```

    #### Explanation:
    - This query selects `country` from `Authors` and calculates the average `price` from `Books`.
    - Joins `Authors` and `Books` on `author_id`.
    - Groups results by `country` and calculates the average `price` for each country.

3. Retrieve a list of books with author names, sorted by price in descending order, and filterable by a specific year of publication.

    ```sql
    SELECT b.title, b.price, b.publish_date, a.name AS author_name
    FROM Books b, Authors a
    WHERE b.author_id = a.author_id
      AND EXTRACT(YEAR FROM b.publish_date) = 2023
    ORDER BY b.price DESC;
    ```

    #### Explanation:
    - This query selects `title`, `price`, `publish_date`, and `name` from `Books` and `Authors`.
    - Joins `Books` and `Authors` on `author_id`.
    - Filters results to include only books published in `2023`.
    - Sorts results by `price` in descending order (`DESC`).

