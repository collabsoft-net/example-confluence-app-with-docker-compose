#/bin/bash
CONFLUENCE_VERSION=8.0.0

if [ ! -d ".docker/atlassian-confluence" ];
then
  git clone --recurse-submodule https://bitbucket.org/atlassian-docker/docker-atlassian-confluence-server.git .docker/atlassian-confluence
else
  git pull
fi

(cd .docker/atlassian-confluence && docker build --tag atlassian/confluence --build-arg CONFLUENCE_VERSION=$CONFLUENCE_VERSION .)
docker-compose up --build