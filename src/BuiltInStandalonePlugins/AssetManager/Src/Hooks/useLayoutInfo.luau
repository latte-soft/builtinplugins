local v0 = require(script:FindFirstAncestor("AssetManager").Packages.React);
local l_useState_0 = v0.useState;
local l_useEffect_0 = v0.useEffect;
return function(v3)
    local v4, v5 = l_useState_0(v3:getLayout());
    l_useEffect_0(function()
        local v6 = v3.OnLayoutChanged:Connect(v5);
        return function()
            v6:Disconnect();
        end;
    end, {});
    return v4;
end;
