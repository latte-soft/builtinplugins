local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v10 = v2.PureComponent:extend("SuccessWidget");
v10.render = function(v11)
    local l_props_0 = v11.props;
    local l_Localization_1 = v11.props.Localization;
    local l_UploadWidget_0 = l_props_0.Stylizer.UploadWidget;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = 1, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Size = UDim2.new(0, l_UploadWidget_0.Width, 0, l_UploadWidget_0.Height)
    }, {
        Title = v2.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = l_UploadWidget_0.TextLabelSize, 
            Text = l_Localization_1:getText("Upload", "Success"), 
            TextSize = l_UploadWidget_0.TextSize, 
            TextXAlignment = l_UploadWidget_0.TextAlignment, 
            TextColor = l_UploadWidget_0.SuccessColor
        }), 
        Description = if not l_props_0.AddedToInventory then nil else v2.createElement(l_TextLabel_0, {
            LayoutOrder = 2, 
            Size = l_UploadWidget_0.TextLabelSize, 
            Text = l_Localization_1:getText("Upload", "SuccessDescription"), 
            TextSize = l_UploadWidget_0.SubtextSize, 
            TextXAlignment = l_UploadWidget_0.TextAlignment
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v10));
