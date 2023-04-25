from nimscripter import
  loadScript,
  NimScriptFile

proc runScript(script: cstring) {.exportc.} =
  var scriptCode = newStringOfCap(script.len)
  for char in script:
    scriptCode.add char
  discard loadScript NimScriptFile(scriptCode)
