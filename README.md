<!--
Copyright (c) 2011-2026 Cisco Systems, Inc.

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License version 2 as
 published by the Free Software Foundation.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 MA 02110-1301, USA.
-->

# common_m4

`common_m4` is the shared Autoconf macro repository used by Razorback build
trees. It centralizes configure-time checks, compiler and linker defaults,
version macros, visibility settings, and common nugget dependency helpers so
multiple projects can consume the same M4 logic.

## Contents

- `api_deps.m4`: core library and API dependency checks.
- `build_tools.m4`, `compiler_options.m4`, `cflags.m4`, `platform_flags.m4`,
  `standard_options.m4`: toolchain and configure option helpers.
- `nugget_base_deps.m4`, `nugget_options.m4`, `nugget_simple_deps.m4`,
  `nugget_subs.m4`: nugget-oriented build helpers.
- `versions.m4`, `visibility.m4`, `set_dirs.m4`, `as_ac_expand.m4`:
  versioning, directory expansion, and symbol visibility helpers.

## Using These Macros

Place this repository at `common_m4/` beside the consuming project's
`configure.ac`, then include the required macro files:

```m4
m4_include([common_m4/versions.m4])
m4_include([common_m4/build_tools.m4])
m4_include([common_m4/api_deps.m4])
```

After wiring the macros into `configure.ac`, regenerate the build system with
`autoreconf -fi` or the project's normal bootstrap step.

## License

This repository is distributed under the GNU General Public License version 2.
See [LICENSE](LICENSE) for the full license text.
