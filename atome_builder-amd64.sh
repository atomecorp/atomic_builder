pw adduser chromium -m
pw adduser firefox -m
pkg install -y chromium firefox fvwm slim xorg-minimal

sysrc dbus_enable=yes
sysrc slim_enable=yes

sed -i '' \
	-e 's/^#default_user.*/default_user chromium/' \
	-e 's/^#auto_login.*/auto_login yes/' \
	/usr/local/etc/slim.conf
