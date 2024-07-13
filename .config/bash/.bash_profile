# .bash_profile

# Prefers Podman over Docker
# https://podman-desktop.io/docs/migrating-from-docker/using-the-docker_host-environment-variable
if [ -x $(command -v podman) ]; then
    export DOCKER_HOST=unix://$(podman info --format '{{.Host.RemoteSocket.Path}}')
fi
