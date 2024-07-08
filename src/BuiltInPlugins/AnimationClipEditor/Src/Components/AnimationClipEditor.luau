local l_FirstAncestor_0 = script.Parent:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_FirstAncestor_0.Src.Components.EditorController);
local v5 = v1.PureComponent:extend("AnimationClipEditor");
v5.render = function(v6)
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v6.props.Stylizer.backgroundColor
    }, {
        EditorController = v1.createElement(v4, {
            Size = UDim2.new(1, 0, 1, 0)
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Analytics = l_ContextServices_0.Analytics
})(v5));
