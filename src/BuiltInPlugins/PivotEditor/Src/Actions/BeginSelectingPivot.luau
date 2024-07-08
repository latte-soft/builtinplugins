local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Utility.EditingMode);
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local v3 = {
    [v1.SelectGeometry] = true, 
    [v1.SelectSurface] = true, 
    [v1.SelectPart] = true
};
return l_Action_0(script.Name, function(v4, v5)
    assert(v1.isEnumValue(v4));
    assert(v3[v4]);
    assert(type(v5) == "string");
    return {
        editingMode = v4, 
        statusMessage = v5
    };
end);
