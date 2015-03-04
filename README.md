loggly-docker
=============

Docker container for loggly (via rsyslog). Check out Loggly's [Docker logging documentation](https://www.loggly.com/docs/docker-syslog/) to learn more.

Usage:
------
You can run the Docker Image using the following command.

    docker run -e TOKEN=Loggly-Customer-Token -e TAG=Tag-Describing-Source sendgridlabs/loggly-docker
    


<br>
<strong>Replace:</strong>

1. Loggly-Customer-Token: Your Loggly Customer Token. See the documentation at https://www.loggly.com/docs/customer-token-authentication-token/

2. Tag-Describing-Source: The keyword to search logs in the Loggly inside the tag field. Keeping tag as 'Docker' will help you to search all your Docker logs in one go. See the documentation at https://www.loggly.com/docs/tags/

<strong>Things to Remember:</strong>

1. This version creates an image of Ubuntu trusty version. You can update DockerFile according to your requirements.



