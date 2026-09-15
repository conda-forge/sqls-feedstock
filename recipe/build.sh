#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

go build -buildmode=pie -trimpath -o=${PREFIX}/bin/${PKG_NAME} -ldflags="-s -w"
go-licenses save . --save_path=license-files \
    --ignore github.com/CodinGame/h2go \
    --ignore github.com/segmentio/asm

cp -r ${RECIPE_DIR}/license-files/* ${SRC_DIR}/license-files
