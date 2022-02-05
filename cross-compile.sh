
version=1.58.1
docker run \
    --volume /Users/waldemarlink/Projects/HomeKubernetes/rocket_test_project:/home/cross/project \
    # --volume <path to directory containing the platform dependencies>:/home/cross/deb-deps \ # optional, see section "Platform dependencies"
    # --volume <path to local cargo registry, e.g. ~/.cargo/registry>:/home/cross/.cargo/registry \ # optional, using cached registry avoids updating on every build
    ragnaroek/rust-raspberry:$version
    "build --release"

    docker run \
    --volume /Users/waldemarlink/Projects/HomeKubernetes/rocket_test_project:/home/cross/project \
    ragnaroek/rust-raspberry:1.58.1
    "build"