.PHONY: all build push

APP=motion
GROUP=linuxoid69
REVISION=-0.1.0
VERSION=4.7.0
TAG=$(VERSION)$(REVISION)
DOCKER_REGISTRY=ghcr.io

all:
	@echo 'DEFAULT:                                                               '
	@echo '   make build                                                    '
	@echo '   make push                                                           '

build:
	DOCKER_BUILDKIT=1 docker build --build-arg VERSION=$(VERSION) --platform linux/amd64 -t $(DOCKER_REGISTRY)/$(GROUP)/$(APP):$(TAG) .
	docker tag $(DOCKER_REGISTRY)/$(GROUP)/$(APP):$(TAG) $(DOCKER_REGISTRY)/$(GROUP)/$(APP):latest

push:
	docker push $(DOCKER_REGISTRY)/$(GROUP)/$(APP):$(TAG)
	docker push $(DOCKER_REGISTRY)/$(GROUP)/$(APP):latest
