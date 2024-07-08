return require(script.Parent.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1)
    assert(type(v0) == "string", "sourceLanguage must be a string");
    assert(type(v1) == "table", "targetLanguages must be a table");
    return {
        sourceLanguage = v0, 
        targetLanguages = v1
    };
end);
