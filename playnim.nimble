# Package

version       = "0.1.0"
author        = "Gabben"
description   = "A new awesome Nim playground"
license       = "MIT"
srcDir        = "src"
bin           = @["playnim"]


# Dependencies

requires "nim >= 1.6.10"
requires "nimscripter"

task release, "Do the job":
  exec "nim c -d:release -d:danger --mm:none -d:useMalloc -d:emscripten --os:linux --out=index.html src/playnim"

task debug, "Do the job":
  exec "nim c --mm:none --debugger:native -d:useMalloc -d:emscripten --os:linux --out=index.html src/playnim"
