local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = v3.PureComponent:extend("BaseTrack");
v4.render = function(v5)
    local l_props_0 = v5.props;
    local l_trackTheme_0 = l_props_0.Stylizer.trackTheme;
    local l_Size_0 = l_props_0.Size;
    local l_Width_0 = l_props_0.Width;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_Primary_0 = l_props_0.Primary;
    local l_ShowBackground_0 = l_props_0.ShowBackground;
    local v14 = nil;
    if not l_Primary_0 then
        if l_ShowBackground_0 then
            v14 = l_trackTheme_0.titleBackgroundColor;
        end;
    else
        v14 = l_trackTheme_0.primaryBackgroundColor;
    end;
    return v3.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundColor3 = v14, 
        BackgroundTransparency = not v14 and 1 or 0, 
        BorderSizePixel = 0, 
        ZIndex = l_ZIndex_0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        KeyframeDisplayArea = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Size = UDim2.new(0, l_Width_0, 1, 0), 
            ZIndex = l_ZIndex_0
        }, v5.props[v3.Children])
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v4));
