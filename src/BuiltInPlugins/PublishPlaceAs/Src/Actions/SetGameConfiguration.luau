local v0 = require(script.Parent.Parent.Parent.Src.Util.AssertType);
return require(script.Parent.Action)(script.Name, function(v1)
    v0.assertNullableType(v1, "table", "SetGameConfiguration arg");
    if not v1 then
        local _ = {};
    end;
    return {
        gameConfiguration = {
            optInRegions = v1.optInRegions or {}
        }
    };
end);
