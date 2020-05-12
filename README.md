# Docker Application for Local Development of go-cart.io

The go-cart.io web application consists of two major parts:

1. The main, user-facing web application that users interact with to
   generate and view cartograms (`cartogram-web`), and

2. The AWS Lambda function that actually generates cartograms from user data
   using a small Python wrapper for the C code at 
   https://github.com/Flow-Based-Cartograms/go_cart (`cartogram-serverless`).
   
   For local development, a small wrapper using Python Flask
   is provided to simulate the HTTP API endpoint to the Lambda function on 
   the developer's local machine.

In addition, the main web application also uses PostgreSQL and Redis for data storage.

This repository contains a Docker compose file that makes it easy to install and
run all of the components necessary to develop the go-cart.io website locally
on your computer. This readme file contains instructions on how to go about this
on Ubuntu and macOS. If you are using Windows, please follow the instructions in `wsl.md` instead.

## Installing Docker

Before you begin, you must install Docker and Docker Compose.

### Ubuntu

First, you must install some dependencies for Docker and add the GPG keys for 
the Docker software repository:

```shell script
$ sudo apt-get update
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Verify that you now have the key with the fingerprint 
`9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88`, 
by searching for the last 8 characters of the fingerprint.

```shell script
$ sudo apt-key fingerprint 0EBFCD88
pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]

```

Now add the repository for Docker and install it:

```shell script
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

Then, add yourself to the `docker` group so you do not have to run Docker commands as root:

```shell script
$ sudo usermod -aG docker your-username
```

Finally, download and install Docker Compose as a separate binary:

```shell script
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```

### macOS

Install both Docker and Docker Compose by installing Docker Desktop for Mac according
to the instructions at https://docs.docker.com/docker-for-mac/install/.

## Installing `cartogram-web` and `cartogram-serverless`

The code for the go-cart.io web application is contained within two GitHub repositories: 
[cartogram-web](https://github.com/jansky/cartogram-web) and 
[cartogram-serverless](https://github.com/jansky/cartogram-serverless). Before you continue,
fork these two repositories so you have your own version of them. Note the URL that you will need
to use to clone both repositories.

Now, clone your forked `cartogram-web` and `cartogram-serverless` into the root directory
of *this* repository (i.e., the folder containing this readme). If you have SSH enabled for your GitHub
account, this should look like:

```shell script
$ git clone git@github.com:your-github-username/cartogram-web.git
$ git clone git@github.com:your-github-username/cartogram-serverless.git
``` 

## Starting the go-cart.io Web Application

To start the go-cart.io web application for local development and testing, run the following
command from the root directory of this repository (i.e., the folder containing this readme):

```shell script
$ docker-compose up
```

The first time you run this command it may take a while to download and install dependencies.

After all of the Docker containers have started up, all of their output will be collected
into the terminal window so you can see how the web application is responding to requests,
and if it encounters any errors. You can access the locally-running go-cart.io website at
http://localhost:5000. When you make changes to the code in either the
`cartogram-web` or `cartogram-serverless` repositories, their respective servers will reload 
automatically when you save your changes.

When you would like to shut down the go-cart.io web application, simply press Ctrl-C in the
terminal window you started Docker Compose in. After a few moments, the state of all the
Docker containers will be saved and the application will gracefully come to a halt.

**NOTE:** If you make a breaking change to the code (e.g., you introduce a syntax error), 
you will need to shut down the web application and start it again.