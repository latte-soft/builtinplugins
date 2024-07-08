local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Container_0 = l_UI_0.Container;
local l_Box_0 = l_UI_0.Box;
local l_Components_0 = l_Parent_0.Src.Components;
local v10 = require(l_Components_0.InputPane);
local v11 = require(l_Components_0.RepopulatableHistory);
local v12 = v1.PureComponent:extend("EventEmulator");
v12.render = function(v13)
    return v1.createElement(l_Container_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Background = l_Box_0
    }, {
        Layout = v1.createElement("UIListLayout", v13.props.Stylizer.Layout.Vertical), 
        InputPane = v1.createElement(v10), 
        History = v1.createElement(v11)
    });
end;
return v2.connect(function(v14, _)
    return {
        ActiveView = v14.Status.ActiveView
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v12)));
