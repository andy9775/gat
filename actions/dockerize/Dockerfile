FROM docker:stable

LABEL "name"="Dockerize the app"
LABEL "maintainer"="Andy Chrzaszcz <andy@digitalsharkstudios.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="layers"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.name"="Dockerize"
LABEL "com.github.actions.description"="This action dockerizes and pushes a GAT helper image"

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]