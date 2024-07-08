local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEventConnection_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).useEventConnection;
local l_StudioServices_0 = v2.Context.StudioServices;
return function()
    local v6 = l_StudioServices_0.use():getService("Selection");
    local function v8()
        return v1.filter(v6:Get(), function(v7)
            return v7:IsA("BasePart");
        end);
    end;
    local v9, v10 = v3.useState(v8);
    l_useEventConnection_0(v6.SelectionChanged, function()
        v10(v8);
    end, {});
    return v9;
end;
