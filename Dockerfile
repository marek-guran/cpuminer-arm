FROM debian:bullseye AS builder

# Install build dependencies
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    autoconf \
    autogen \
    automake \
    libtool \
    libcurl4-openssl-dev \
    libjansson-dev \
    openssl \
    libssl-dev \
    gcc \
    gawk \
    git \
    make \
 && rm -rf /var/lib/apt/lists/*

# Build cpuminer
WORKDIR /cpuminer
COPY cpuminer .
RUN chmod +x autogen.sh && ./autogen.sh && ./configure && make

# Start a new stage for the production image
FROM debian:bullseye

# Install runtime dependencies
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    libcurl4 \
    libjansson4 \
 && rm -rf /var/lib/apt/lists/*

# Copy the built binary and scripts from the builder stage
WORKDIR /usr/local/bin
COPY --from=builder /cpuminer/minerd .
COPY /scripts/minerd.sh .

# Ensure the script is executable
RUN chmod +x minerd.sh

# Start minerd
CMD ["./minerd.sh"]

