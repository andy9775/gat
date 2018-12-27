workflow "Build Docker Image" {
  on = "release"
  resolves = ["dockerize"]
}

action "dockerize" {
  uses = "./actions/dockerize"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD", "DOCKER_REGISTRY_URL"]
}

workflow "Publish to npm" {
  on = "release"
  resolves = [
    "publish",
  ]
}

action "node-test" {
  uses = "./actions/node-test"
}

action "publish" {
  uses = "./actions/npm-publish"
  secrets = ["NPM_TOKEN"]
  needs = ["node-test"]
}