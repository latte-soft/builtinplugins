local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Src.Components.DragListenerArea);
local v5 = v1.PureComponent:extend("ScaleHandle");
v5.render = function(v6)
    local l_props_0 = v6.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Size_0 = l_props_0.Size;
    local l_Position_0 = l_props_0.Position;
    local l_ZIndex_0 = l_props_0.ZIndex;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_Size_0, 
        Position = l_Position_0, 
        ZIndex = l_ZIndex_0
    }, {
        DragListenerArea = v1.createElement(v4, {
            Cursor = "SizeEW", 
            OnDragBegan = l_props_0.OnScaleHandleDragStart, 
            OnDragMoved = l_props_0.OnScaleHandleDragMoved, 
            OnDragEnded = l_props_0.OnScaleHandleDragEnd
        }), 
        Bar = v1.createElement("Frame", {
            BackgroundColor3 = l_Stylizer_0.scaleControlsTheme.mainColor, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 2, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            ZIndex = l_ZIndex_0
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));
