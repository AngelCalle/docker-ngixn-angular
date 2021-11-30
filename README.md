<!-- List available images. -->
docker image ls

<!-- List active containers. -->
docker ps -a

<!-- Stop container. -->
docker rm CONTAINER_ID

<!-- Get container information. -->
docker inspect CONTAINER_ID

<!-- Get container ip. -->
docker inspect -f '{{.NetworkSettings.IPAddress}}' CONTAINER_ID



<!-- Compile container. -->
docker build . -t server-docker-nginx-angular

<!-- Lift container. -->
docker run -it --rm -d -p 8080:80 --name docker-nginx-angular server-docker-nginx-angular

<!-- docker run -it --rm -p 8080:80 server-docker-nginx-angular -->

<!-- Access the server, any other url shows an error page -->
http://localhost:8080/

<!-- Now that the application is running as expected, our next step would be to submit our image to an image repository to deploy our containers to a cloud service.

If you have a DockerHub account, you can run the following commands: --> 
docker login -u <username> -p <password>
docker push server-docker-nginx-angular