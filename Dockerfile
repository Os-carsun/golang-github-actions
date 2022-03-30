FROM golang:1.18-alpine

ENV GO111MODULE=on

RUN apk update && \
	apk add jq git curl&& \
	go install github.com/kisielk/errcheck@latest && \
	go install golang.org/x/tools/cmd/goimports@latest && \
	go install golang.org/x/lint/golint@latest && \
	go install github.com/securego/gosec/v2/cmd/gosec@latest && \
	go install golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow@latest && \
	go install honnef.co/go/tools/cmd/staticcheck@latest

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
