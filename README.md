# Stay in Touch!

> Stay in Touch! is a social media app built with Ruby on Rails. Users can send friendship invitations to other users, create, like and comment posts.

![screenshot](./docs/stay_in_touch.png)

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Live Demo

[StayInTouch](https://stayintouchsocial.herokuapp.com/users/sign_in)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

> Run the following command in your terminal to get a local copy of the repo on your local machine.

```bash
  $ git clone https://github.com/rsundar/ror-social-scaffold.git
```

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

### Deployment

Before you deploy to heroku you need to delete the `credentials.yml.enc` file and run 
`EDITOR="vi" rails credentials:edit`. Take the long encrypted key out and add it as a 
configuration variable with the key 'SECRET_KEY_BASE' to Heroku in the settings tab. 
Also make the following change to the file and save it:

```
    secret_key_base = <%= ENV['SECRET_KEY_BASE'] %>
```

You need to have the heroku postgres add on installed and the heroku ruby buildpack 
installed. 

Once you have completed the steps above you can deploy to heroku with the command:
``` $git push heroku master ```
If you run into any pre-compilation errors just pre-compile the app locally and then deploy.

Once the application is deployed you need to migrate the database with the following command:
``` $heroku run rails db:migrate ```

## Authors

👤 **Rohan Sundar**

- Github: [@rsundar](https://github.com/rsundar)
- Twitter: [@skelegrow](https://twitter.com/)
- Linkedin: [linkedin](https://linkedin.com/)

👤 **Mario Barrios**

- Github: [@mariobarrioss](https://github.com/mariobarrioss)
- Twitter: [@mario_barrioss](https://twitter.com/)
- Linkedin: [linkedin](https://linkedin.com/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://github.com/rsundar/ror-social-scaffold/LICENSE) licensed.
