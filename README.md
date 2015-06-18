# API

## Access Token

Every request requires an authentication token to be provided in the header.

To do this make sure you set 'Access-Token' equal to the user's access token in EVERY request.

```
['Access-Token'] = '1aB234cDhJks82jaC'

```

## Sign up and Login

### New user registration

Path:

`POST '/users/register'`

Parameters:

| name       | type   | description                              |
|------------|--------|------------------------------------------|
| username   | string | username for user to be created          |
| password   | string | password has to be at least 8 characters |
| first_name | string | first name of user to be created         |
| last_name  | string | last name of user to be created          |
| email      | string | email of user to be created              |


Example data successful response:

```json
Response Status Code: 201

{
  "username": "whatever",
  "access_token": "102931afffksdfjklss",
  "first_name": "John",
  "last_name": "Doe",
  "email": "johndoe@gmail.com"
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

### User login

Path:

`POST '/users/login'`

Parameters:

| name     | type   | description                                                 |
|----------|--------|-------------------------------------------------------------|
| username | string | username for the user you want get authentication key for   |
| password | string | password for the user you want get authentication token for |

Example data successful response:

```json
Response Status Code: 200 (TBD)

{
  "username": "whatever",
  "access_token": "102931afffksdfjklss"
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

## Posts

### Create post

Path: 

`POST '/posts/new'`

Parameters

| name      | type   | description                            |
|-----------|--------|----------------------------------------|
| username  | string | username of the user creating the post |
| image_url | string | url for the image of the post          |
| answer    | string | answer for the post                    |

Example data successful response:

```json
Response Status Code: 201

{
	"image_url": "http://whatever.com/image.jpg",
	"username": "whatever",
	"answer": "This is the answer"
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

### Show a specific post of a user

Path:

`GET '/:username/posts/:id'`

Example data successful response:

```json
Response Status Code: 200

{
  "post_id": 33,
  "username": "whatever",
  "image_url": "http://whatever.com/image.jpg",
  "post_url": "/posts/33"
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

### List all of posts from specific user

Path: 

`GET '/:username/posts/'`

Example data successful response:

```json
Response Status Code: 200

[
{
  "post_id": 33,
  "username": "whatever",
  "image_url": "http://whatever.com/image.jpg",
  "post_url": "/posts/33"
}
{
  "post_id": 34,
  "username": "whatever",
  "image_url": "http://whatever.com/image2.jpg",
  "post_url": "/posts/34"
}
]
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

### Lists of posts from all users

Path:

`GET '/posts/'`

Parameters:

| name | type    | description             |
|------|---------|-------------------------|
| page | integer | NOT CURRENTLY SUPPORTED |

Example data successful response:

```json
Response Status Code: 200

[
{
  "post_id": 1,
  "username": "whatever",
  "image_url": "http://whatever.com/image.jpg",
  "post_url": "/posts/1",
  "guessed": true,
  "guessed_by": "heynowbrowncow"
}
{
  "post_id": 55,
  "username": "bestusernamever",
  "image_url": "http://whatever.com/image11.jpg",
  "post_url": "/posts/55",
  "guessed": false,
  "guessed_by": null
}
]
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

## Guesses

### User can guess

Path: 

`POST '/:username/posts/:link_id/'`

Parameters:

| name  | type   | description                            |
|-------|--------|----------------------------------------|
| guess | string | username of the user creating the post |

Example data successful response:

```json
Response Status Code: 201

{
  "username": "whatever",
  "link_id": 22,
  "guesses_left": 3,
  "won": false
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```

## Scoreboard

### Get top 10 users for all time

Path: 

`GET '/topscores/'`

Example data successful response:

```json
Response Status Code: 200

[
{
  "username": "whatever",
  "score": 20
}
{
  "username": "anotheruser",
  "score": 40
}
]
```

Example data failure response:

```json
Response Status Code: TBD

{
  "error": "TBD"
}
```