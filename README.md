# Kudoshell

<p align="center">
	<img src="https://github.com/programarivm/kudoshell/blob/master/resources/logo.jpg" />
</p>

<p align="center">
	Allow your community to earn cute kudos with the [Roll API](https://docs.tryroll.com/).
</p>

### Intro

Are you an artist, podcaster or streamer? Do you have a network of followers? If so, it is high time for your community to earn cute kudos!

### Development

Should you want to play around with the development environment follow the steps below.

Create an `.env` file and update it accordingly:

	$ cp .env.example .env

Generate a development SSL certificate:

	$ bash/dev/ssl.sh

Build the Docker containers:

	$ docker-compose up --build

Run the tests:

	$ docker exec -it kudoshell_php_fpm vendor/bin/phpunit --configuration phpunit-docker.xml

### Contributions

Would you help make this app better?

- Feel free to send a pull request
- Drop an email at info@programarivm.com with the subject "Kudoshell"
- Leave me a comment on [Twitter](https://twitter.com/programarivm)

Thank you.
