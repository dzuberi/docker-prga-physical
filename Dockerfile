FROM ubuntu:24.04


ARG GID
ARG GNAME
ARG UNAME
ARG UID 

RUN apt-get update
RUN apt-get install -y \
    curl \
    bzip2 \
    build-essential \
    cmake \
    libsqlite3-dev \
    libffi-dev\
    libbz2-dev\
    pkg-config\
    bison\
    flex\
    build-essential\
    zlib1g-dev\
    libssl-dev\
    libreadline-dev\
    liblzma-dev\
    make \
    cmake \
    build-essential \
    pkg-config \
    bison \
    flex \
    libgtk-3-dev \
    libx11-dev \
    build-essential \
    clang \
    bison \
    flex \
    libreadline-dev \
    gawk \
    tcl-dev \
    libffi-dev \
    git \
    xdot \
    pkg-config \
    python3-dev \
    zlib1g-dev \
    sphinx-common \
    wget \
    iverilog \
    && apt-get autoclean

WORKDIR /workspace

# Create the user account
RUN groupadd -g $GID $GNAME
RUN useradd -m -u $UID $UNAME -g $GNAME
ENV UNAME_HOME=/home/$UNAME

RUN chown $UID:$GID /workspace 

# COPY ./prga_physical /workspace/prga_physical
# RUN chown -R $UID:$GID /workspace/prga_physical

USER $UNAME
ENV USER=$UNAME
ENV HOME=/home/$UNAME

WORKDIR /workspace/docker-prga-physical/prga_physical
# RUN make build
# RUN make build_test
# RUN make clean
