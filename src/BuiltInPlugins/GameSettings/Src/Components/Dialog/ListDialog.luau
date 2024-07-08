local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_BulletList_0 = v2.UI.BulletList;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Components.Dialog.BaseDialog);
local v8 = v1.PureComponent:extend("ListDialog");
v8.render = function(v9)
    local l_props_0 = v9.props;
    return v1.createElement(v7, {
        Buttons = l_props_0.Buttons, 
        OnResult = l_props_0.OnResult
    }, {
        Header = v1.createElement("TextLabel", v3.Dictionary.join(l_props_0.Stylizer.fontStyle.SemiBold, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, -60, 0, 0), 
            BackgroundTransparency = 1, 
            Text = l_props_0.Header, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true
        })), 
        List = v1.createElement(l_BulletList_0, {
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Items = l_props_0.Entries, 
            Size = UDim2.new(1, -60, 0, 0)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
