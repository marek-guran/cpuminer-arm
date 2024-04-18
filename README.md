## To run use:
```bash
docker run -d \
--name minerd \
-e ALGO="scrypt" \
-e URL="stratum+tcp://pepeguild.com:3333" \
-e EMAIL="email-or-wallet-or-worker_name" \
-e PASSWORD="x" \
-e THREADS="1" \
emgi2/cpuminer-arm:latest
```
### Based on
https://github.com/pooler/cpuminer
