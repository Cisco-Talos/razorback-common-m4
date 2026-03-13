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

m4_include([common_m4/api_deps.m4])

NUGGET_VERSION=NUGGET_VERSION_NUMBER

# Support searching the for the API in $prefix and in the argument to --with-api
export PKG_CONFIG_PATH=$prefix/lib/pkgconfig:$PKG_CONFIG_PATH
if test "x$with_api" != "x"; then
    export PKG_CONFIG_PATH=$with_api:$PKG_CONFIG_PATH
fi

PKG_CHECK_MODULES([RAZORBACK], [razorback >= 0.1.3])

# Munge the compiler flags if we specify where the API is located.
if test "x$with_api" != "x"; then
    RAZORBACK_CFLAGS="-I$with_api/include -I$with_api/libssh/include"
    RAZORBACK_LIBS="-L$with_api/src -lrazorback_api"
else
    RAZORBACK_CFLAGS="-I${includedir} -I${includedir}/razorback"
fi
