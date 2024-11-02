# Blog & Post Management API

This project is a Laravel-based RESTful API that enables CRUD operations for blogs and posts, with interactive features like liking and commenting on posts. 

## Features

- CRUD operations for **Blogs**
- CRUD operations for **Posts** under specific blogs
- **Like** and **Comment** features for posts
- **Token-based Middleware** for route protection
- **Database Seeder** to create sample data

## Technology Stack

- **Backend**: PHP (Laravel 10)
- **Database**: MySQL
- **Token Authentication**: Custom token middleware

## Requirements

- PHP 8.1 or higher
- Composer
- MySQL (or any other database supported by Laravel)
- Postman (or any API testing tool)

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/oluwagreat/vg-blog.git
cd vg-blog
```

### 2. Install Dependencies

Run the following command to install project dependencies:

```bash
composer install
```

### 3. Set Up Environment Variables

Copy the example `.env` file and configure the necessary environment variables:

```bash
cp .env.example .env
```

Update the following fields in `.env`:

```plaintext
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database_name
DB_USERNAME=your_database_username
DB_PASSWORD=your_database_password
```

### 4. Generate Application Key

Generate the application key with:

```bash
php artisan key:generate
```

### 5. Run Migrations and Seeders

Run the migrations to create the necessary database tables, and then seed the database to create sample data:

```bash
php artisan migrate --seed
```

### 6. Run the Application

Start the development server:

```bash
php artisan serve
```

The application will be accessible at `http://127.0.0.1:8000`.

### 7. Token Middleware

All API routes are protected by a token middleware. Add the following header to all API requests:

- **Header**: `Authorization`
- **Value**: `vg@123`

If this token is not provided, the API will return a `401 Unauthorized` response.

## API Endpoints

Below are the main endpoints for managing blogs, posts, and interactions. All endpoints return JSON responses.

### Blog Endpoints

- `GET /api/blogs` - View all blogs
- `POST /api/blogs` - Create a new blog
- `GET /api/blogs/{id}` - View details of a specific blog and its posts
- `PUT /api/blogs/{id}` - Update an existing blog
- `DELETE /api/blogs/{id}` - Delete a blog

### Post Endpoints

- `GET /api/blogs/{blog_id}/posts` - View all posts under a specific blog
- `POST /api/blogs/{blog_id}/posts` - Create a new post under a specific blog
- `GET /api/blogs/{blog_id}/posts/{id}` - View details of a specific post and its interactions
- `PUT /api/blogs/{blog_id}/posts/{id}` - Update an existing post
- `DELETE /api/blogs/{blog_id}/posts/{id}` - Delete a post

### Interaction Endpoints

- `POST /api/posts/{post_id}/like` - Like a specific post
- `POST /api/posts/{post_id}/comment` - Comment on a specific post

## Testing API Endpoints

A Postman collection has been provided to test all endpoints. To import:

1. Open Postman.
2. Go to `File` > `Import`.
3. Select the Postman collection file (`vg_blog.postman_collection.json`) provided in the project repository.

## Additional Information

### Database Structure

1. **Blogs Table**: Stores blogs with fields like title and description.
2. **Posts Table**: Stores posts under blogs, with fields like title, content, image URL, etc.
3. **Likes Table**: Stores likes associated with posts.
4. **Comments Table**: Stores comments associated with posts.

### Folder Structure

This project follows the Laravel MVC (Model-View-Controller) structure. Models, Controllers, and Routes are organized under their respective directories in the `app` and `routes` folders.

## License

This project is open-source and available under the MIT License.
