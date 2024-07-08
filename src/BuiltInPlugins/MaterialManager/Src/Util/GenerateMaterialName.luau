local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local l_Util_0 = l_Parent_0.Src.Util;
local v3 = require(l_Util_0.getNumberFromName);
local v4 = require(l_Util_0.getNextFreeIndex);
return function(v5, v6, v7)
    local v8 = {};
    local v9 = false;
    for _, v11 in v5:GetDescendants() do
        if v11:IsA("MaterialVariant") and v11.BaseMaterial == v6 then
            local v12 = v3(v11.Name, v7);
            if not v12 then
                if v11.Name == v7 then
                    v9 = true;
                end;
            else
                table.insert(v8, v12);
            end;
        end;
    end;
    if not v9 then
        return nil;
    else
        return v4(v8);
    end;
end;
