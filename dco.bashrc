function dco {
    if [[ "$1" == "-p" && ("$3" == "pull" || "$3" == "up") ]]; then
        COMPOSE_FILE=$(docker inspect $(docker ps --filter "label=com.docker.compose.project=$2" -q | head -n 1) --format '{{ index .Config.Labels "com.docker.compose.project.config_files" }}');
        docker compose -f "$COMPOSE_FILE" "${@:3}";
    else
        docker compose "$@";
    fi
}