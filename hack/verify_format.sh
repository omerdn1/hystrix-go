#!/bin/bash -e

FILES=$(gofmt -s -l hystrix plugins)

if [[ -n "${FILES}" ]]; then
    echo You have go format errors in the below files, please run "gofmt -s -w hystrix plugins"
    echo ${FILES}
    exit 1
fi

FILES=$(goimports -e -l -local=github.com/omerdn1/hystrix-go hystrix plugins)

if [[ -n "${FILES}" ]]; then
    echo You have go import errors in the below files, please run "goimports -e -w -local=github.com/omerdn1/hystrix-go hystrix plugins"
    echo ${FILES}
    exit 1
fi
