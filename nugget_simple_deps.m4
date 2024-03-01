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
