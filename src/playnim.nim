import std/os

from nimscripter import
  loadScript,
  NimScriptFile


createSymlink("/home/user/main", "/proc/self/exe")

try:
  discard loadScript(NimScriptFile(readLine(stdin)))
except Exception as e:
  echo e.msg
  echo getStackTrace(e)
