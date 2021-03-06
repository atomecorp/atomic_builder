pw adduser firefox -m
pkg install -y firefox fvwm slim xorg-minimal

sysrc dbus_enable=yes
sysrc slim_enable=yes

sed -i '' \
	-e 's/^#default_user.*/default_user firefox/' \
	-e 's/^#auto_login.*/auto_login yes/' \
	/usr/local/etc/slim.conf
