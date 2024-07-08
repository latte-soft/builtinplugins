local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v3 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SelectCategoryRequest);
local v4 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v5 = require(l_script_FirstAncestor_0.Core.Hooks.useDispatch);
local l_useCallback_0 = v1.useCallback;
return function()
    local v7 = v5();
    local l_networkInterface_0 = v2.use().networkInterface;
    local v9 = v4.use():get("Plugin");
    return (l_useCallback_0(function(v10)
        v7(v3(l_networkInterface_0, v9, v10));
    end, {
        v7, 
        l_networkInterface_0
    }));
end;
