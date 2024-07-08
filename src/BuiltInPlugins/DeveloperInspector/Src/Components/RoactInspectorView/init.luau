local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(script.Parent.RoactElementTree);
local v4 = require(script.Parent.FieldsTable);
local v5 = require(script.Parent.NodeList);
local l_Pane_0 = v2.UI.Pane;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = v1.PureComponent:extend("RoactInspectorView");
v9.render = function(v10)
    local l_Stylizer_0 = v10.props.Stylizer;
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        Padding = l_Stylizer_0.Padding, 
        Spacing = l_Stylizer_0.Padding
    }, {
        Left = v1.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            Layout = Enum.FillDirection.Vertical, 
            Size = UDim2.new(0.5, -l_Stylizer_0.Padding, 1, 0), 
            Spacing = l_Stylizer_0.Padding
        }, {
            TreeContainer = v1.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 1, -l_Stylizer_0.NodeListHeight)
            }, {
                RoactElementTree = v1.createElement(v3, {})
            }), 
            ListContainer = v1.createElement(l_Pane_0, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.NodeListHeight - l_Stylizer_0.Padding)
            }, {
                NodeList = v1.createElement(v5, {
                    selectTarget = v10.selectTarget
                })
            })
        }), 
        Right = v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = UDim2.fromScale(0.5, 1)
        }, {
            Child = v1.createElement(v4, {})
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
