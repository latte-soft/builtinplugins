local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v4 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
return function(v5, v6)
    v5.Name = l_script_FirstAncestor_0.Name;
    local v10 = {
        plugin = v5, 
        pluginName = "AudioEqualizerEditor", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        getToolbarName = function(v7, v8, v9)
            return v7(v8, v9, "Plugin", "Toolbar");
        end, 
        noToolbar = true
    };
    local l_RunService_0 = game:GetService("RunService");
    local v12 = v4.get() == v4.Standalone;
    local v13 = l_RunService_0:IsEdit();
    local v14 = v1.build(v10);
    if not (not v12 and not v13) then
        v6(v5, v14);
    end;
end;
