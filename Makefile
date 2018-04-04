JAIL=		FreeBSD:12:arm
PORTSTREE=	default

TIMESTAMP!=	date '+%Y%m%d'

all:
	@echo 'usage: make <TARGET>'

create-jail:
	sudo poudriere jail -c -j ${JAIL} -a arm.armv7 -m svn+https -v head -K BEAGLEBONE -J4

update-jail:
	sudo poudriere jail -u -j ${JAIL} -J4

build-run-depends:
	sudo poudriere bulk -j ${JAIL} -p ${PORTSTREE} -f ${.CURDIR}/run-depends

build-image-base:
	sudo poudriere image -c ${.CURDIR}/image-overlay -f ${.CURDIR}/run-depends -h eve.atome.io -j ${JAIL} -n eve-${TIMESTAMP} -o ${.CURDIR}/out -t tar

flash:
	sudo dd if=eve-headless-bbk of=/dev/da2 bs=1m
