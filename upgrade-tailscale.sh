#!/bin/bash

# ref: https://gist.github.com/lg/6f80593bd55ca9c9cf886da169a972c3

# ref: https://www.walbrix.co.jp/article/shellscript-check-if-root.html
if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit 1
fi

echo "current tailscale version: $(tailscale version | head -1)"
server_file=$(curl -s https://pkgs.tailscale.com/stable/ | grep "mipsle" | sed -e 's/^.*href=\"\(.*\.tgz\)\">.*$/\1/')
server_version=$(echo $server_file | sed -e "s/^tailscale_\(.*\)_mipsle.tgz$/\1/g")
echo "remote tailscale version: $server_version"

while true; do
	echo "Upgrade to the latest version? [y/n]"
	read ans

	case $ans in
	y)
		echo "Upgradeing..."
		break
		;;
	n)
		echo "Stop upgrade"
		exit
		;;
	*)
		echo "Press y or n"
		;;
	esac
done

# sudo bash    # if you havent already
rm -rf /tmp/tailscale*
curl "https://pkgs.tailscale.com/stable/$server_file" | tar xvz -C /tmp
systemctl disable --now tailscaled
cp /tmp/tailscale_*/{tailscale,tailscaled} /config/
systemctl enable --now tailscaled
