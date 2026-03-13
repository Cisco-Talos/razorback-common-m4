# Copyright (c) 2011-2026 Cisco Systems, Inc.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License version 2 as
#  published by the Free Software Foundation.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

extra_incl=
case "$host" in
    *-openbsd*)
        AC_DEFINE([C_BSD],1,[os is OpenBSD])
        LDFLAGS="${LDFLAGS} -L/usr/local/lib -luuid"
        extra_incl="-I/usr/local/include"
        CPPFLAGS="${CPPFLAGS} -I/usr/local/include"
        platform="openbsd"
    ;;
    *-linux*)
        AC_DEFINE([C_LINUX],1,[target is linux])
        CDEFINE="-D_GNU_SOURCE"
        CPPFLAGS="${CPPFLAGS} -D_GNU_SOURCE"
        platform="linux"
    ;;
    *-freebsd*)
        AC_DEFINE([C_BSD],1,[os is freebsd])
        LDFLAGS="${LDFLAGS} -L/usr/local/lib -luuid"
        extra_incl="-I/usr/local/include"
        CPPFLAGS="${CPPFLAGS} -I/usr/local/include"
        platform="freebsd"
    ;;
    *-apple*)
        AC_DEFINE(BROKEN_SIOCGIFMTU,,[Define if SIOCGIFMTU unavailable])
        AC_DEFINE([C_BSD],1,[os is OS X])
        e2fs_uuid=yes
        if test -d "/sw"; then
            LDFLAGS="${LDFLAGS} -L/sw/lib"
            extra_incl="-I/sw/include"
	    CPPFLAGS="${CPPFLAGS} -I/sw/include"
        fi
        if test -d "/opt/local"; then
            LDFLAGS="${LDFLAGS} -L/opt/local/lib"
            extra_incl="-I/opt/local/include"
	    CPPFLAGS="${CPPFLAGS} -I/opt/local/include"
        fi
        LIBTOOL=glibtool
        LIBTOOLIZE=glibtoolize
        CDEFINE="-Ds6_addr32=__u6_addr.__u6_addr32"
        platform="apple"
esac

AM_CONDITIONAL([PLATFORM_LINUX], [test x$platform = xlinux])
AM_CONDITIONAL([PLATFORM_FREEBSD], [test x$platform = xfreebsd])
