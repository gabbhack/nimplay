import std/os

from nimscripter import
  loadScript,
  NimScriptFile


proc main() =
  # Nim compiler calls getApplAux("/proc/self/exe") for linux target
  createSymlink("/home/user/main", "/proc/self/exe")

proc runScript(script: cstring) {.exportc.} =
  try:
    discard loadScript(NimScriptFile($script))
  except Exception as e:
    echo e.msg
    echo getStackTrace(e)

when isMainModule:
  main()
