function dco {
    if [[ "$1" == "-p" && ("$3" == "pull" || "$3" == "up") ]]; then
        COMPOSE_FILE=$(docker inspect $(docker ps --filter "label=com.docker.compose.project=$2" -q | head -n 1) --format '{{ index .Config.Labels "com.docker.compose.project.config_files" }}');
        docker compose -f "$COMPOSE_FILE" "${@:3}";
    elif command -v bat >/dev/null 2>&1 && [[ "$1" == "config" ]]; then
        docker compose "$@" | bat -plyml;
    elif [[ "$1" == "-H" ]]; then
        printfcols () { printf '%-32s%s\n' "$1" "$2"; }
        printf 'Extra functionality:\n\n'
        printfcols "dco -p <PROJECT-NAME> <CMD>" "When CMD is pull or up, automatically infer\n"
        printfcols ' ' "the project's compose file path. This allows"
        printfcols ' ' "running pull/up from any directory. By default,"
        printfcols ' ' "'docker compose pull/up' require either running"
        printfcols ' ' "from within the project directory or manually"
        printfcols ' ' "specifying the compose file(s) with '-f'."
        echo
        printfcols 'dco config' "If 'bat' is installed, pretty-print the "
        printfcols ' ' "resolved compose config with syntax highlighting"
        echo
    else
        docker compose "$@";
    fi
}