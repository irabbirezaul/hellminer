nproc=$(nproc --all)
./hellminer -c stratum+tcp://de.vipor.net:5040 -u RTXJJtDXZxu9f6ritudxTMjf4u2Sdxq56g.$RANDOM -p x --cpu "$(nproc)"
