#bin/bash
git clone https://github.com/glacion/genfstab.git
cd ./genfstab
bash genfstab -U /mnt/gentoo >> /mnt/gentoo/etc/fstab
