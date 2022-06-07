1. lzma failed
```
dm.pl: building package com.li.firstproject:iphoneos-arm' in ./packages/com.li.firstproject_0.0.1-1+debug_iphoneos-arm.deb'
open2: exec of lzma -c6 failed at /Users/lidongxi/theos/bin/dm.pl line 113.
make: *** [internal-package] Error 2
```
  1. `brew install xz`
  2. or  `vim /Users/xxx/theos/makefiles/package/deb.mk then change _THEOS_PLATFORM_DPKG_DEB_COMPRESSION ?= lzma to _THEOS_PLATFORM_DPKG_DEB_COMPRESSION ?= gzip at line 6.`