local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Components.Actions.PluginAction);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
return function(v5)
    local v6 = {};
    local v7 = l_ContextServices_0.Analytics:use();
    local v8 = l_ContextServices_0.Localization:use();
    for _, v10 in v5.VisualizationModeCategories, nil, nil do
        for _, v12 in v10.visualizationModeList, nil, nil do
            local v13 = ("ToggleVisualizationMode_User_%*_%*"):format(v10.name, v12.name);
            local v14 = v8:getText("ToggleVisualizationMode", "Title", {
                visualizationModeName = v12.title
            });
            local l_toolTip_0 = v12.toolTip;
            if not l_toolTip_0 or #l_toolTip_0 <= 0 then
                l_toolTip_0 = v8:getText("ToggleVisualizationMode", "Description", {
                    visualizationModeName = v12.title
                });
            end;
            v6[v13] = v1.createElement(v2, {
                ActionId = v13, 
                Text = v14, 
                StatusTip = l_toolTip_0, 
                IconName = "", 
                Checked = v12.enabled, 
                Enabled = true, 
                OnTrigger = function()
                    v7:report("visualizationModeToggled", {
                        actionSource = "plugin_action", 
                        visualizationModeCategory = v10.name, 
                        visualizationMode = v12.name, 
                        isEnabled = not v12.enabled
                    });
                    v5.OnVisualizationModeToggle(v10.name, v12.name, not v12.enabled, true);
                end
            });
        end;
    end;
    return v1.createElement(v1.Fragment, {}, v6);
end;
