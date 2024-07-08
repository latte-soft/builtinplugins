local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local _ = v1.UI.Button;
local l_IconButton_0 = v1.UI.IconButton;
local l_Pane_0 = v1.UI.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v8)
    local v9 = l_Stylizer_0:use("PlaneLockRenderer");
    local l_Schema_0 = v8.Schema;
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        Size = UDim2.new(1, 0, 0, v9.Height), 
        Spacing = v9.Spacing
    }, {
        Edit = v2.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v9.Height - v9.Spacing, 0, v9.Height)
        }, {
            Button = v2.createElement(l_IconButton_0, {
                OnClick = function()
                    v8.OnChanged(not v8.Value);
                end, 
                Size = UDim2.fromScale(1, 1), 
                Style = "PrimaryBrand", 
                Text = if not v8.Value then l_Schema_0.EditLabel else l_Schema_0.ApplyLabel, 
                TextXAlignment = Enum.TextXAlignment.Center
            })
        }), 
        Reset = v2.createElement(l_IconButton_0, {
            LayoutOrder = 2, 
            OnClick = l_Schema_0.OnReset, 
            LeftIcon = v9.Icon, 
            IconSize = v9.Height - 14, 
            Size = UDim2.fromOffset(v9.Height, v9.Height)
        })
    });
end;
