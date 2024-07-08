require(script.Parent.defineLuaFlags);
if game:GetFastFlag("EnableAttachmentToolLuaPlugin") then
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttachmentTool");
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("AttachmentTool", l_script_FirstAncestor_0.Src);
    if not v1.isCli() then
        plugin.Name = l_script_FirstAncestor_0.Name;
        local v2 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
        local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
        local v11 = {
            getName = function(v5, v6, v7)
                return v5(v6, v7, "Plugin", "Button");
            end, 
            getDescription = function(v8, v9, v10)
                return v8(v9, v10, "Plugin", "Description");
            end, 
            icon = "rbxlocaltheme://GameSettings", 
            enabled = false
        };
        local v15 = {
            plugin = plugin, 
            pluginName = "AttachmentTool", 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            getToolbarName = function(v12, v13, v14)
                return v12(v13, v14, "Plugin", "Toolbar");
            end, 
            buttonInfo = v11
        };
        v11.enabled = true;
        local v16 = v2.build(v15);
        if v16.pluginLoader:waitForUserInteraction() then
            require(script.Parent.main)(plugin, v16);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
else
    return ;
end;
