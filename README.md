# Digital Factory gRPC API Specification

This repository contains the gRPC specifications (proto files) of all APIs that are available in the digital factory.

Furthermore, it provides build pipelines to generate client and server code for the programming languages that are used in the realm.
The different libraries will be stored in DevOps Artifacts and can be pulled into the services, that actually implement or use parts of the API.

## First time setup

1. Install the pre-commit hooks automate the boring stuff

```bash
brew install pre-commit
pre-commit install
```

2. Install grpcurl to interact with APIs locally

```bash
brew install grpcurl
```

## Build Packages

### Java

```sh
cd packages/java
./mvnw clean install -Drevision=0-local
```

### Kotlin

```sh
cd packages/kotlin
./mvnw clean install -Drevision=0-local
```

### TypeScript

```sh
cd packages/typescript
npm i && npm run build
```
