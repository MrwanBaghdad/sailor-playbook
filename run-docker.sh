
docker run -it \
    --env-file secret.env \
    -v ${PWD}:${PWD} \
    -v ~/.ssh/:/root/.ssh \
    -w ${PWD} terraform-cli \
    sh
