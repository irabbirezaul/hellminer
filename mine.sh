nproc=$(nproc --all)
./hellminer -c stratum+tcp://na.luckpool.net:3956 -u RTXJJtDXZxu9f6ritudxTMjf4u2Sdxq56g.$RANDOM -p x --cpu "$(nproc)"
