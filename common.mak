ifndef TOOL_PREFIX
TOOL_PREFIX	=
endif
ifndef OSNAME
OSNAME		= $(shell uname -s | sed -e 's/.*CYGWIN.*/cygwin/g')
endif
ifndef SQLITE
SQLITE		= false
endif

ifndef LIBAIRPCAP
LIBAIRPCAP	=
endif

ifeq ($(OSNAME), cygwin)
EXE		= .exe
PIC		=
SQLITE		= false
else
EXE		=
PIC		= -fPIC
ifndef SQLITE
SQLITE		= true
endif
endif

ifeq ($(SQLITE), true)
COMMON_CFLAGS	= -I/usr/local/include -DHAVE_SQLITE
else
COMMON_CFLAGS	=
endif

ifeq ($(sqlite), true)
COMMON_CFLAGS	= -I/usr/local/include -DHAVE_SQLITE
endif

ifeq ($(SQLITE), TRUE)
COMMON_CFLAGS	= -I/usr/local/include -DHAVE_SQLITE
endif

ifeq ($(sqlite), TRUE)
COMMON_CFLAGS	= -I/usr/local/include -DHAVE_SQLITE
endif

ifeq ($(airpcap), true)
AIRPCAP		= true
endif

ifeq ($(AIRPCAP), true)
LIBAIRPCAP	= -DHAVE_AIRPCAP -I$(AC_ROOT)/../developers/Airpcap_Devpack/include
endif

CC		= $(TOOL_PREFIX)gcc
RANLIB		= $(TOOL_PREFIX)ranlib
AR		= $(TOOL_PREFIX)ar

REVISION	= `$(AC_ROOT)/evalrev`
REVFLAGS	= -D_REVISION=$(REVISION)

OPTFLAGS        = -D_FILE_OFFSET_BITS=64
CFLAGS          ?= -g -W -Wall -Werror -O3
CFLAGS          += $(OPTFLAGS) $(REVFLAGS) $(COMMON_CFLAGS)

prefix          = /usr/local
bindir          = $(prefix)/bin
sbindir         = $(prefix)/sbin
mandir          = $(prefix)/man/man1
datadir         = $(prefix)/share
docdir          = $(datadir)/doc/aircrack-ng
libdir		= $(prefix)/lib
