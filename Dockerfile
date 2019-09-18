FROM wheelsllc/eks-kubectl

ARG RELEASE=v1.0.2
ARG OS=linux

RUN apt-get install unzip zip -y
RUN curl -OL https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless_$OS-amd64.zip && \
  unzip kubeless_$OS-amd64.zip && \
  mv bundles/kubeless_$OS-amd64/kubeless /usr/local/bin/

RUN curl -s https://api.github.com/repos/kubernetes-sigs/kustomize/releases/latest |\
  grep browser_download |\
  grep $OS |\
  cut -d '"' -f 4 |\
  xargs curl -O -L

RUN mv kustomize_*_${OS}_amd64 kustomize && \
  chmod u+x kustomize && \
  mv kustomize /usr/local/bin/
