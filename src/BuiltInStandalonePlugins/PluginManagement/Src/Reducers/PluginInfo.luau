local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Constants.PluginInstalledStatus);
return v1.createReducer({
    plugins = {}
}, {
    SetPluginId = function(v4, v5)
        return v2.Dictionary.join(v4, {
            plugins = v2.Dictionary.join(v4.plugins, {
                [v5.pluginId] = {
                    installStatus = v3.UNKNOWN, 
                    installationMsg = "", 
                    installProgress = 0, 
                    name = "", 
                    description = "", 
                    versionId = "", 
                    created = "", 
                    updated = ""
                }
            })
        });
    end, 
    ClearPluginData = function(v6, v7)
        if v6.plugins[v7.pluginId] then
            return v2.Dictionary.join(v6, {
                plugins = v2.Dictionary.join(v6.plugins, {
                    [v7.pluginId] = v2.None
                })
            });
        else
            return v6;
        end;
    end, 
    SetPluginMetadata = function(v8, v9)
        assert(v8.plugins[v9.pluginId], string.format("No plugin entry found for %s", v9.pluginId));
        return v2.Dictionary.join(v8, {
            plugins = v2.Dictionary.join(v8.plugins, {
                [v9.pluginId] = v2.Dictionary.join(v8.plugins[v9.pluginId], {
                    name = v9.name, 
                    description = v9.description, 
                    versionId = v9.versionId, 
                    created = v9.created, 
                    updated = v9.updated
                })
            })
        });
    end, 
    SetPluginInstallStatus = function(v10, v11)
        assert(v10.plugins[v11.pluginId], string.format("No plugin entry found for %s", v11.pluginId));
        return v2.Dictionary.join(v10, {
            plugins = v2.Dictionary.join(v10.plugins, {
                [v11.pluginId] = v2.Dictionary.join(v10.plugins[v11.pluginId], {
                    installStatus = v11.statusCode, 
                    installationMsg = v11.message
                })
            })
        });
    end
});
