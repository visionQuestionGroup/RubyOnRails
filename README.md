# API

## Sign up and Login

### New user registration

* Path: POST `'/users/register'`

* Parameters:
	* username: a string
  * password: a string
  * first_name: a string
  * last_name: a string
  * email: a string
  * password: a string

* Response success
  * Status Code: 201

* Example data response:

```
{
	"username": "whatever",
	"first_name": "rickard",
	"last_name": "sunden",
	"email": "hey@hey.com",
	"password": "mypassword"
}
```

* Response failure
  * Status Code: TBD

* Example:

```
{
	"username": "whatever",
	"token": "102931afffksdfjklss",
}
```

### Login user

Need to check with instructor/our group

### Logout user

Need to check with instructor/our group

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

### List all of posts from specific user

* Path: GET `'/:username/posts/'`

### Lists of posts from all users

* Path: GET `'/posts/'`

* PAGINATION???
  * Will probably add.

* Response success:
  * Status code: 200

* Example data response:

```
{
  "id": 1,
  "username": "whatever",
  "image_url": "http://whatever.com/image.jpg",
  "post_url": "/posts/33",
  "guessed": true
}
```

## Guesses

### User can guess

* Path: POST `'/:username/posts/:link_id/'`

* Response success:
  * Status code: 200

* Example data response:

```
{
  "username": "whatever",
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