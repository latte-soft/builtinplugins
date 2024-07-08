local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TitledFrame_0 = v3.UI.TitledFrame;
local v7 = require(l_Parent_0.Util.StateInterfaceTheme);
local v8 = v2.Component:extend("ComponentTitleBar");
v8.render = function(v9)
    local l_Localization_0 = v9.props.Localization;
    local l_Stylizer_0 = v9.props.Stylizer;
    local v12 = {};
    if v9.props.IsPlayerChoiceTitleStyle then
        v12.PlayerChoiceLabel = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = if not v7.getRadioButtonTextColor(v9.props) then l_Stylizer_0.fontStyle.Header.TextColor3 else v7.getRadioButtonTextColor(v9.props), 
            Font = Enum.Font.SourceSans, 
            TextSize = 22, 
            Text = l_Localization_0:getText("General", "AvatarOverridePrompt")
        });
    end;
    return v2.createElement(l_TitledFrame_0, {
        LayoutOrder = v9.props.LayoutOrder or 1, 
        Title = v9.props.Text
    }, v12);
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
