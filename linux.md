# On Linux

## Install

### From an install script


First, you need to install the required packages:

```bash
# for Debian/Ubuntu
add-apt-repository ppa:git-core/ppa
apt update; apt install git
```
Second, you paste to your bash, please make sure your file "autoShutdown" in home/your-user (=) ~"

```bash
 git clone https://github.com/RezaxOnes/autoShutdown
 cd autoShutdown
 sudo chmod +x script-setup.sh && sudo chmod +x uninstall.sh
 sudo ./script-setup.sh
```
- Please make sure you have used sudo.
- Enjoy it! =)

## To uninstall

```bash
cd autoShutdown
sudo ./uninstall.sh
```

- Please make sure you have used sudo.
