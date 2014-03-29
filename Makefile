PREFIX = /usr/local

CC = clang
CFLAGS += -std=c99 -O2 -Wmost -DVERSION=\"$(shell git describe)\" $(shell pkg-config --cflags gio-2.0)
LDLIBS = -lseccomp $(shell pkg-config --libs gio-2.0) -lsystemd
LDFLAGS += -Wl,--as-needed

playpen: playpen.c

install: playpen
	install -Dm755 $< $(DESTDIR)$(PREFIX)/bin/$<
