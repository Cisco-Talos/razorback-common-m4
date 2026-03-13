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

## Expand ${prefix} in sysconfdir if its the default value.

AS_AC_EXPAND(SYSCONFDIR, "$sysconfdir/razorback")
sysconfdir=$SYSCONFDIR

AS_AC_EXPAND(LIBEXECDIR, "$libexecdir/razorback/$PACKAGE_NAME")
libexecdir=$LIBEXECDIR

AC_DEFINE_UNQUOTED(ETC_DIR, "$SYSCONFDIR", ["Location of config files"])

AC_DEFINE_UNQUOTED(DEFAULT_CONFIG_FILE, "$SYSCONFDIR/rzb.conf", ["Location of config files"])
