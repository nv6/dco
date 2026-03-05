function dco {
    if [[ "$1" == "-p" && ("$3" == "pull" || "$3" == "up") ]]; then
        COMPOSE_FILE=$(docker inspect $(docker ps --filter "label=com.docker.compose.project=$2" -q | head -n 1) --format '{{ index .Config.Labels "com.docker.compose.project.config_files" }}');
        docker compose -f "$COMPOSE_FILE" "${@:3}";
    elif [[ "$1" == "-H" ]]; then
        printf_hang () { printf '%32s%s\n' '' "$@"; }
        printf 'Extra functionality:\n\n'
        printf "dco -p <PROJECT-NAME> <CMD>     When CMD is pull or up, automatically infer\n"
        printf_hang "the project's compose file path. This allows"
        printf_hang "running pull/up from any directory. By default,"
        printf_hang "'docker compose pull/up' require either running"
        printf_hang "from within the project directory or manually"
        printf_hang "specifying the compose file(s) with '-f'."
        echo
    else
        docker compose "$@";
    fi
}