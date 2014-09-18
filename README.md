Created by Kaushal Kishore <br>
Email : kaushal.rahuljaiswal@gmail.com<br>
Website : http://www.kaushalkishore.com<br>

<h2>Dockerfile for creating docker image for Centos-Nginx-PHP (Centos, Nginx, PHP-FPM)</h2>

<h4>Steps for creating image from the Docker-Centos-Nginx-PHP:</h4>

<b>Step 1 :</b> Clone the Docker-Centos-Nginx-PHP.git
<pre>
<b>Command: </b>
git clone https://github.com/kaushalkishorejaiswal/Docker-Centos-Nginx-PHP.git
</pre>

<b>Step 2 :</b> Change the directory to the clone folder
<pre>
<b>Command:</b>
cd Docker-Centos-Nginx-PHP
</pre>

<b>Step 3 :</b> Create the Docker Image
<pre>
<b>Command: </b>
sudo docker build -t ##NAME_OF_YOUR_DOCKER_IMAGE## .
</pre>

<pre>
<b>Note : </b>
  a). This command will be fired where the DockerFile will be placed
  b). ##NAME_OF_YOUR_DOCKER_IMAGE## : Replace it with your image name
  c). . : (.) Symbols shows that your Dockerfile is available on the same directory where you are running the command.
</pre>

<b>Step 4 :</b> Create an Centos, Nginx, PHP-FPM Installed Container from the image
<b>Command Syntax: </b>
sudo docker run --name [container name] -p [port to access (New Port):port exposed(original port)] -i -t [image name]
<pre>
<b>Command:</b>
sudo docker run --name ##NAME_OF_YOUR_DOCKER_CONTAINER## -d -p 8082:80 ##NAME_OF_YOUR_DOCKER_IMAGE##
</pre>

<b>Step 5 :</b> Now you can access your Nginx container from your web browser.
<pre>
<b>Command:</b>
http://127.0.0.1:8082/
</pre>

<h4>Some other important commands:</h4>
<ul>
<li><b>docker images :</b> To list all the images of your docker</li>
<li><b>docker ps :</b> To list all the runing containers</li>
<li><b>docker kill ##CONTAINER_NAME## :</b> To kill the runing container</li>
<li><b>docker rm ##CONTAINER_NAME## :</b> To delete the container from the system.</li>
<li><b>docker inspect ##CONTAINER_NAME## :</b> To get all the information about the container.</li>
<li><b>docker logs ##CONTAINER_NAME## :</b> To get the logs of the container.</li>
<li><b>docker ps -a:</b> To get the listing of all the containers.</li>
</ul>

<h4>Additional Notes:</h4>
<b>Command for attaching the volume of your hosted machine:</b>
<pre>
<b>Command Syntax:</b>
sudo docker run --name ##NAME_OF_YOUR_DOCKER_CONTAINER## -d -p 8082:80 -v ##HOSTED_VOLUME_LOCATION##:##CONTAINER_VOLUME_LOCATION## ##YOUR_IMAGE_NAME##
</pre>

<pre>
<b>Command Example:</b>
sudo docker run --name apache_ins -d -p 8082:80 -v /var/www/kaushal:/var/www kaushal_nginx
</pre>
