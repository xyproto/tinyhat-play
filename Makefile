PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
DATADIR ?= $(PREFIX)/share
CFLAGS ?= -O2 -pipe
PKG_CONFIG ?= pkg-config

all: tinyhat-play tinyhat-retro

tinyhat-play: main.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $$($(PKG_CONFIG) --cflags gtk4 libcurl) -o $@ main.c $(LDFLAGS) $$($(PKG_CONFIG) --libs gtk4 libcurl)

tinyhat-retro: tinyhat-retro.c libretro.h
	$(CC) $(CPPFLAGS) $(CFLAGS) -I. $$($(PKG_CONFIG) --cflags sdl3) -o $@ tinyhat-retro.c $(LDFLAGS) $$($(PKG_CONFIG) --libs sdl3)

install: all
	install -Dm755 tinyhat-play "$(DESTDIR)$(BINDIR)/tinyhat-play"
	install -Dm755 tinyhat-retro "$(DESTDIR)$(BINDIR)/tinyhat-retro"
	install -Dm755 tinyhat-emulate "$(DESTDIR)$(BINDIR)/tinyhat-emulate"
	install -Dm644 system/tinyhat-play.desktop "$(DESTDIR)$(DATADIR)/applications/tinyhat-play.desktop"
	install -Dm644 LICENSE "$(DESTDIR)$(DATADIR)/licenses/tinyhat-play/LICENSE"

clean:
	rm -f tinyhat-play tinyhat-retro

.PHONY: all install clean
