JAIL=		12_CURRENT_arm
PORTSTREE=	default

TIMESTAMP!=	date '+%F'

NCPU!=		sysctl -n hw.ncpu

all:
	@echo 'usage: make <TARGET>'

create-jail:
	sudo poudriere jail -c -x -j ${JAIL} -a arm.armv7 -m svn+https -v head -K BEAGLEBONE -J${NCPU}

update-jail:
	sudo poudriere jail -u -j ${JAIL} -J4

build-run-depends:
	sudo poudriere bulk -j ${JAIL} -p ${PORTSTREE} -f ${.CURDIR}/run-depends

build-image-base:
	cd dts && ${MAKE} install
	sudo poudriere image -c ${.CURDIR}/image-overlay -f ${.CURDIR}/run-depends -h eve.atome.io -j ${JAIL} -n eve-${TIMESTAMP} -o ${.CURDIR}/out -t tar

flash:
	sudo dd if=eve-headless-bbk of=/dev/da2 bs=1m
	sync

compress: eve-bbk-${TIMESTAMP}.xz

eve-bbk-${TIMESTAMP}.xz: eve-headless-bbk
	xz -9 -T4 < eve-headless-bbk > eve-bbk-${TIMESTAMP}.xz

upload: eve-bbk-${TIMESTAMP}.xz
	echo "put eve-bbk-${TIMESTAMP}.xz" | cadaver https://private.atome.io:9090/remote.php/webdav/Romain/
