local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_1.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_RoactStudioWidgets_0 = l_Parent_1.Packages.RoactStudioWidgets;
local v7 = require(l_Parent_0.Util.StateInterfaceTheme);
local v8 = require(l_RoactStudioWidgets_0.Hyperlink);
local v9 = v3.PureComponent:extend("PublishingHint");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = v10.props.Stylizer;
    if not l_props_0.IsEnabled then
        local function _(v14, v15, v16)
            return game:GetService("TextService"):GetTextSize(v14, v15, v16, (Vector2.new(5000, 5000)));
        end;
        local v18 = l_Localization_0:getText("General", "PublishingHintLink");
        local l_TextSize_0 = game:GetService("TextService"):GetTextSize(v18, 22, Enum.Font.SourceSans, (Vector2.new(5000, 5000)));
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_TextSize_0.Y), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_props_0.LayoutOrder
        }, {
            HyperLink = v3.createElement(v8, {
                Text = v18, 
                Size = UDim2.new(0, l_TextSize_0.X, 0, l_TextSize_0.Y), 
                Enabled = true, 
                Mouse = l_props_0.Mouse, 
                OnClick = function()
                    l_StudioService_0:ShowPublishToRoblox();
                end
            }), 
            TextLabel = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, l_TextSize_0.X, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                TextColor3 = if not v7.getRadioButtonTextColor(l_props_0) then l_Stylizer_0.fontStyle.Header.TextColor3 else v7.getRadioButtonTextColor(l_props_0), 
                Font = Enum.Font.SourceSans, 
                TextSize = 22, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = l_Localization_0:getText("General", "PublishingHintLinkExplanation")
            })
        });
    else
        return nil;
    end;
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
