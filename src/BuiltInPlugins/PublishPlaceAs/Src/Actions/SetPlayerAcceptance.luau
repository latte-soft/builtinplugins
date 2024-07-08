local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.AssertType);
return require(l_Parent_0.Src.Actions.Action)(script.Name, function(v2)
    v1.assertType(v2, "boolean", "SetPlayerAcceptance");
    return {
        playerAcceptance = v2
    };
end);
