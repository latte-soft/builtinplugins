local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = v1.Component:extend("FeatureDisabledPage");
v4.render = function(v5)
    local l_Stylizer_0 = v5.props.Stylizer;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 16), 
            PaddingTop = UDim.new(0, 16), 
            PaddingLeft = UDim.new(0, 16), 
            PaddingRight = UDim.new(0, 16)
        }), 
        Error = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = v5.props.Text, 
            Font = l_Stylizer_0.labels.MainFont, 
            TextColor3 = l_Stylizer_0.labels.MainText, 
            TextSize = 18, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v4));
