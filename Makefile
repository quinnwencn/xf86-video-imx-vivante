TOPDIR	:= $(shell /bin/pwd)

export TOPDIR

base_libdir ?= /lib

.PHONY: util EXA all clean install

all : util EXA

util:
	@echo
	@echo Invoking util make...
	$(MAKE) -C $(TOPDIR)/util/autohdmi -f makefile.linux

EXA:
	@echo
	@echo Invoking EXA make...
	$(MAKE) -C $(TOPDIR)/EXA/src -f makefile.linux

install:
	mkdir -p $(DESTDIR)/$(prefix)/bin
	cp $(TOPDIR)/util/autohdmi/autohdmi $(DESTDIR)/$(prefix)/bin/
	chmod 700 $(DESTDIR)/$(prefix)/bin/autohdmi
	mkdir -p $(DESTDIR)/$(prefix)$(base_libdir)
	mkdir -p $(DESTDIR)/$(prefix)$(base_libdir)/xorg/modules/drivers/
	cp $(TOPDIR)/EXA/src/vivante_drv.so $(DESTDIR)/$(prefix)$(base_libdir)/xorg/modules/drivers/

clean:
	$(MAKE) -C $(TOPDIR)/util/autohdmi -f makefile.linux $@
	$(MAKE) -C $(TOPDIR)/EXA/src -f makefile.linux $@
