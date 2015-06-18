# API

## Access Token
* Every request requires an authentication token to be provided in the header.
* Access_Token

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


Example data response:

```json
Response Status Code: 201

{
  "username": "whatever",
  "access_token": "102931afffksdfjklss",
  "first_name": "John",
  "last_name": "Doe",
  "email": "johndoe@gmail.com",
}
```

* Response failure
  * Status Code: TBD

* Example:

```
{


}
```

### User login

* Path: POST `'/users/login'`

* Parameters:
  * username: a string
  * password: a string


* Response success
  * Status Code: 200

* Example data response:

```
{
  "username": "whatever",
  "access_token": "102931afffksdfjklss"
}
```

## Posts

### Create post

* Path: POST `'/posts/new'`

* Params:
  * image_url: a string url
  * username: a string
  * answer: a string

* Response success:
  * Status code: 201

* Example data response:

```
{
	"image_url": "http://whatever.com/image.jpg",
	"username": "whatever"
	"answer": "This is the answer"
}
```

### Show a specific post of a user

* Path: GET `'/:username/posts/:id'`

* Response success:
  * Status code: 200

* Example data response:

{
  "post_id": 33,
  "username": "whatever",
  "image_url": "http://whatever.com/image.jpg"
  "post_url": "/posts/33"
}

### List all of posts from specific user

* Path: GET `'/:username/posts/'`

* Response success:
  * Status code: 200

* Example data response:

```
[
{
  "post_id": 33,
  "username": "whatever",
  "image_url": "http://whatever.com/image.jpg"
  "post_url": "/posts/33"
}
{
  "post_id": 34,
  "username": "whatever",
  "image_url": "http://whatever.com/image2.jpg"
  "post_url": "/posts/34"
}
]
```

### Lists of posts from all users

* Path: GET `'/posts/'`

* PAGINATION???
  * Will probably add.

* Response success:
  * Status code: 200

* Example data response:

```
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
  "guessed_by": nil
}
]
```

## Guesses

### User can guess

* Path: POST `'/:username/posts/:link_id/'`

* Params:
  * guess: a string

* Response success:
  * Status code: 201

* Example data response:

```
{
  "username": "whatever",
  "link_id": 22,
  "guesses_left": 3,
  "won": false
}
```

## Scoreboard

### Get top 10 users for all time

* Path: GET `'/topscores/'`

* Response success:
  * Status code: 200


* Example data response:

```
[
{
  "username": "whatever",
  "score": 20,
}
{
  "username": "anotheruser",
  "score": 40,
}
]
```