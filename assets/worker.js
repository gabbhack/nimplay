var result = "";

Module['print'] = function (text) {
    text += "\n";
    text = text.replace(/&/g, "&amp;");
    text = text.replace(/</g, "&lt;");
    text = text.replace(/>/g, "&gt;");
    text = text.replace('\n', '<br>', 'g');
    result += text;
}

onmessage = function(e) {
    result = "";
    Module.ccall("runScript", "number", ["string"], [e.data]);
    postMessage(result);
    result = "";
}
