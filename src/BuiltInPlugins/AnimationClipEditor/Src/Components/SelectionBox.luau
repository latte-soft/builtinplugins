local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_DragListener_0 = v2.UI.DragListener;
local v6 = v1.PureComponent:extend("SelectionBox");
v6.render = function(v7)
    local l_props_0 = v7.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_SelectionStart_0 = l_props_0.SelectionStart;
    local l_SelectionEnd_0 = l_props_0.SelectionEnd;
    local l_SourceExtents_0 = l_props_0.SourceExtents;
    return v1.createElement(l_DragListener_0, {
        OnDragMoved = l_props_0.OnDragMoved, 
        OnDragEnded = l_props_0.OnDragEnded
    }, {
        Extents = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_SourceExtents_0.Min.X, 0, l_SourceExtents_0.Min.Y), 
            Size = UDim2.new(0, l_SourceExtents_0.Width, 0, l_SourceExtents_0.Height), 
            ClipsDescendants = true
        }, {
            Box = v1.createElement("Frame", {
                BackgroundColor3 = l_Stylizer_0.selectionBox, 
                BackgroundTransparency = 0.8, 
                Position = l_SelectionStart_0 and l_SelectionStart_0:map(function(v13)
                    return UDim2.new(0, v13.X - l_SourceExtents_0.Min.X, 0, v13.Y - l_SourceExtents_0.Min.Y);
                end), 
                Size = (l_SelectionStart_0 and l_SelectionEnd_0) and v1.joinBindings({
                    l_SelectionStart_0, 
                    l_SelectionEnd_0
                }):map(function(v14)
                    local v15 = v14[2] - v14[1];
                    return UDim2.new(0, v15.X, 0, v15.Y);
                end)
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6));
