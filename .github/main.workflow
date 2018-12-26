workflow "Build" {
  on = "push"
  resolves = ["dockerize", "publish"]
}

action "dockerize" {
  uses = "./actions/dockerize"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD", "DOCKER_REGISTRY_URL"]
}

action "publish" {
  uses = "./actions/npm-publish"
  secrets = ["NPM_TOKEN"]
}