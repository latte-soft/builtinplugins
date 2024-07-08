local _ = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v8 = require(script.Parent.Parent.Constants);
local v9 = require(script.Parent.GroupCountDisplay);
local v10 = v2.Component:extend("ListHeader");
v10.render = function(v11)
    local l_props_0 = v11.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_ListHeader_0 = l_props_0.Stylizer.ListHeader;
    local _ = nil;
    local l_SelectedGroupName_0 = l_props_0.SelectedGroupName;
    return v2.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, v8.GroupRowHeight), 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = l_ListHeader_0.Padding
    }, {
        GroupCountDisplay = v2.createElement(v9, {
            GroupCount = l_props_0.GroupCount, 
            LayoutOrder = 1
        }), 
        LabelPane = v2.createElement(l_Pane_0, {
            Style = "GroupLabel", 
            Size = UDim2.new(1, -v8.GroupRowWidth, 0, v8.GroupRowHeight), 
            LayoutOrder = 2, 
            Layout = Enum.FillDirection.Horizontal, 
            Padding = l_ListHeader_0.LabelPanePadding
        }, {
            TextLabel = v2.createElement(l_TextLabel_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = (not (l_SelectedGroupName_0 ~= v8.CursorGroupName) or l_SelectedGroupName_0 == "") and "" or l_Localization_0:getText("Info", "CanCollideWith", {
                    l_SelectedGroupName_0
                }), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v10));
