# demoapp

Copy all files from Repo into local folder:

Start build with :

docker build -t demo22 .

When build is successfull you can check docker images with:

docker images

Now, we will initiliaze docker compose:

docker-compose up

Finally, you can localy execute health_check.sh and check that evertyhing is OK.


Note: Please note that this Java application require npm install express (Express framework). For purpose of demo I have localy executed npm init to generate package.json & package-lock.json files.

