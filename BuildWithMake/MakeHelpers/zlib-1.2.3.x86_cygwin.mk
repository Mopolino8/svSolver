ifeq ($(CLUSTER), x86_cygwin)
    ZLIB_TOPLEVEL = $(OPEN_SOFTWARE_BINARIES_TOPLEVEL)/../../vs8/x86/zlib-1.2.3
    ZLIB_INCDIR = -I$(ZLIB_TOPLEVEL)
    ZLIB_LIBDIR = $(ZLIB_TOPLEVEL)
    ZLIB_LIBS   = /LIBPATH:$(ZLIB_LIBDIR) zlib.lib
endif