all:
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 --cache-to type=inline,mode=max --tag fhriley/keepalived:2.2.4 --tag fhriley/keepalived:latest --push .

