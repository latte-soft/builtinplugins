local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
return function()
    return l_ContextServices_0.Analytics.new(function(v3)
        local function v6(v4, v5)
            v3:SendEventDeferred("studio", "PluginManagement", v4, (v1.Dictionary.join({
                studioSid = v3:GetSessionId(), 
                clientId = v3:GetClientId()
            }, v5 or {})));
        end;
        local function _(v7, v8)
            v3:ReportCounter(v7, v8 or 1);
        end;
        local function _(v10, v11)
            v6(v10, v11);
            v3:ReportCounter("PluginManagement" .. v10, 1);
        end;
        return {
            TryInstallPluginFromWeb = function(v13, v14)
                v6(v13, {
                    pluginId = v14
                });
                v3:ReportCounter("PluginManagement" .. v13, 1);
            end, 
            InstallPluginFromWebSuccess = function(v15, v16)
                v6(v15, {
                    pluginId = v16
                });
                v3:ReportCounter("PluginManagement" .. v15, 1);
            end, 
            InstallPluginFromWebFailure = function(v17, v18, v19)
                v6(v17, {
                    pluginId = v18, 
                    pluginInstallStatusCode = v19
                });
                v3:ReportCounter("PluginManagement" .. v17, 1);
            end, 
            TryUpdatePlugin = function(v20, v21)
                v6(v20, {
                    pluginId = v21
                });
                v3:ReportCounter("PluginManagement" .. v20, 1);
            end, 
            TryUpdateAllPlugins = function(v22)
                v6(v22, nil);
                v3:ReportCounter("PluginManagement" .. v22, 1);
            end, 
            UpdatePluginSuccess = function(v23, v24)
                v6(v23, {
                    pluginId = v24
                });
                v3:ReportCounter("PluginManagement" .. v23, 1);
            end, 
            UpdatePluginFailure = function(v25, v26)
                v6(v25, {
                    pluginId = v26
                });
                v3:ReportCounter("PluginManagement" .. v25, 1);
            end
        };
    end);
end;
