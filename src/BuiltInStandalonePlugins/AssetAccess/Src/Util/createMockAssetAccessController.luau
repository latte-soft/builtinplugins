local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
local v1 = require(l_script_FirstAncestor_0.Packages.Dev.JestGlobals);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_jest_0 = v1.jest;
local function v8()
    local v4 = nil;
    local v5 = l_jest_0.fn(function()
        v4 = nil;
    end);
    return {
        Connect = l_jest_0.fn(function(_, v7)
            v4 = v7;
            return {
                Disconnect = v5
            };
        end), 
        MockDisconnect = v5, 
        MockFire = function(...)
            if v4 then
                v4(...);
            end;
        end
    };
end;
return function()
    return {
        ShowShareDialog = v8(), 
        NewInaccessibleAsset = v8(), 
        GetAssetMetadata = l_jest_0.fn(), 
        ShareAccessToInaccessibleAssets = l_jest_0.fn()
    };
end;
