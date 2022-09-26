#!/usr/bin/env bash

set -eo pipefail
RESOURCES_FOLDER="$(dirname "$0")/../../../proto"

npx grpc_tools_node_protoc \
    --plugin=./node_modules/.bin/protoc-gen-ts_proto \
    --ts_proto_opt=env=node \
    --ts_proto_opt=esModuleInterop=true \
    --ts_proto_opt=outputServices=grpc-js \
    --ts_proto_opt=unrecognizedEnum=false \
    --ts_proto_out=src \
    --proto_path "$RESOURCES_FOLDER" \
    $(find "$RESOURCES_FOLDER" -iname '*.proto')

# Additionally, compile the Google Status message to support the
# [richer error model](https://grpc.io/docs/guides/error/#richer-error-model)
GOOGLE_RESOURCES_FOLDER="$(dirname "$0")/../node_modules/google-proto-files"
npx grpc_tools_node_protoc \
    --plugin=./node_modules/.bin/protoc-gen-ts_proto \
    --ts_proto_opt=env=node \
    --ts_proto_opt=esModuleInterop=true \
    --ts_proto_opt=outputServices=grpc-js \
    --ts_proto_opt=unrecognizedEnum=false \
    --ts_proto_out=src \
    --proto_path "$GOOGLE_RESOURCES_FOLDER" \
    "$GOOGLE_RESOURCES_FOLDER/google/rpc/status.proto"
