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

# This filw provides the basic autoconf macros for creating a simple .so loadable nugget for use behind nuggetd.

m4_include([common_m4/nugget_base_deps.m4])

if test "x$enable_nuggetd_check" = "xyes"; then
    export PATH=$prefix/bin:$PATH
    AC_CHECK_PROG([NUGGETD], [nuggetd],[nuggetd],["no"],,)
    AS_IF([test "x$NUGGETD" = "xno"],
              [AC_MSG_ERROR("nuggetd not found")]
         )
fi
m4_include([common_m4/visibility.m4])
