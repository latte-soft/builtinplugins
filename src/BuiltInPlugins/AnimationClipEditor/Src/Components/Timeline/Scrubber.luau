local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = v1.PureComponent:extend("Scrubber");
v4.render = function(v5)
    local l_props_0 = v5.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Position_0 = l_props_0.Position;
    local l_HeadSize_0 = l_props_0.HeadSize;
    local l_Height_0 = l_props_0.Height;
    local l_ShowHead_0 = l_props_0.ShowHead;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_Thickness_0 = l_props_0.Thickness;
    local v15 = l_props_0[v1.Children] or {};
    if l_ShowHead_0 then
        table.insert(v15, v1.createElement("ImageLabel", {
            Image = l_Stylizer_0.scrubberTheme.image, 
            ImageColor3 = l_Stylizer_0.scrubberTheme.backgroundColor, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }));
    end;
    table.insert(v15, v1.createElement("Frame", {
        Position = UDim2.new(0.5, 0, 0, 0), 
        Size = UDim2.new(0, l_Thickness_0, 0, l_Height_0), 
        BackgroundColor3 = l_Stylizer_0.scrubberTheme.backgroundColor, 
        AnchorPoint = Vector2.new(0.5, 0), 
        BorderSizePixel = 0
    }));
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = l_Position_0, 
        Size = l_HeadSize_0, 
        ZIndex = l_ZIndex_0, 
        AnchorPoint = l_AnchorPoint_0, 
        [v1.Event.InputBegan] = v5.onDragBegan
    }, v15);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v4));
