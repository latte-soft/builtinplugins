local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_LinkText_0 = v2.UI.LinkText;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GuiService_0 = game:GetService("GuiService");
local l_UI_0 = v2.UI;
local _ = l_UI_0.DockWidget;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_GetTextSize_0 = v2.Util.GetTextSize;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local v13 = v1.PureComponent:extend("WarningDialog");
v2.Util.Typecheck.wrap(v13, script);
local l_Colors_0 = v2.Style.Colors;
v13.init = function(_)
end;
v13.render = function(v16)
    local l_props_0 = v16.props;
    local l_Localization_0 = l_props_0.Localization;
    local v19 = l_props_0.Title or l_Localization_0:getText("Dialog", "DefaultTitle");
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v21 = l_props_0.learnMoreLabel or l_Localization_0:getText("FaceCapture", "DefaultLearnMoreLabel");
    local l_TitleText_0 = l_props_0.TitleText;
    local l_SourceSansBold_0 = Enum.Font.SourceSansBold;
    local v24 = l_GetTextSize_0(l_TitleText_0, 20, l_SourceSansBold_0, Vector2.new(450, 1000));
    local l_BodyText_0 = l_props_0.BodyText;
    local l_SourceSans_0 = Enum.Font.SourceSans;
    return v1.createElement(l_StyledDialog_0, {
        Title = v19, 
        OnClose = l_props_0.OnClose, 
        BorderPadding = 20, 
        OnButtonPressed = l_props_0.OnButtonPressed, 
        Buttons = l_props_0.Buttons, 
        ButtonHorizontalAlignment = Enum.HorizontalAlignment.Right, 
        MinContentSize = Vector2.new(450, (v24.Y + 10) + l_GetTextSize_0(l_BodyText_0, 20, l_SourceSans_0, Vector2.new(450, 1000)).Y), 
        Modal = true
    }, {
        Content = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Spacing = 10
        }, {
            Message = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = l_TitleText_0, 
                Font = l_SourceSansBold_0, 
                TextSize = 20, 
                TextColor3 = l_Stylizer_0.TextColor, 
                BackgroundTransparency = 1, 
                TextWrapped = true, 
                LayoutOrder = 1
            }), 
            Message2 = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = l_BodyText_0, 
                Font = l_SourceSans_0, 
                TextSize = 20, 
                TextColor3 = l_Stylizer_0.TextColor, 
                BackgroundTransparency = 1, 
                TextWrapped = true, 
                LayoutOrder = 2
            })
        }), 
        LinkText = l_props_0.learnMoreUrl and v1.createElement(l_LinkText_0, {
            LayoutOrder = 3, 
            Text = v21, 
            TextYAlignment = Enum.TextYAlignment.Bottom, 
            OnClick = function()
                l_GuiService_0:OpenBrowserWindow(l_props_0.learnMoreUrl);
            end, 
            Style = {
                Font = Enum.Font.SourceSans, 
                TextColor = l_Colors_0.Blue, 
                TextSize = 20, 
                ShowUnderline = true
            }, 
            Position = UDim2.new(0, 0, 0, 157)
        })
    });
end;
return (l_withContext_0({
    Mouse = l_ContextServices_0.Mouse, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v13));
