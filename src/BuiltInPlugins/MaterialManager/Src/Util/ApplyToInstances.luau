local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Util.ApplyToBasePart);
return function(v3, v4, v5)
    for _, v7 in ipairs(v3) do
        v2(v7, v4, v5);
        if v7:IsA("Model") then
            for _, v9 in ipairs((v7:GetDescendants())) do
                if v9:IsA("BasePart") then
                    v9.Material = v4;
                    v9.MaterialVariant = v5 or "";
                end;
            end;
        end;
    end;
end;
