FROM rust:1.50.0-slim
RUN apt-get update -y
RUN apt-get install -y pkg-config libssl-dev
RUN apt-get install -y musl-tools postgresql-client make cmake curl git build-essential zlib1g-dev
RUN rustup update stable
RUN rustup default stable
RUN rustup target add wasm32-wasi
RUN rustup target add wasm32-unknown-unknown
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo install cargo-tarpaulin
RUN cargo install sccache
RUN cargo install wasm-pack
RUN cargo install cargo-audit --features=fix
