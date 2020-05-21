cgroupid: cgroupid.c
	gcc -Wall -static -o cgroupid cgroupid.c

install: cgroupid
	install -d /usr/share/containers/oci/hooks.d
	install -m 644 capabilities_tracker.json /usr/share/containers/oci/hooks.d/
	install -m 755 cgroupid /usr/local/libexec/
	install -m 755 capable-hook /usr/local/libexec/
	install -m 755 capabilities-tracker /usr/local/bin/

uninstall:
	rm -f /usr/share/containers/oci/hooks.d/capabilities_tracker.json
	rmdir --ignore-fail-on-non-empty /usr/share/containers/oci/hooks.d
	rm -f /usr/local/libexec/cgroupid
	rm -f /usr/local/libexec/capable-hook
	rm -f /usr/local/bin/capabilities-tracker
