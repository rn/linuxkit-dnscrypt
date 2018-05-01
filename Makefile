ARCH := $(shell uname -m)

ifeq ($(ARCH),x86_64)
DNSCRYPT_FORMAT = kernel+initrd
endif
ifeq ($(ARCH),aarch64)
DNSCRYPT_FORMAT = rpi3
endif

.PHONY: dnscrypt-proxy
dnscrypt-proxy:
	linuxkit pkg build -dev -org local pkg/dnscrypt-proxy
	linuxkit build -format $(DNSCRYPT_FORMAT) -name dnscrypt-proxy dnscrypt-proxy-$(ARCH).yml


.PHONY: run
run:
	linuxkit run -publish 2222:22/tcp -publish 10053:53/tcp -publish 10053:53/udp dnscrypt-proxy
