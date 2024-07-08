local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v3 = require(l_script_FirstAncestor_0.Core.Networking.Requests.GetHomeConfigurationRequest);
local v4 = require(l_script_FirstAncestor_0.Core.Hooks.useDispatch);
local v5 = require(l_script_FirstAncestor_0.Core.Hooks.useSelector);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
return function(v7, v8)
    local l_networkInterface_0 = v2.use().networkInterface;
    local v10 = v4();
    local v12 = v5(function(v11)
        if not v11.homeConfiguration then
            return nil;
        else
            return v11.homeConfiguration[v7.Name];
        end;
    end);
    v1.useEffect(function()
        v10(v3(l_networkInterface_0, v7, v8));
    end, {
        v10, 
        l_networkInterface_0, 
        v7, 
        v8
    });
    return v12;
end;
