return require(script.Parent.Action)(script.Name, function(v0)
    return {
        editorMode = v0, 
        editorModeSwitchTime = os.time()
    };
end);
