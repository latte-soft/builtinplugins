local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.PluginSettingsContext);
return function(v3)
    local v4 = v1.useContext(v2);
    return v4.getSetting(v3), (v1.useCallback(function(v5)
        v4.setSetting(v3, v5);
    end, {
        v3, 
        v4.setSetting
    }));
end;
