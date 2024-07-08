local v0 = require(script:FindFirstAncestor("AssetManager").Packages.React);
local l_useState_0 = v0.useState;
local l_useEffect_0 = v0.useEffect;
return function(v3)
    local v4, v5 = l_useState_0(v3:getVisibleProperties());
    local v6, v7 = l_useState_0(v3:getColumnWidths());
    l_useEffect_0(function()
        local v8 = v3.OnVisiblePropertiesChanged:Connect(v5);
        return function()
            v8:Disconnect();
        end;
    end, {});
    l_useEffect_0(function()
        local v9 = v3.OnColumnWidthsChanged:Connect(v7);
        return function()
            v9:Disconnect();
        end;
    end, {});
    return v4, v6;
end;
