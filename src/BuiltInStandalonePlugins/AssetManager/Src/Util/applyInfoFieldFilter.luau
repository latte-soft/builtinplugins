local v0 = require(script:FindFirstAncestor("AssetManager").Src.Types);
local l_AssetInfoField_0 = v0.AssetInfoField;
local v2 = {};
local function _(v3, v4, v5)
    return v5[v3[v4]];
end;
v2[l_AssetInfoField_0.Owner] = function(v7, v8)
    return v8[v7.Owner.Name];
end;
for _, v10 in v0.getEnumAsList(l_AssetInfoField_0) do
    if not v2[v10] then
        v2[v10] = function(v11, v12)
            return v12[v11[v10]];
        end;
    end;
end;
return v2;
