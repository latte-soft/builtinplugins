local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = v1.PureComponent:extend("KeyframeCluster");
v4.render = function(v5)
    local l_props_0 = v5.props;
    local l_keyframeTheme_0 = l_props_0.Stylizer.keyframeTheme;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local v11 = UDim2.new(0, l_Size_0.Y.Offset - 4, 0, l_Size_0.Y.Offset - 4);
    local v12 = not not l_props_0.Primary and l_keyframeTheme_0.primaryClusterColor or l_keyframeTheme_0.clusterColor;
    return v1.createElement("Frame", {
        BackgroundColor3 = v12, 
        ZIndex = l_ZIndex_0, 
        Position = l_Position_0, 
        AnchorPoint = Vector2.new(0, 0.5), 
        BorderSizePixel = 0, 
        Size = l_Size_0
    }, {
        LeftDiamond = v1.createElement("Frame", {
            BackgroundColor3 = v12, 
            Position = UDim2.new(0, 0, 0.5, 0), 
            ZIndex = l_ZIndex_0, 
            Size = v11, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Rotation = 45
        }), 
        RightDiamond = v1.createElement("Frame", {
            BackgroundColor3 = v12, 
            Position = UDim2.new(1, 0, 0.5, 0), 
            ZIndex = l_ZIndex_0, 
            Size = v11, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Rotation = 45
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v4));
