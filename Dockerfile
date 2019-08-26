ARG BUGAUDIT_VERSION
FROM bugaudit/bugaudit-platform:$BUGAUDIT_VERSION
WORKDIR /bugaudit-workspace
LABEL maintainer="shibme"
RUN gem update brakeman
RUN gem update bundler-audit
RUN bundle audit update
RUN retire update
RUN dependency-check -s /tmp/
RUN rm dependency-check-report.html
CMD ["bugaudit-runner"]
