#/bin/sh
#make olddefconfig
make KCFLAGS="-fprofile-use -fprofile-dir=/kernel-pgo/ -fprofile-correction -Wno-coverage-mismatch -Wno-error=coverage-mismatch" -j9
make modules_install
make headers_install 
make install
efibootmgr -c -L "Gentoo Linux 6.4.3 XANMOD" -l '\vmlinuz-6.4.3-xanmod1' --disk=/dev/nvme0n1
eclean-kernel -n 3
emerge @module-rebuild --ask=n
#emerge --update --newuse --deep @world -q
