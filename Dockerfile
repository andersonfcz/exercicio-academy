#STAGE PARA GERACAO DE CERTIFICADOS
FROM alpine:3.13 as CERTIFICATES
ARG EMAIL
ARG DOMAIN
ENV EMAIL=$EMAIL
ENV DOMAIN=$DOMAIN
EXPOSE 80
RUN apk update && apk add certbot
# RUN certbot certonly --standalone -n --email $EMAIL --domain $DOMAIN --agree-tos
WORKDIR /etc/letsencrypt/live/$DOMAIN

## MOCK DE GERACAO DE CERTIFICADOS PARA EXEMPLO
RUN  echo 'cert exemplo' > fullchain.pem \
&& echo 'privkey exemplo' > privkey.pem


#BUILD WEBSERVER
FROM tomcat:10.0.8-jdk16-corretto
ARG DB_ADDR
ARG DB_USER
ARG DB_PASS
ARG DB_NAME
ARG DOMAIN
ARG package=sample.war

ENV DB_NAME=$DB_NAME
ENV DB_ADDR=$DB_ADDR
ENV DB_PASS=$DB_PASS
ENV DB_USER=DB_USER
WORKDIR $CATALINA_HOME
COPY --from=CERTIFICATES /etc/letsencrypt/live/$DOMAIN/fullchain.pem ./conf/cert.pem
COPY --from=CERTIFICATES /etc/letsencrypt/live/$DOMAIN/privkey.pem ./conf/private.pem
COPY $package ./webapps/$package
COPY server.xml ./conf/server.xml

EXPOSE 8080
EXPOSE 8443