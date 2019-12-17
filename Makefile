.PHONY: all build push

tag ?= latest

all: build

build: Dockerfile
	docker build -t mivade/miniconda:latest .

push: build
	docker push mivade/miniconda:latest
