# API

## New user registration

* Path: POST `'/users/register'`

* Params:
	* username: a string
  * password: a string
  * first_name: a string
  * last_name: a string
  * email: a string
  * password: a string

* Response success
  * Status Code: 201

* Example:

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

## Create post

* Path: POST `'/posts/new'`

* Params:
  * image_url: a string url
  * username: a string
  * answer: a string

* Response success:
  * Status code: 201

* Example:

```
{
	"image_url": "http://whatever.com/image.jpg",
	"username": "whatever"
	"answer": "This is the answer"
}
```

## Lists of posts from all users

* Path: GET '/posts/'

* PAGINATION???
  * Will probably add.

* Response success:
  * Status code: 200

* Example:

```
{
  "id": 1,
  "username": "whatever",
  "image_url": "http://whatever.com/image.jpg",
  "guessed": true
}
```