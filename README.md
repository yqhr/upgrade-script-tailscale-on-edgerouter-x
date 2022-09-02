# Upgrade-script-tailscale-on-edgerouter-x
Shell script for upgrading tailscale on edgerouter x (for personal use...)

ref: https://gist.github.com/lg/6f80593bd55ca9c9cf886da169a972c3

1. Download script and move it in `/config/`.
```
cd /config
sudo curl -O https://raw.githubusercontent.com/yqhr/upgrade-script-tailscale-on-edgerouter-x/main/upgrade-tailscale.sh
```
2. Make the file executable
```
sudo chmod +x /config/upgrade-tailscale.sh
```
3. Run the script.
```
sudo bash /config/upgrade-tailscale.sh
```
