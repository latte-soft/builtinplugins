local l_TextService_0 = game:GetService("TextService");
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Button_0 = v4.UI.Button;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local v10 = require(l_Parent_0.Src.Util.Analytics);
local v11 = v3.PureComponent:extend("SaveToRobloxView");
v11.render = function(v12)
    local l_props_0 = v12.props;
    local l_CloseWidget_0 = l_props_0.CloseWidget;
    local l_Localization_1 = l_props_0.Localization;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local v17 = l_Localization_1:getText("Buttons", "SaveToRoblox");
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v17, l_Stylizer_1.saveToRobloxView.Text.TextSize, l_Stylizer_1.saveToRobloxView.Text.Font, Vector2.new(math.huge, math.huge));
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_1.backgroundColor
    }, {
        SaveText = v3.createElement("TextLabel", {
            Text = l_Localization_1:getText("Description", "SaveToRoblox"), 
            TextColor3 = l_Stylizer_1.saveToRobloxView.Text.TextColor3, 
            TextSize = l_Stylizer_1.saveToRobloxView.Text.TextSize, 
            Font = l_Stylizer_1.saveToRobloxView.Text.Font, 
            Position = UDim2.new(0.5, 0, 0, l_Stylizer_1.saveToRobloxView.Text.YOffset), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }), 
        SaveButton = v3.createElement(l_Button_0, {
            Style = "Active", 
            Text = v17, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X + l_Stylizer_1.saveToRobloxView.publishButton.paddingX, 0, l_l_TextService_0_TextSize_0.Y + l_Stylizer_1.saveToRobloxView.publishButton.paddingY), 
            Position = UDim2.new(0.5, 0, 0, l_Stylizer_1.saveToRobloxView.publishButton.offset), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            OnClick = function()
                v10.reportSaveToRobloxPressed();
                l_StudioPublishService_0:ShowSaveOrPublishPlaceToRoblox(false, false, Enum.StudioCloseMode.None);
                l_CloseWidget_0();
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0
})(v11));
