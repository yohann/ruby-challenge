# B2B STACK - Developer Ruby Backend

<br />

## Project Guidelines
Create an API that allows users to manage their TO-DO list
Provide API documentation

<br />

## Dependencies
The API must have
  - Ruby 3.0.0
  - Rails 7.0.3
  - PostgreSQL 12.10

<br />

## Installation
### Instal gems
```
bundle install
```

### Create database
```
bundle exec rails db:create
bundle exec rails db:schema:load
```

## API Endpoints
### List tasks
`GET /tasks`
Parameters:
- `page` page number
- `per_page` number of items per page
- `status` filter by status
  - Values: 
    - `created`
    - `read`
    - `executed`
- `archived` true or false (will not return archived tasks unless is set to `true`)
Example:
```
http://localhost:3000/tasks?page=1&per_page=10&status=created
```


### Create tasks
```
POST /tasks
{
    "task": {
        "title": #task title
    }   
}
```

### Update tasks
```
PATCH /tasks/{#id}
{
    "task": {
        "status": # status (created, read or executed)
        "archived": # true or false
    }   
}
```
May return HTTP status 404 when task with id could not be found

### Delete tasks
```
DELETE /tasks/{#id}
```
May return HTTP status 404 when task with id could not be found
