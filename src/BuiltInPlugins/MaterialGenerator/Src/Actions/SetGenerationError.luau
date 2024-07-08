local l_Parent_0 = script.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local v2 = require(l_Parent_0.Src.Enum.GenerationErrorType);
return l_Action_0(script.Name, function(v3, v4)
    assert(v2.isEnumValue(v3), "Bad generationErrorType");
    return {
        generationErrorType = v3, 
        message = v4
    };
end);
