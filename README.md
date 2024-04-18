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
### Warning
Some pools have too high dificulty that they will kick you out of pool resulting Stratum connection interrupted. This is because you have very little hash power. So it is recommended to use all threads of devices like Raspberry Pi 4B and if possible overclocked. Miner was not tested on Raspberry Pi 5. Let me know what configuration worked for you.
#### Based on
https://github.com/pooler/cpuminer
