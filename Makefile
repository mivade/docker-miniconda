.PHONY: all build push

TAG ?= latest

all: build

build: Dockerfile
	docker build -t mivade/miniconda:${TAG} .

push: build
	docker push mivade/miniconda:${TAG}
