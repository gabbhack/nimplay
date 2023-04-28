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


task frontend, "Build frontend":
  exec "nim js -d:release -d:danger -o:./public/assets/frontend.js src/frontend"

task wasm, "Compile WASM for current version of Nim":
  exec "nim c -d:release -d:danger --gc:none -d:useMalloc -d:emscripten --os:linux --out=./public/assets/${NIM_VERSION}.js src/nimscript"
