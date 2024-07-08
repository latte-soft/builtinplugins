local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Src.Types);
local l_filter_0 = v1.Dash.filter;
local v4 = require(l_Parent_0.Src.Util.MapMaterials);
return function(v5, v6, v7)
    local v8 = {};
    v4(v5, v8, function(v9)
        local l_MaterialVariant_0 = v9.MaterialVariant;
        if l_MaterialVariant_0 then
            l_MaterialVariant_0 = false;
            if v9.MaterialVariant.Name == v6 then
                l_MaterialVariant_0 = v9.Material == v7;
            end;
        end;
        return l_MaterialVariant_0;
    end);
    return #l_filter_0(v8, function(v11)
        return v11 ~= false;
    end) > 1;
end;
