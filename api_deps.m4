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

# Setup the sysconfdir for all consumers.
m4_include(common_m4/as_ac_expand.m4)
m4_include(common_m4/set_dirs.m4)

AC_CHECK_LIB([rt], [timer_create])
AC_CHECK_LIB([m], [floor])
AC_CHECK_LIB([pthread], [pthread_create])
AC_CHECK_LIB([crypto], [EVP_MD_fetch])
AC_CHECK_LIB([ssl], [SSL_write])
AC_CHECK_LIB([magic], [magic_open])
AC_CHECK_LIB([dl], [dlopen])
AC_CHECK_LIB([pcre], [pcre_compile])

AC_CHECK_LIB([uuid], [uuid_copy], [], [UUID="no"])
AS_IF([test "x$UUID" = "xno"],
          [AC_MSG_ERROR("uuid library not found")]
     )

AC_CHECK_LIB([curl], [curl_easy_perform], [
    CURL_CFLAGS=`curl-config --cflags`
    CURL_LIBS=`curl-config --libs`
    CFLAGS="$CFLAGS $CURL_CFLAGS"
    LIBS="$CURL_LIBS $LIBS"
], [CURL="no"])
AS_IF([test "x$CURL" = "xno"],
          [AC_MSG_ERROR("curl library not found")]
     )

AC_CHECK_HEADERS([uuid/uuid.h], [], [UUID_HEADER="no"])
AS_IF([test "x$UUID_HEADER" = "xno"],
          [AC_MSG_ERROR("uuid header file not found")]
     )

AC_CHECK_HEADERS([openssl/evp.h openssl/opensslv.h], [], [OPENSSL_HEADER="no"])
AS_IF([test "x$OPENSSL_HEADER" = "xno"],
          [AC_MSG_ERROR("openssl header file not found")]
     )

AC_CACHE_CHECK([for OpenSSL >= 3.0], [rb_cv_openssl_v3], [
    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
#include <openssl/opensslv.h>
#if defined(OPENSSL_VERSION_MAJOR)
# if OPENSSL_VERSION_MAJOR < 3
#  error OpenSSL 3.0 or newer is required
# endif
#elif OPENSSL_VERSION_NUMBER < 0x30000000L
# error OpenSSL 3.0 or newer is required
#endif
    ]], [[]])],
    [rb_cv_openssl_v3=yes],
    [rb_cv_openssl_v3=no])
])
AS_IF([test "x$rb_cv_openssl_v3" != "xyes"],
          [AC_MSG_ERROR("OpenSSL 3.0 or newer is required")]
     )

AC_CHECK_HEADERS([magic.h], [], [MAGIC_HEADER="no"])
AS_IF([test "x$MAGIC_HEADER" = "xno"],
          [AC_MSG_ERROR("magic header file not found")]
     )

#AC_CHECK_HEADERS([pcre.h], [], [PCRE_HEADER="no"])
#AS_IF([test "x$PCRE_HEADER" = "xno"],
#          [AC_MSG_ERROR("pcre header file not found")]
#     )

PKG_CHECK_MODULES([LIBRABBITMQ], [librabbitmq >= 0.11.0])
CFLAGS="$LIBRABBITMQ_CFLAGS $CFLAGS"
LIBS="$LIBRABBITMQ_LIBS $LIBS"

PKG_CHECK_MODULES([LIBCONFIG], [libconfig >= 1.3.2])
CFLAGS="$LIBCONFIG_CFLAGS $CFLAGS"
LIBS="$LIBCONFIG_LIBS $LIBS"

AC_CHECK_HEADERS([curl/curl.h], [], [CURL_HEADER="no"])
AS_IF([test "x$CURL_HEADER" = "xno"],
          [AC_MSG_ERROR("curl header file not found")]
     )

PKG_CHECK_MODULES([JSON], [json-c >= 0.9])

CFLAGS="$JSON_CFLAGS $CFLAGS"
LIBS="$JSON_LIBS $LIBS"

PKG_CHECK_MODULES([SSH], [libssh >= 0.9])

CFLAGS="$SSH_CFLAGS $CFLAGS"
LIBS="$SSH_LIBS $LIBS"
