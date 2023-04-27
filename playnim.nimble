# Package

version       = "0.1.0"
author        = "Gabben"
description   = "A new awesome Nim playground"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.0.0"
requires "nimscripter"
requires "karax"

task release, "Do the job":
  exec "nim js -d:release -d:danger -o:./public/assets/frontend.js src/frontend"
  exec "nim c -d:release -d:danger --mm:none -d:useMalloc -d:emscripten --os:linux --out=./public/assets/wasm.js src/wasm"
