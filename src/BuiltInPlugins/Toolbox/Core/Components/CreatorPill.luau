local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Core.Components.CreatorLabel);
local v4 = require(l_script_FirstAncestor_0.Core.Util.Images);
local v5 = require(l_script_FirstAncestor_0.Core.Util.LayoutOrderIterator);
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_Pane_0 = v2.UI.Pane;
return function(v8)
    local v9 = l_Stylizer_0:use();
    local v10 = UDim.new(0, v9.creatorPill.spacingUnit / 2);
    local v11 = v5.new();
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = v9.searchPill.backgroundColor, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = v8.LayoutOrder, 
        OnClick = v8.OnActivated, 
        Padding = v10.Offset, 
        Spacing = v10.Offset, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        Corner = v1.createElement("UICorner", {
            CornerRadius = v10
        }), 
        CreatorLabel = v1.createElement(v3, {
            CreatorId = v8.CreatorId, 
            CreatorName = v8.CreatorName, 
            CreatorType = v8.CreatorType, 
            LayoutOrder = v11:getNextOrder()
        }), 
        Close = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v4.CLOSE_BUTTON, 
            LayoutOrder = v11:getNextOrder(), 
            Size = UDim2.fromOffset(16, 16)
        })
    });
end;
