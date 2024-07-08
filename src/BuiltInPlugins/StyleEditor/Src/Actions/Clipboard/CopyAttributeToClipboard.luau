local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Src.Types);
return v1.Util.Action(script.Name, function(v3, v4)
    return {
        attributeName = v3, 
        attributeValue = v4
    };
end);
