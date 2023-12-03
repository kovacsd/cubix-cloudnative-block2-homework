FROM quay.io/drsylent/cubix/block2/homework-base:java17

LABEL "cubix.homework.owner"="Kovács Dániel"

ENV CUBIX_HOMEWORK = "Kovács Dániel"
ENV APP_DEFAULT_MESSAGE = ""
ARG BASE_DIR

RUN mkdir /opt/app && chown 1001 -R /opt/app
USER 1001
WORKDIR /opt/app
COPY --chown=1001 ${BASE_DIR}/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]