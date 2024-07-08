local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v7 = v1.PureComponent:extend("UploadableIcon");
v7.init = function(v8)
    v8.state = {
        Hovering = false
    };
end;
v7.mouseHoverChanged = function(v9, v10)
    local l_props_0 = v9.props;
    if not v10 then
        l_props_0.Mouse:__resetCursor();
    else
        l_props_0.Mouse:__pushCursor("PointingHand");
    end;
    v9:setState({
        Hovering = v10
    });
end;
v7.render = function(v12)
    local l_Image_0 = v12.props.Image;
    local v14 = v12.props.Review or false;
    local v15 = v12.props.Preview or false;
    local l_Hovering_0 = v12.state.Hovering;
    local l_Stylizer_0 = v12.props.Stylizer;
    local l_Localization_0 = v12.props.Localization;
    return v1.createElement("ImageLabel", {
        Visible = v12.props.Visible, 
        Size = UDim2.new(0, 150, 0, 150), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Image = "rbxasset://textures/GameSettings/ModeratedAsset.jpg", 
        [v1.Ref] = v12.buttonRef, 
        [v1.Event.MouseEnter] = function()
            v12:mouseHoverChanged(true);
        end, 
        [v1.Event.MouseLeave] = function()
            v12:mouseHoverChanged(false);
        end
    }, {
        Icon = v1.createElement("ImageLabel", {
            Visible = v12.props.Visible, 
            BackgroundTransparency = 1, 
            Image = l_Image_0, 
            ScaleType = Enum.ScaleType.Crop, 
            Size = UDim2.new(1, 0, 1, 0)
        }), 
        InfoText = v1.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
            Visible = v14 or v15, 
            BackgroundTransparency = 0.3, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v6.BLACK, 
            TextColor3 = v6.WHITE, 
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            ZIndex = 3, 
            Text = not not v15 and l_Localization_0:getText("General", "ImagePreview") or l_Localization_0:getText("General", "ImageReview")
        })), 
        Change = v1.createElement("ImageButton", {
            Visible = l_Hovering_0 and not v14, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1.5, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            Image = v6.GRADIENT_IMAGE, 
            ImageRectSize = v6.GRADIENT_RECT_SIZE, 
            ImageColor3 = v6.BLACK, 
            ZIndex = 4, 
            [v1.Event.Activated] = v12.props.OnClick
        }, {
            Text = v1.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 30), 
                Position = UDim2.new(0, 0, 1, -15), 
                AnchorPoint = Vector2.new(0, 1), 
                Text = l_Localization_0:getText("General", "GameIconChange"), 
                ZIndex = 5
            }))
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v7));
