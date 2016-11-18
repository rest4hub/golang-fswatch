TAG := rest4hub/golang-fswatch

build:
	docker pull golang; \
	docker build -t ${TAG} .

clean:
	docker rmi ${TAG}

rebuild: clean build

release:
	clear
	bash -c 'export GO_ENV=$$(docker run $(TAG) go env); \
	export GO_VERSION=$$(docker run $(TAG) go version); \
	export FSWATCH_VERSION=$$(docker run $(TAG) fswatch -version); \
	bash README.tpl > README.md'

publish:
	docker push ${TAG}

run:    
	docker run --rm -it ${TAG}

.PHONY: build