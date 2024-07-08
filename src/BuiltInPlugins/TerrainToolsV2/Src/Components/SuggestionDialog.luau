local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.ContextItems);
local l_Button_0 = l_UI_0.Button;
local _ = l_UI_0.HoverArea;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Pane_0 = l_UI_0.Pane;
local _ = l_UI_0.Box;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_CoreGui_0 = game:GetService("CoreGui");
local v14 = v1.PureComponent:extend("SuggestionDialog");
v14.defaultProps = {
    Enabled = true
};
v14.init = function(v15)
    v15.state = {
        DontAsk = false
    };
    v15.onCheckboxClicked = function(v16)
        v15:setState({
            [v16] = not v15.state[v16]
        });
    end;
end;
v14.render = function(v17)
    local l_props_0 = v17.props;
    local l_Localization_0 = l_props_0.Localization;
    local v20 = Vector2.new(0.5, 0);
    local v21 = UDim2.new(0.5, 0, 0, 50);
    local v22 = l_props_0.Title or "";
    local l_SubText_0 = l_props_0.SubText;
    local v24 = l_SubText_0 and #l_SubText_0 > 0;
    local v25 = l_props_0.ActionText or l_Localization_0:getText("Action", "Update");
    local l_OnDismissButtonClicked_0 = l_props_0.OnDismissButtonClicked;
    return v1.createElement(v1.Portal, {
        target = l_CoreGui_0
    }, {
        ProgressDialog = v1.createElement("ScreenGui", {
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            v1.createElement(l_Pane_0, {
                AnchorPoint = v20, 
                Position = v21, 
                Size = UDim2.new(0, 460, 0, 10), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                Spacing = 8, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = 20, 
                Style = "RoundBox", 
                Transparency = 0.5
            }, {
                Title = v1.createElement(l_TextLabel_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Text = v22, 
                    Font = Enum.Font.SourceSansBold, 
                    TextSize = 20, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true
                }), 
                SubText = v24 and v1.createElement(l_TextLabel_0, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Text = l_SubText_0, 
                    TextSize = 20, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true
                }), 
                DontAsk = v1.createElement(l_Checkbox_0, {
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = l_Localization_0:getText("Action", "DontAskAgain"), 
                    Checked = v17.state.DontAsk, 
                    Key = "DontAsk", 
                    OnClick = v17.onCheckboxClicked
                }), 
                ButtonRow = v1.createElement(l_Pane_0, {
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Layout = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    Spacing = 8
                }, {
                    DismissButton = v1.createElement(l_Button_0, {
                        LayoutOrder = 1, 
                        Text = l_Localization_0:getText("Action", "Dismiss"), 
                        Size = UDim2.fromOffset(120, 32), 
                        Style = "Round", 
                        OnClick = function()
                            l_OnDismissButtonClicked_0(v17.state.DontAsk);
                        end
                    }), 
                    ActionButton = v1.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        Text = v25, 
                        Size = UDim2.fromOffset(120, 32), 
                        Style = "RoundPrimary", 
                        OnClick = l_props_0.OnActionButtonClicked
                    })
                })
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Terrain = v6.Terrain
})(v14));
