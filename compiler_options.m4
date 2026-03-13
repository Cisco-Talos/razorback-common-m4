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

ICC=no
if eval "echo $CC|grep icc >/dev/null" ; then
    if eval "$CC -help |grep libcxa >/dev/null" ; then
        CFLAGS="$CFLAGS -ip -static-libcxa"
        XCCFLAGS="-XCClinker -static-libcxa"
    else
        CFLAGS="$CFLAGS -ip -static-intel"
        XCCFLAGS="-XCClinker -static-intel"
    fi
    if test "$COPT" = "-O2" ; then
        COPT="-O3"
    fi
    CWARNINGS="-wd869"
    ICC=yes
    GCC=no
fi

if test "$GCC" = yes ; then
    if test "x$enable_debug" = "xyes"; then
        CFLAGS="-ggdb $CFLAGS"
    else
        CFLAGS="-O2 $CFLAGS"
    fi

    if test "x$enable_profile" = "xyes"; then
        LDFLAGS="$LDFLAGS -XCClinker -pg"
    fi

    CFLAGS="$CFLAGS -std=c11 -fno-strict-aliasing"
    CPPFLAGS="$CPPFLAGS -fno-strict-aliasing"
    CWARNINGS="$CWARNINGS -Wall -Werror -Wwrite-strings -Wformat -fdiagnostics-show-option -Wextra -Wformat-security -Wsign-compare -Wcast-align -Wno-unused-parameter"
    if test "x$NOT_PEDANTIC" = "x"; then
        CWARNINGS="$CWARNINGS -pedantic"
    fi
    echo $CFLAGS
fi

