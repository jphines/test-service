FROM golang:1.9
WORKDIR /go/src/github.com/jphines/test-service
COPY . .
RUN make

FROM gcr.io/distroless/base
COPY --from=0 /go/src/github.com/jphines/test-service/bin/test-service /bin/test-service
EXPOSE 8080
CMD ["/bin/go-httpbin"]
