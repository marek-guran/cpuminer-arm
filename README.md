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
#### What you can mine
- Pepecoin or anything that uses scrypt
- LTC
- BTC
### Running on Android or natively on Linux
1. Install: https://play.google.com/store/apps/details?id=tech.ula&hl=en_US
2. Choose your distro and boot it (recommended debian)
3. Execute commands:
```bash
sudo apt update && sudo apt upgrade -y && sudo apt install -y libjansson4 wget && wget --no-check-certificate https://github.com/marek-guran/cpuminer-arm/releases/download/1.0.1/minerd-arm64 && chmod 777 minerd-arm64
```
4. Run it with
```bash
./minerd-arm64 -o stratum+tcp://pepeguild.com:3333 -u email.or-wallet-or-worker_name -p anything -t 1
```
If you dont specify -t, it will use all CPU threads and if it wont start, try running it with sudo. You can start it later by clicking sessions section in app.
#### Tested devices and their configurations (Based on your feedback)
1. Xiaomi Redmi Note 9 Pro - 17 KH/s - threads 7 (8 crashes miner) - no modifications
2. Raspberry Pi 4B - 8 KH/s - all threads - no overclock
##### Based on
https://github.com/pooler/cpuminer
