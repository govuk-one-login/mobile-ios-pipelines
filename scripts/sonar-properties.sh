#!/usr/bin/env bash
cat <<EOF
sonar.projectKey=di-$2
sonar.projectName=di-$2
sonar.organization=$1
sonar.pullrequest.github.repository=$1/$2
sonar.projectVersion=1.0
sonar.sources=Sources/
sonar.tests=Tests/
sonar.language=swift
sonar.sourceEncoding=UTF-8
sonar.pullrequest.provider=github
sonar.host.url=https://sonarcloud.io
EOF