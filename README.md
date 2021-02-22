# Formidable Code Challenge

## Overview

You will be performing a code challenge using Terraform and your preferred scripting language. We have prepared a Docker image with the required dependencies to run Terraform and we are also using a `localstack` Docker image that provides a mock AWS API that Terraform will run against. We have prepared a `docker-compose.yml` that will start both of these Docker images and will link a local folder (`./project`) so you can use your own text editor to modify files locally that can then be run within the Docker image.

## Before the Interview

Before your scheduled interview we would like to make sure you are able to install all dependencies on your local machine and are able to successfully run Terraform in our Docker image.

### Setup

Install dependencies:

- [docker](https://docs.docker.com/get-docker/)

To verify your environment open a terminal and navigate to the folder containing `docker-compose.yaml'`. Run:

```
docker-compose up
```

Then from a second terminal window, connect to the exercise container:

```
docker exec -it exercise bash
```

Confirm the local `project` folder is linked to the Docker image. Open the `project` folder in your text editor and add a file `project/test.txt`. Then in the terminal connected to the exercise container run `ls`. You should see:

```
bash-4.2# ls
main.tf  test.txt
```

Now confirm that Terraform can run the logic in `project/main.tf`.

```
terraform init
terraform apply
```

Confirm your preferred scripting language can be run in the Docker image. If a dependency needs to be added to the Docker image please let us know and we can add it. For example here we test NodeJS is installed:

```
bash-4.2# node -v
v12.18.3
bash-4.2# node -e 'console.log("derp")'
derp
```

**YOU ARE DONE WITH SETUP!**

We will have you run `terraform init` and `terraform apply` at the start of the interview to confirm your local setup is working properly. **Please try to have the sandbox up and running at the start of the interview.**

#### Cleanup

You can type `exit` to log out of the bash session.

To stop the containers and clean up the network mappings, use:

```
docker-compose down
```

### Help

Please reach out to your Formidable contact if you need more help. We can answer questions via email and we can also schedule a pairing meeting to provide additional support.

## Additional Information

### Exercise Docker Images

Two docker images are used.

#### localstack

https://github.com/localstack/localstack

Provides a mock AWS API that we can configure Terraform to use. This simplifies the coding challenge because we don't need to deal with giving permissions to a real AWS account and we don't need to cleanup resources that are created.

#### formidable/terraform-sandbox

https://github.com/FormidableLabs/terraform-sandbox-docker

Docker image with dependencies needed to perform the coding challenge.

### `aws-local` usage

https://github.com/localstack/awscli-local

The exercise Docker image comes with `aws-local` installed.

Because we are running against a mocked AWS API when we try to use the `aws` cli you must specify the mocked AWS endpoint to use.

```
aws --endpoint-url=http://localhost:4568 kinesis list-streams
```

Instead you can use `aws-local` as drop in replacement for `aws` for this exercise.

```
awslocal kinesis list-streams
```
