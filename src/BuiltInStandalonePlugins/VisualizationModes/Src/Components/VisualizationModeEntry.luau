local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Src.Components.Badge);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Components.HighlightTextLabel);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UI_0 = v2.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local function v12(v11)
    if v11.CanExpand then
        return v4.createElement("ImageButton", {
            Size = UDim2.fromOffset(12, 12), 
            BackgroundTransparency = 1, 
            LayoutOrder = v11.LayoutOrder, 
            [v4.Event.Activated] = v11.OnExpansionToggled
        }, {
            ArrowImage = v4.createElement("ImageLabel", {
                [v4.Tag] = v2.Styling.joinTags("VisualizationModes-ExpandIcon", not v11.IsExpanded and "VisualizationModes-ExpandIcon-Collapsed" or "VisualizationModes-ExpandIcon-Expanded")
            })
        });
    else
        return v4.createElement("Frame", {
            Size = UDim2.fromOffset(7, 12), 
            LayoutOrder = v11.LayoutOrder, 
            BackgroundTransparency = 1
        });
    end;
end;
return function(v13)
    local v14 = l_LayoutOrderIterator_0.new();
    return v4.createElement("ImageButton", {
        Visible = v13.Visible, 
        LayoutOrder = v13.LayoutOrder, 
        [v4.Tag] = v2.Styling.joinTags("VisualizationModes-Entry", v13.IsEditingEnabled == false and "VisualizationModes-Disabled" or "VisualizationModes-Active"), 
        [v4.Event.Activated] = function()
            if v13.CanToggle == false then
                if v13.OnExpansionToggled then
                    v13.OnExpansionToggled();
                end;
                return ;
            else
                if v13.OnToggle then
                    v13.OnToggle();
                end;
                return ;
            end;
        end
    }, {
        ToolTip = if not not v13.ToolTip and #v13.ToolTip > 0 then v4.createElement(l_Tooltip_0, {
            Text = v13.ToolTip
        }) else nil, 
        VisualizationModesEntryBacking = v4.createElement("Frame"), 
        Contents = v4.createElement(l_Pane_0, {
            [v4.Tag] = "X-RowS X-Left X-Middle X-PadS", 
            Size = UDim2.new(1, 0, 0, 24), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5)
        }, {
            ExpandButton = v4.createElement(v12, {
                LayoutOrder = v14:getNextOrder(), 
                CanExpand = v13.CanExpand, 
                IsExpanded = v13.IsExpanded, 
                OnExpansionToggled = v13.OnExpansionToggled
            }), 
            MainEntry = v4.createElement("Frame", {
                LayoutOrder = v14:getNextOrder(), 
                [v4.Tag] = "VisualizationModes-EntryButton"
            }, {
                Contents = v4.createElement(l_Pane_0, {
                    [v4.Tag] = "X-RowS X-Left X-Middle"
                }, {
                    Checkbox = if v13.CanToggle ~= false then v4.createElement(l_Checkbox_0, {
                        Checked = v13.Enabled, 
                        OnClick = v13.OnToggle, 
                        Disabled = v13.IsEditingEnabled == false, 
                        LayoutOrder = v14:getNextOrder()
                    }) else nil, 
                    VisualizationModeEntryTitle = v4.createElement(v3, {
                        MatchIndexes = v13.MatchIndexes, 
                        LayoutOrder = v14:getNextOrder(), 
                        [v4.Tag] = v2.Styling.joinTags("VisualizationModes-TextLabel", v13.IsEditingEnabled == false and "VisualizationModes-Disabled" or nil), 
                        Text = v13.Text
                    }), 
                    Badge = if not v13.BadgeText then nil else v4.createElement(v1, {
                        LayoutOrder = v14:getNextOrder(), 
                        Text = v13.BadgeText
                    })
                })
            })
        })
    });
end;
