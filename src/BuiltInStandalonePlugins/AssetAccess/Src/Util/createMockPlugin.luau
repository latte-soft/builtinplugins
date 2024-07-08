local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
local v1 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals);
local v2 = require(l_script_FirstAncestor_0.Src.Util.createMockAssetAccessController);
local l_jest_0 = v1.jest;
return function()
    local v4 = {};
    local v5 = {};
    local v6 = {};
    v4.SetItem = l_jest_0.fn(function(_, v8, v9)
        v5[v8] = if typeof(v9) == "table" then table.clone(v9) else v9;
        local v10 = v6[v8];
        if v10 then
            v10(if typeof(v9) == "table" then table.clone(v9) else v9);
        end;
    end);
    v4.GetItem = l_jest_0.fn(function(_, v12)
        local v13 = v5[v12];
        if typeof(v13) == "table" then
            return (table.clone(v13));
        else
            return v13;
        end;
    end);
    v4.MockOnSetItemDisconnect = l_jest_0.fn();
    v4.OnSetItem = l_jest_0.fn(function(_, v15, v16)
        v6[v15] = v16;
        return {
            Disconnect = function()
                v6[v15] = nil;
                v4.MockOnSetItemDisconnect(v15);
            end
        };
    end);
    local v17 = {};
    v4.Invoke = l_jest_0.fn(function(_, v19, ...)
        local v20 = v17[v19];
        if v20 then
            local v21 = table.pack(...);
            for v22, v23 in v21, nil, nil do
                if typeof(v23) == "table" then
                    v21[v22] = table.clone(v23);
                end;
            end;
            v20(table.unpack(v21));
        end;
    end);
    v4.MockOnInvokeDisconnect = l_jest_0.fn();
    v4.OnInvoke = l_jest_0.fn(function(_, v25, v26)
        v17[v25] = v26;
        return {
            Disconnect = function()
                v17[v25] = nil;
                v4.MockOnInvokeDisconnect(v25);
            end
        };
    end);
    v4.MockAssetAccessController = v2();
    v4.GetPluginComponent = l_jest_0.fn(function(_, v28)
        if v28 == "AssetAccessController" then
            return v4.MockAssetAccessController;
        else
            error("Invalid plugin component name");
            return ;
        end;
    end);
    return v4;
end;
