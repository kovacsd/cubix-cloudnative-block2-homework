``git clone https://github.com/kovacsd/cubix-cloudnative-block2-homework.git``

``cd .\cubix-cloudnative-block1-homework\``

``cd .\frontapp\``

``./mvnw clean verify``

``cd ..\backapp\``

``./mvnw clean verify``

create the dockerfile

``docker build -t frontend-app --build-arg BASE_DIR=/frontapp .``

``docker build -t backend-app --build-arg BASE_DIR=/backapp .``

``docker inspect frontend-app --format '{{index .Config.Labels `"cubix.homework.owner`"}}'``

result: Kovács Dániel

``docker inspect backend-app --format '{{index .Config.Labels `"cubix.homework.owner`"}}'``

result: Kovács Dániel

create the docker-compose.yaml

``docker compose up -d``

``docker logs frontend-app``

2023-12-03T07:31:12.436Z  INFO 1 --- [nio-8080-exec-1] h.c.c.api.controller.FrontappController  : Preparing for calling backapp - message was: Hello
2023-12-03T07:31:12.437Z  INFO 1 --- [nio-8080-exec-1] h.c.c.api.controller.FrontappController  : Calling backapp
2023-12-03T07:31:12.739Z  INFO 1 --- [nio-8080-exec-1] h.c.c.api.controller.FrontappController  : Backapp call was successful, response was: BackappResponse[time=2023-12-03T07:31:12.569147900, message=Hello, homeworkOwner== Kovács Dániel, hostAddress=172.20.0.2, extraImageData=Cubix training]
2023-12-03T07:31:12.748Z  INFO 1 --- [nio-8080-exec-1] h.c.c.api.controller.FrontappController  : Response will be: FrontappResponse[msForReply=131, backappMessage=Hello, frontappHomeworkOwner== Kovács Dániel, frontappHostAddress=172.20.0.3, backappHomeworkOwner== Kovács Dániel, backappHostAddress=172.20.0.2, doExtraImageDataMatch=true]
2023-12-03T07:46:40.409Z  INFO 1 --- [nio-8080-exec-5] h.c.c.api.controller.FrontappController  : Preparing for calling backapp - message was: null
2023-12-03T07:46:40.410Z  INFO 1 --- [nio-8080-exec-5] h.c.c.api.controller.FrontappController  : Calling backapp
2023-12-03T07:46:40.428Z  INFO 1 --- [nio-8080-exec-5] h.c.c.api.controller.FrontappController  : Backapp call was successful, response was: BackappResponse[time=2023-12-03T07:46:40.422163166, message== , homeworkOwner== Kovács Dániel, hostAddress=172.20.0.2, extraImageData=Cubix training]
2023-12-03T07:46:40.428Z  INFO 1 --- [nio-8080-exec-5] h.c.c.api.controller.FrontappController  : Response will be: FrontappResponse[msForReply=11, backappMessage== , frontappHomeworkOwner== Kovács Dániel, frontappHostAddress=172.20.0.3, backappHomeworkOwner== Kovács Dániel, backappHostAddress=172.20.0.2, doExtraImageDataMatch=true]

``docker logs backend-app``

2023-12-03T07:31:12.567Z  INFO 1 --- [nio-8080-exec-2] hu.cubix.cloud.api.BackappController     : Request arrived with message Hello
2023-12-03T07:31:12.570Z  INFO 1 --- [nio-8080-exec-2] hu.cubix.cloud.api.BackappController     : Returning response: BackappResponse[time=2023-12-03T07:31:12.569147900, message=Hello, homeworkOwner== Kovács Dániel, hostAddress=172.20.0.2, extraImageData=Cubix training]
2023-12-03T07:46:40.421Z  INFO 1 --- [nio-8080-exec-4] hu.cubix.cloud.api.BackappController     : Request arrived with message =
2023-12-03T07:46:40.422Z  INFO 1 --- [nio-8080-exec-4] hu.cubix.cloud.api.BackappController     : Returning response: BackappResponse[time=2023-12-03T07:46:40.422163166, message== , homeworkOwner== Kovács Dániel, hostAddress=172.20.0.2, extraImageData=Cubix training]