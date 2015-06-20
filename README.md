# API

## Overview

All access is over HTTPS, and access from the "https://vast-wildwood-6662.herokuapp.com" domain. All data is sent and received as JSON.

## Access Token

Every request requires an authentication token to be provided in the header. Except for SIGN UP, LOGIN, and VIEW ALL POSTS.

To do this make sure you set 'Access-Token' equal to the user's access token in every required request.

```
['Access-Token'] = 'f16395873f4bcee7ef5d46e531b9f659'
```

## Sign up and Login

### New user registration

Path:

`POST '/users/register'`

Parameters:

| name       | type   | description                              |
|------------|--------|------------------------------------------|
| user_name   | string | username for user to be created          |
| password   | string | password has to be at least 8 characters |
| first_name | string | first name of user to be created         |
| last_name  | string | last name of user to be created          |
| email      | string | email of user to be created              |


Example data successful response:

```json
Response Status Code: 201

{
  "user_name": "whatever",
  "access_token": "f16395873f4bcee7ef5d46e531b9f659f16395873f4bcee7ef5d46e531b9f659",
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
| user_name | string | username for the user you want get authentication key for   |
| password | string | password for the user you want get authentication token for |

Example data successful response:

```json
Response Status Code: 200 (TBD)

{
  "user_name": "whatever",
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
| image_url | string | url for the image of the post          |
| answer    | string | answer for the post                    |

Example data successful response:

```json
Response Status Code: 201

{
  "id": 9,
  "post_info": {
    "image_url": "http://hello.com",
    "answer": "hello",
    "created_at": "2015-06-19T12:47:38.064Z",
    "updated_at": "2015-06-19T12:47:38.064Z"
  },
  "creator": {
    "user_name": "rick",
    "first_name": "Rick",
    "last_name": "Sun",
    "email": "rick@sunden.com"
  }
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "errors": [
    "Answer can't be blank",
    "Image url can't be blank"
  ]
}
```

### Show a specific post of the current user

Path:

`GET '/post/:id'`

Example data successful response:

```json
Response Status Code: 200

{
  "id": 9,
  "post_info": {
    "image_url": "http://hello.com",
    "answer": "hello",
    "created_at": "2015-06-19T12:47:38.064Z",
    "updated_at": "2015-06-19T12:47:38.064Z"
  },
  "creator": {
    "user_name": "rick",
    "first_name": "Rick",
    "last_name": "Sun",
    "email": "rick@sunden.com"
  }
}
```

Example data failure response:

```json
Response Status Code: TBD

{
  "message": "This user does not have a post with that ID."
}
```

### List all of posts from current user

Path: 

`GET '/posts/user'`

Parameters:

| name | type    | description                        |
|------|---------|------------------------------------|
| page | integer | defaults to 1, 25 results per page |

Example data successful response:

```json
Response Status Code: 200

[
  {
    "id": 9,
    "post_info": {
      "image_url": "http://hello.com",
      "answer": "hello",
      "created_at": "2015-06-19T12:47:38.064Z",
      "updated_at": "2015-06-19T12:47:38.064Z"
    },
    "creator": {
      "user_name": "rick",
      "first_name": "Rick",
      "last_name": "Sun",
      "email": "rick@sunden.com"
    }
  },
  {
    "id": 10,
    "post_info": {
      "image_url": "http://google.com/image.jpg",
      "answer": "yep that is correct",
      "created_at": "2015-06-19T14:03:28.790Z",
      "updated_at": "2015-06-19T14:03:28.790Z"
    },
    "creator": {
      "user_name": "rick",
      "first_name": "Rick",
      "last_name": "Sun",
      "email": "rick@sunden.com"
    }
  }
]
```

Example data failure response:

```json
Response Status Code: TBD

{
  "message": "This user does not have any posts."
}
```

### Lists of posts from all users

Path:

`GET '/posts/all'`

Parameters:

| name | type    | description                        |
|------|---------|------------------------------------|
| page | integer | defaults to 1, 25 results per page |

Example data successful response:

```json
Response Status Code: 200

[
  {
    "id": 33,
    "post_info": {
      "image_url": "http://waat.com/image.jprg",
      "answer": "hello",
      "created_at": "2015-06-19T12:47:38.064Z",
      "updated_at": "2015-06-19T12:47:38.064Z"
    },
    "creator": {
      "user_name": "Hey",
      "first_name": "John",
      "last_name": "What",
      "email": "john@gmail.com"
    }
  },
  {
    "id": 22,
    "post_info": {
      "image_url": "http://google.com/image.jpg",
      "answer": "answer",
      "created_at": "2015-06-19T14:03:28.790Z",
      "updated_at": "2015-06-19T14:03:28.790Z"
    },
    "creator": {
      "user_name": "Mate",
      "first_name": "Jason",
      "last_name": "Derulo",
      "email": "wut@wut.com"
    }
  }
]
```

Example data failure response:

```json
Response Status Code: TBD

{
  "message": "There are no posts."
}
```

## Guesses

### User can guess

Path: 

`POST '/guesses'`

Parameters:

| name  | type   | description                            |
|-------|--------|----------------------------------------|
| post_id | integer | id of the post the user is making a guess on |
| guess | string | guess on the post                      |

Example data successful response:

```json
Response Status Code: 201

{
  "user_name": "whatever",
  "post_id": 22,
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

`GET '/topscores'`

Example data successful response:

```json
Response Status Code: 200

[
{
  "user_name": "whatever",
  "score": 20
}
{
  "user_name": "anotheruser",
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