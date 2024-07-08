local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local l_filter_0 = require(l_Parent_0.Packages.Framework).Dash.filter;
local v3 = require(l_Parent_0.Src.Resources.Constants.getMaterialName);
local v4 = require(l_Parent_0.Src.Util.MapMaterials);
return function(v5, v6, v7)
    local v8 = 0;
    local v9 = {};
    local v10 = {};
    v4(v6, v9, function(v11)
        if v11.MaterialVariant and v11.Material == v7 then
            return v11.MaterialVariant.Name;
        else
            return "";
        end;
    end);
    table.insert(v9, v3(v7));
    table.sort(v9);
    v9 = l_filter_0(v9, function(v12)
        if v12 ~= "" and not v10[v12] then
            if not v10[v5] then
                v8 = v8 + 1;
            end;
            v10[v12] = true;
            return true;
        else
            return false;
        end;
    end);
    table.insert(v9, 1, "None");
    if v5 ~= "" and v10[v5] then
        return v9, v8 + 1;
    else
        return v9, 1;
    end;
end;
