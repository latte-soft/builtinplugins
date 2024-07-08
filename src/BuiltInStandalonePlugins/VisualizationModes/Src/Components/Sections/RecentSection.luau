local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.VisualizationModeEntry);
local v5 = require(l_script_FirstAncestor_0.Src.Components.VisualizationModeSection);
local l_ContextServices_0 = v2.ContextServices;
return function(v7)
    local v8 = l_ContextServices_0.Analytics:use();
    local v9 = l_ContextServices_0.Localization:use();
    local v10 = {};
    local v11 = 0;
    local v12 = 0;
    for v13, v14 in v7.RecentVisualizationModes, nil, nil do
        v11 = v11 + 1;
        if v14.enabled then
            v12 = v12 + 1;
        end;
        v10[v14.name] = v3.createElement(v4, {
            Text = v14.title, 
            Enabled = v14.enabled, 
            ToolTip = v14.toolTip, 
            LayoutOrder = v13, 
            MatchIndexes = nil, 
            IsEditingEnabled = true, 
            OnToggle = function()
                v8:report("visualizationModeToggled", {
                    actionSource = "recent_section", 
                    visualizationModeCategory = v14.visualizationModeCategoryName, 
                    visualizationMode = v14.name, 
                    isEnabled = not v14.enabled
                });
                v7.OnVisualizationModeToggle(v14.visualizationModeCategoryName, v14.name, not v14.enabled, false);
            end
        });
    end;
    return v3.createElement(v5, {
        Text = v9:getText("VisualizationModeCategories", "Recent"), 
        SettingKey = "RecentCategories", 
        DefaultIsExpanded = false, 
        CanToggle = false, 
        EnabledEntryCount = v12, 
        Enabled = true, 
        Visible = v7.Visible, 
        LayoutOrder = v7.LayoutOrder, 
        EntryCount = v11, 
        SectionEntries = v10, 
        ForceExpansion = false, 
        IsEditingEnabled = v7.IsEditingEnabled
    });
end;
