local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = v1.PureComponent:extend("NewUploadableIcon");
v4.init = function(v5)
    v5.mouseEnter = function()
        v5:mouseHoverChanged(true);
    end;
    v5.mouseLeave = function()
        v5:mouseHoverChanged(false);
    end;
end;
v4.mouseHoverChanged = function(v6, v7)
    local l_props_0 = v6.props;
    if not v7 then
        l_props_0.Mouse:__resetCursor();
        return ;
    else
        l_props_0.Mouse:__pushCursor("PointingHand");
        return ;
    end;
end;
v4.render = function(v9)
    local l_props_1 = v9.props;
    local l_Visible_0 = l_props_1.Visible;
    local l_Stylizer_0 = l_props_1.Stylizer;
    return v1.createElement("ImageButton", {
        Visible = l_Visible_0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Stylizer_0.newThumbnail.background, 
        ImageColor3 = l_Stylizer_0.newThumbnail.border, 
        Image = l_Stylizer_0.dottedBorder.square.image, 
        ResampleMode = Enum.ResamplerMode.Pixelated, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = l_Stylizer_0.dottedBorder.sliceCenter, 
        Size = UDim2.new(0, 150, 0, 150), 
        [v1.Event.MouseEnter] = v9.mouseEnter, 
        [v1.Event.MouseLeave] = v9.mouseLeave, 
        [v1.Event.Activated] = v9.props.OnClick
    }, {
        Plus = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = l_Stylizer_0.plus.image, 
            ImageColor3 = l_Stylizer_0.newThumbnail.plus, 
            ImageTransparency = 0.4, 
            ImageRectSize = l_Stylizer_0.plus.rectSize, 
            ImageRectOffset = l_Stylizer_0.plus.rectOffset, 
            Size = UDim2.new(0, 24, 0, 24), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = 2
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v4));
