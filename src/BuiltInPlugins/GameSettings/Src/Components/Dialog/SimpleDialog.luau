local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Components.Dialog.BaseDialog);
local v7 = v1.PureComponent:extend("SimpleDialog");
v7.render = function(v8)
    local l_props_0 = v8.props;
    return v1.createElement(v6, {
        Buttons = l_props_0.Buttons, 
        OnResult = l_props_0.OnResult
    }, {
        Header = v1.createElement("TextLabel", v3.Dictionary.join(l_props_0.Stylizer.fontStyle.Title, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            Text = l_props_0.Header, 
            TextWrapped = true
        })), 
        Body = l_props_0.Body
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
