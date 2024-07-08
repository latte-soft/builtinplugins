local l_script_FirstAncestor_0 = script:FindFirstAncestor("LightingCompatibilityMigration");
local v1 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v4 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
return function(v5, v6)
    v5.Name = l_script_FirstAncestor_0.Name;
    local v13 = {
        getName = function(v7, v8, v9)
            return v7(v8, v9, "Plugin", "Button");
        end, 
        getDescription = function(v10, v11, v12)
            return v10(v11, v12, "Plugin", "Description");
        end, 
        icon = "rbxlocaltheme://GameSettings", 
        enabled = false
    };
    local v17 = {
        plugin = v5, 
        pluginName = "LightingCompatibilityMigration", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        getToolbarName = function(v14, v15, v16)
            return v14(v15, v16, "Plugin", "Toolbar");
        end, 
        buttonInfo = v13
    };
    local l_RunService_0 = game:GetService("RunService");
    local v19 = v4.get() == v4.Standalone;
    local v20 = l_RunService_0:IsEdit();
    if not v19 and not v20 then
        v1.build(v17);
        return ;
    else
        v13.enabled = true;
        v17.dockWidgetInfo = {
            id = "LightingCompatibilityMigration", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, false, 640, 480, 250, 200), 
            getDockTitle = function(v21, v22, v23)
                return v21(v22, v23, "Plugin", "Name");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        };
        local v24 = v1.build(v17);
        if v24.pluginLoader:waitForUserInteraction() then
            v6(v5, v24);
            return ;
        else
            return ;
        end;
    end;
end;
