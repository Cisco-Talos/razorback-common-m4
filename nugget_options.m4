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

m4_include([common_m4/standard_options.m4])

AC_ARG_WITH(with_api, [AS_HELP_STRING([--with-api],[Location of the API])], [with_api=$withval], [])

AC_ARG_ENABLE(master-nugget-check, [AS_HELP_STRING([--disable-master-nugget-check], [Do not check for the presence of master_nugget even if its required.])], [enable_master_nugget_check=$enableval], [enable_master_nugget_check="yes"])

