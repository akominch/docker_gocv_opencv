FROM arm32v7/golang:1.14.4-buster

RUN apt-get update && \
      apt-get -y install sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

RUN go get -u -d gocv.io/x/gocv

WORKDIR ${GOPATH}/src/gocv.io/x/gocv/

RUN make install_raspi

WORKDIR /go/src/app