FROM alpine
LABEL maintainer="shibme"
RUN mkdir bugaudit-workspace
RUN apk update && apk upgrade
RUN apk add curl wget bash
RUN apk add openssh-client
RUN apk add git
RUN apk add openjdk8-jre
RUN apk add ruby ruby-io-console ruby-bundler ruby-json
RUN gem install rdoc --no-document
RUN gem install bundler:1.17.1
RUN gem install bundler
RUN gem install brakeman
RUN gem install bundler-audit
RUN apk add npm
RUN npm install -g retire
ADD https://dl.bintray.com/jeremy-long/owasp/dependency-check-5.2.0-release.zip /bugaudit-tools/dependency-check.zip
WORKDIR /bugaudit-tools
RUN unzip dependency-check.zip
RUN rm dependency-check.zip
RUN ln -s /bugaudit-tools/dependency-check/bin/dependency-check.sh /bin/dependency-check
RUN dependency-check -s /tmp/
RUN rm dependency-check-report.html
WORKDIR /bugaudit-workspace
RUN mkdir /root/.ssh
COPY docker-git-config /root/.ssh/config
RUN chmod 400 /root/.ssh/config
ARG BUGAUDIT_CLI_URL
ADD $BUGAUDIT_CLI_URL /bugaudit-workspace/bugaudit-runner.jar
COPY bugaudit-runner /bugaudit-workspace/bugaudit-runner
RUN chmod +x /bugaudit-workspace/bugaudit-runner
CMD ["/bugaudit-workspace/bugaudit-runner"]
