local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local l_Util_0 = l_Parent_0.Src.Util;
local v3 = require(l_Util_0.getNumberFromName);
local v4 = require(l_Util_0.getNextFreeIndex);
return function(v5, v6)
    local v7 = {};
    for _, v9 in ipairs(v5:GetChildren()) do
        if v9:IsA("TerrainDetail") then
            table.insert(v7, v3(v9.Name, v6));
        end;
    end;
    return v4(v7);
end;
