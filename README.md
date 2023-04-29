# NimPlay

NimPlay is a fork of https://github.com/PMunch/nim-playground-frontend/ with Nim VM in WebAssembly.

# Structure
- src/frontend.nim - frontend and communication with the worker, compiled to JS via `nimble frontend`
- src/nimscript.nim - Nim VM, exports `runScript` function for JS, compiled to WASM and JS via `nimble wasm`
- public/worker.js - receives code messages from the main thread and returns the result, included in wasm js at compile time

`nimble wasm` will generate 3 files for you:

nim_version.wasm - actually run Nim VM

nim_version.js - provides js api, configures the file system. Compiled with public/worker.js

nim_version.data - Nim stdlib

nim_version - current Nim version on your machine

NimPlay supports switching Nim versions. To do this, you need to generate this 3 files for each version, and add the version number separated by commas to `nim.cfg`


# Build
1. Install Nim > 1.6.0 with [choosenim](https://github.com/dom96/choosenim)
2. Install [emscripten](https://emscripten.org/docs/getting_started/downloads.html)
3. Run `nimble frontend`
4. Run `nimble wasm`
5. Serve `public/index.html`. For dev you can use `emrun public/index.html` cmd
