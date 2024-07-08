local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v2.ContextServices;
local v5 = require(l_script_FirstAncestor_0.Src.Util.PluginSettingsContext);
return function(v6)
    local v7 = l_ContextServices_0.Plugin.use():get();
    local v8, v9 = v3.useState({});
    return v3.createElement(v5.Provider, {
        value = {
            getSetting = function(v10)
                return v7:GetSetting(v10);
            end, 
            setSetting = function(v11, v12)
                if v12 ~= v7:GetSetting(v11) then
                    v7:SetSetting(v11, v12);
                    v9(v1.join(v8, {
                        [v11] = v12
                    }));
                end;
            end, 
            pluginSettings = v8
        }
    }, v6.children);
end;
