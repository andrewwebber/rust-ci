FROM rust:1.49.0-slim
RUN apt-get update -y
RUN apt-get install -y pkg-config libssl-dev
RUN apt-get install -y musl-tools postgresql-client make curl git
RUN rustup update stable
RUN rustup default stable
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo install cargo-tarpaulin
RUN cargo install sccache
RUN cargo install wasm-pack
RUN cargo install cargo-audit --features=fix
