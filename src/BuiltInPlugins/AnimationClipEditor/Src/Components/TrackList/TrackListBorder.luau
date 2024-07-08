local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Components.DragListenerArea);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = v1.PureComponent:extend("TrackListBorder");
v5.render = function(v6)
    local l_props_0 = v6.props;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, 2, 1, 0), 
        LayoutOrder = 1, 
        BackgroundColor3 = l_props_0.Stylizer.borderColor, 
        BorderSizePixel = 0, 
        ZIndex = l_props_0.ZIndex
    }, {
        DragArea = v1.createElement(v2, {
            AnchorPoint = Vector2.new(1, 0), 
            Size = UDim2.new(0, 5, 1, 0), 
            ZIndex = 2, 
            Cursor = "SplitEW", 
            OnDragMoved = l_props_0.OnDragMoved
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));
