workflow "Build Docker Image" {
  on = "push"
  resolves = ["dockerize"]
}

action "dockerize" {
  uses = "./actions/dockerize"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD", "DOCKER_REGISTRY_URL"]
}