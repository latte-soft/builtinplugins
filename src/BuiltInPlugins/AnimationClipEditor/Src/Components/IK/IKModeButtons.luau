local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_RadioButtonList_0 = v2.UI.RadioButtonList;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v7 = v1.PureComponent:extend("IKModeButtons");
v7.render = function(v8)
    local l_Localization_0 = v8.props.Localization;
    local l_props_0 = v8.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_props_0.Height), 
        BackgroundColor3 = l_Stylizer_0.ikTheme.headerColor, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Stylizer_0.ikTheme.headerBorder, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        IKModeLabel = v1.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, 64, 0, v6.TRACK_HEIGHT), 
            BackgroundTransparency = 1, 
            TextSize = l_Stylizer_0.ikTheme.textSize, 
            Font = l_Stylizer_0.font, 
            TextColor3 = l_Stylizer_0.ikTheme.textColor, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Text = l_Localization_0:getText("IKMenu", "IKMode"), 
            LayoutOrder = 0
        }), 
        RadioButtonsFrame = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, 186, 0.5, 0), 
            LayoutOrder = 1
        }, {
            RadioButtons = v1.createElement(l_RadioButtonList_0, {
                Buttons = {
                    {
                        Key = v6.IK_MODE.BodyPart, 
                        Text = l_Localization_0:getText("IKMenu", "BodyPart")
                    }, 
                    {
                        Key = v6.IK_MODE.FullBody, 
                        Text = l_Localization_0:getText("IKMenu", "FullBody")
                    }
                }, 
                SelectedKey = l_props_0.IKMode, 
                FillDirection = Enum.FillDirection.Horizontal, 
                LayoutOrder = 1, 
                OnClick = l_props_0.SetIKMode
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v7));
