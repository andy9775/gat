FROM node:latest

LABEL "name"="NPM publish the node libs"
LABEL "maintainer"="Andy Chrzaszcz <andy@digitalsharkstudios.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="layers"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.name"="npm-publish"
LABEL "com.github.actions.description"="This action publishes the npm module"

# cwd defaults to github workspace (root of source code)
ENTRYPOINT [ "yarn test" ]