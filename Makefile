build:
	docker build \
		--tag $(tag) \
		--build-arg DOMAIN=$DOMAIN \
		--build-arg EMAIL=$EMAIL \
		--build-arg DB_ADDR=$DB_ADDR \
		--build-arg DB_NAME=$DB_NAME \
		--build-arg DB_USER=$DB_USER \
		--build-arg DB_PASS=$DB_PASS \
		--build-arg image=$(package) \
		--no-cache .

run:
	docker run -d -p 80:8080 -p 443:8443 --rm $(tag)