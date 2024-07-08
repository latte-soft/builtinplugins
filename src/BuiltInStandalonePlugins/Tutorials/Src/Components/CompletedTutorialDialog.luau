local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local v7 = require(l_Parent_0.Src.Util.counter);
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v12 = v1.PureComponent:extend("CompletedTutorialDialog");
v12.render = function(v13)
    local l_props_0 = v13.props;
    local l_Localization_1 = l_props_0.Localization;
    local v16 = v7();
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        Padding = 50, 
        Spacing = 20
    }, {
        Title = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v16(), 
            Text = l_Localization_1:getText("Completed", "Title"):format(l_props_0.Name), 
            Style = "Title"
        }), 
        Description = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v16(), 
            Text = l_Localization_1:getText("Completed", "Description"), 
            TextWrapped = true, 
            Style = "Subtitle"
        }), 
        Row = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v16(), 
            Spacing = 20
        }, {
            Dashboard = v1.createElement(l_Button_0, {
                LayoutOrder = v16(), 
                Text = l_Localization_1:getText("Completed", "Back"), 
                Style = "Round", 
                OnClick = function()
                    v13.props.OnReturn();
                end, 
                Size = UDim2.fromOffset(150, 32)
            }), 
            Continue = v1.createElement(l_Button_0, {
                LayoutOrder = v16(), 
                Text = l_Localization_1:getText("Completed", "Continue"), 
                Style = "RoundPrimary", 
                OnClick = function()
                    v13.props.OnClose();
                end, 
                Size = UDim2.fromOffset(80, 32)
            })
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v12));
