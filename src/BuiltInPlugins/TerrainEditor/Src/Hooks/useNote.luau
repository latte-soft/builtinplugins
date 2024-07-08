local v0 = require(script:FindFirstAncestor("TerrainEditor").Packages.React);
local l_useState_0 = v0.useState;
local l_useEffect_0 = v0.useEffect;
return function(v3, v4)
    local v5 = v3:getTool();
    local v6, v7 = l_useState_0(v5:note());
    l_useEffect_0(function()
        local v9 = v3.OnToolChanged:Connect(function(v8)
            v7(v8:note());
        end);
        if v4 then
            local v10 = v5.OnNoteChanged:Connect(function()
                v7(v5:note());
            end);
            return function()
                v9:Disconnect();
                v10:Disconnect();
            end;
        else
            return function()
                v9:Disconnect();
            end;
        end;
    end, {
        v5, 
        v4
    });
    l_useEffect_0(function()
        v7(if not v4 then nil else v5:note());
    end, {
        v4
    });
    return v6;
end;
