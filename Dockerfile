FROM rust:1.49.0-slim
RUN rustup update stable
RUN rustup default stable
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo install cargo-tarpaulin
RUN cargo install sccache
RUN cargo install cargo-audit
