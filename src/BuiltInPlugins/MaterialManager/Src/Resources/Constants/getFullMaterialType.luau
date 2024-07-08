local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Resources.Constants.getMaterialName);
return function(v3, v4)
    return v4:getText("Materials", v2(v3.Material) .. (not v3.MaterialVariant and "Material" or "Variant"));
end;
