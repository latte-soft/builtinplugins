local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.PlacesServiceContext);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_UI_0 = v1.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
return function()
    local v12 = l_Localization_0:use();
    local v13 = l_Stylizer_0:use("TestingScreen");
    local v14 = l_LayoutOrderIterator_0.new();
    local v15 = v2.useContext(v3);
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        Spacing = v13.Spacing, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        Description = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v14:getNextOrder(), 
            Text = v12:getText("TestingScreen", "Description")
        }), 
        StopButton = v2.createElement(l_IconButton_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = v14:getNextOrder(), 
            OnClick = function()
                v15.stopPlaySolo();
            end, 
            Size = UDim2.fromOffset(0, v13.ButtonHeight), 
            Text = v12:getText("TestingScreen", "Stop")
        })
    });
end;
