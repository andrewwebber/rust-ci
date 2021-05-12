FROM rust:1.52.1-slim
RUN apt-get update -y
RUN apt-get install -y pkg-config libssl-dev
RUN apt-get install -y musl-tools postgresql-client make cmake curl git build-essential zlib1g-dev yarn openssh-client
RUN rustup update stable
RUN rustup default stable
RUN rustup target add wasm32-wasi
RUN rustup target add wasm32-unknown-unknown
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo install cargo-tarpaulin --version 0.18.0-alpha3
RUN cargo install sccache
RUN cargo install wasm-pack
RUN cargo install cargo-audit --features=fix
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update -y && apt install yarn -y && yarn --help
