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

AC_CHECK_LIB([curl], [curl_easy_perform], [
    CURL_CFLAGS=`curl-config --cflags`
    CURL_LIBS=`curl-config --libs`
    CFLAGS="$CFLAGS $CURL_CFLAGS"
    LIBS="$CURL_LIBS $LIBS"
], [CURL="no"])
AS_IF([test "x$CURL" = "xno"],
          [AC_MSG_ERROR("curl library not found")]
     )

AC_CHECK_HEADERS([curl/curl.h], [], [CURL_HEADER="no"])
AS_IF([test "x$CURL_HEADER" = "xno"],
          [AC_MSG_ERROR("curl header file not found")]
     )


