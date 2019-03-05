FROM codeship/eks-kubectl

ARG RELEASE=v1.0.2
ARG OS=linux

RUN apt-get install unzip -y
RUN curl -OL https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless_$OS-amd64.zip && \
  unzip kubeless_$OS-amd64.zip && \
  mv bundles/kubeless_$OS-amd64/kubeless /usr/local/bin/
