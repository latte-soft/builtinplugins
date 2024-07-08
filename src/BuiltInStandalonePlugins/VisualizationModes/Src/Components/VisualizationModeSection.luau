local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Components.VisualizationModeEntry);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.usePluginSetting);
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Pane_0 = v1.UI.Pane;
local function _(v9)
    return string.format("Category_%s_IsExpanded", v9);
end;
return function(v11)
    local v12 = l_LayoutOrderIterator_0.new();
    local v13, v14 = v6(string.format("Category_%s_IsExpanded", v11.SettingKey), v11.DefaultIsExpanded);
    local v15 = v3.useToggleState(v13);
    v2.useEffect(function()
        v14(v15.enabled);
    end, {
        v15.enabled
    });
    local v16 = v15.enabled or v11.ForceExpansion;
    return v2.createElement("ImageButton", {
        Visible = v11.Visible, 
        LayoutOrder = v11.LayoutOrder, 
        [v2.Tag] = "VisualizationModes-Group", 
        [v2.Event.Activated] = v15.toggle
    }, {
        Contents = v2.createElement(l_Pane_0, {
            [v2.Tag] = "X-Column X-Top X-FitY X-Left", 
            Size = UDim2.fromScale(1, 0)
        }, {
            Main = v2.createElement(l_Pane_0, {
                [v2.Tag] = "X-Column X-Top X-Fit", 
                Size = UDim2.fromScale(1, 0)
            }, {
                Title = v2.createElement(v5, {
                    LayoutOrder = v12:getNextOrder(), 
                    Enabled = v11.Enabled, 
                    BadgeText = if not v16 and v11.EnabledEntryCount > 0 then tostring(v11.EnabledEntryCount) else nil, 
                    MatchIndexes = v11.MatchIndexes, 
                    CanExpand = true, 
                    IsExpanded = v16, 
                    OnToggle = v11.OnToggle, 
                    CanToggle = v11.CanToggle, 
                    IsEditingEnabled = v11.IsEditingEnabled, 
                    OnExpansionToggled = v15.toggle, 
                    Text = v11.Text
                }), 
                Content = v2.createElement(l_Pane_0, {
                    [v2.Tag] = "X-Column X-Top X-FitY", 
                    Size = UDim2.fromScale(1, 0), 
                    LayoutOrder = v12:getNextOrder(), 
                    Visible = v16
                }, v11.SectionEntries)
            })
        })
    });
end;
