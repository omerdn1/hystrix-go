PWD = $(shell pwd)
TOOLS = tools
GOBIN = ${PWD}/${TOOLS}
PATH := ${GOBIN}:$(PATH)

bench:
	@go test -run=Bench -bench=. ./...
.PHONY: bench

build:
	@go build ./...
.PHONY: build

test:
	@go test -count=1 -race -cover ./...
.PHONY: test

tools: ${TOOLS}/goimports
.PHONY: tools

${TOOLS}/goimports: go.sum
	@go build -o ${TOOLS}/goimports golang.org/x/tools/cmd/goimports

verify: ${TOOLS}/goimports
	@go vet ./...
	@./hack/verify_format.sh
.PHONY: verify
