commit := $(shell git rev-parse --short HEAD)

build: bin/test-service

bin/test-service: *.go
	mkdir -p bin
	go build -o bin/test-service ./

run: build
	./bin/test-service

clean:
	rm -r bin

image: *.go
	docker build -t jphines/test-service:$(commit) ./

imagepush: image
	docker push jphines/test-service:$(commit)
