<!-- Listar imagene disponibles. -->
docker image ls

<!-- Listar contenedores activos. -->
docker ps -a

<!-- Detener contenedor. -->
docker rm ID_DOCKER

<!-- Compilar contenedor. -->
docker build . -t server-docker-nginx-angular

<!-- Levantar contenedor. -->
docker run -it --rm -d -p 8080:80 --name docker-nginx-angular server-docker-nginx-angular

<!-- docker run -it --rm -p 8080:80 server-docker-nginx-angular -->

<!-- Acceder al servidor, cualquier otra url muestra una pagina de error -->
http://localhost:8080/

<!-- Ahora que la aplicación se está ejecutando como se esperaba, nuestro siguiente paso sería enviar nuestra imagen a un repositorio de imágenes para implementar nuestros contenedores en un servicio en la nube.

Si tiene una cuenta de DockerHub, puede ejecutar los siguientes comandos: -->
docker login -u <username> -p <password>
docker push server-docker-nginx-angular