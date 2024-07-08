return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    local v1 = true;
    if type(v0) ~= "string" then
        v1 = v0 == nil;
    end;
    assert(v1, "Bad generationErrorType");
    return {
        initialImageId = v0
    };
end);
