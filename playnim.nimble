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

import strformat

let
  pass = "-O3 -flto -s INLINING_LIMIT -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -s EXPORTED_FUNCTIONS=_main,_runScript -s EXPORTED_RUNTIME_METHODS=ccall"
  passC = pass
  passL = pass & &" --pre-js public/assets/worker.js --preload-file ~/.choosenim/toolchains/nim-{NIM_VERSION}/lib"
  wasmOut = &"./public/assets/{NIM_VERSION}.js"

task frontend, "Build frontend":
  exec "nim js -d:release -d:danger -o:./public/assets/frontend.js src/frontend"

task wasm, "Compile WASM for current version of Nim":
  exec &"nim c -d:release -d:danger --gc:none -d:useMalloc -d:emscripten --os:linux --out={wasmOut} --passC=\"{passC}\" --passL=\"{passL}\" src/nimscript"
