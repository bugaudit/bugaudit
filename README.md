# BugAudit
[![Build Status](https://gitlab.com/bugaudit/bugaudit/badges/master/pipeline.svg)](https://gitlab.com/bugaudit/bugaudit/pipelines)

BugAudit runner built with all environmental dependencies bundled inside a docker image

### Requirements
Install the latest stable version of docker client

### What does it do?
Scans the repository you specify and tracks the issue in your preferred issue tracking system

### Where to begin?
Run the following in your terminal and you'll be guided from there
```bash
curl -s https://bugaudit.github.io/bugaudit/audit | bash
```
[Refer this](https://bugaudit.github.io/bugaudit/config.json) for a sample config file
