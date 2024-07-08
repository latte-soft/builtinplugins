local l_Parent_0 = script.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local v2 = require(l_Parent_0.Src.Utility.EditingMode);
return l_Action_0(script.Name, function(v3)
    assert(type(v3) == "string");
    return {
        statusMessage = v3, 
        editingMode = v2.None
    };
end);
