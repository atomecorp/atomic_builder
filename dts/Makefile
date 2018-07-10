DTBOS=	am335x-beaglebone-tscadc.dtbo

install: ${DTBOS}
	install -d ../image-overlay/boot/dtb
	cp *.dtbo ../image-overlay/boot/dtb

clean:
	rm -f *.dtbo

.SUFFIXES: .dtbo .dtso

.dtso.dtbo:
	dtc -I dts -O dtb -o ${.TARGET} ${.IMPSRC}
