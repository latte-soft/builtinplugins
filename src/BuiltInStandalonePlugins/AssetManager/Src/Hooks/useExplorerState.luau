local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function(v5, v6)
    local _, v8 = l_useState_0(v5:getUser().Name);
    local v9, v10 = l_useState_0(v6:getSelection());
    local v11, _ = l_useState_0(v6:getExpansion());
    local v13, v14 = l_useState_0(v6:getExplorerItems());
    l_useEffect_0(function()
        local v15 = v5.OnUsernameFetched:Connect(v8);
        return function()
            v15:Disconnect();
        end;
    end, {});
    l_useEffect_0(function()
        local v16 = v6.OnExplorerItemsChanged:Connect(v14);
        return function()
            v16:Disconnect();
        end;
    end, {});
    l_useEffect_0(function()
        local v17 = v5.OnSelectionChanged:Connect(v10);
        return function()
            v17:Disconnect();
        end;
    end, {});
    return {
        Selection = v9, 
        Expansion = v11, 
        Items = v13
    };
end;
