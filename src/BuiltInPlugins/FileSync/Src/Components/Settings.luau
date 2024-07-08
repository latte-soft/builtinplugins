local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v3.ContextServices.Localization;
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Separator_0 = l_UI_0.Separator;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
return function(v10)
    local v11 = v10.Size or UDim2.new(1, 20, 0, 50);
    local v12 = l_Localization_0:use();
    local v13 = l_LayoutOrderIterator_0.new();
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v11, 
        LayoutOrder = v10.LayoutOrder
    }, {
        ListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 4), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        LeftPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v2.SIDE_PADDING)
        }), 
        SettingsLabel = v1.createElement(l_TextLabel_0, {
            Text = v12:getText("Labels", "Settings"), 
            Style = "Bold", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1, 
            LayoutOrder = v13:getNextOrder()
        }), 
        Separator2 = v1.createElement(l_Separator_0, {
            LayoutOrder = v13:getNextOrder()
        }), 
        AutoImportCheckBox = v1.createElement(l_Checkbox_0, {
            Text = v12:getText("Labels", "AutoImport"), 
            Checked = v10.IsChecked, 
            OnClick = v10.OnClick, 
            Size = UDim2.new(1, 0, 0, 20), 
            LayoutOrder = v13:getNextOrder()
        })
    });
end;
