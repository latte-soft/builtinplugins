local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v2.Style.Stylizer;
local l_withContext_0 = v2.ContextServices.withContext;
local l_Image_0 = v2.UI.Image;
local l_Pane_0 = v2.UI.Pane;
local v7 = require(l_Parent_0.Src.Components.Thumbnails.AutoThumbnail);
local v8 = v1.Component:extend(script.Name);
v8.getThumbnail = function(v9, v10, v11)
    local l_Stylizer_1 = v9.props.Stylizer;
    if v11 == Enum.AssetFetchStatus.Success then
        return v10;
    elseif v11 == Enum.AssetFetchStatus.Failure then
        return l_Stylizer_1.userThumbnail.loadFailureImage;
    else
        return l_Stylizer_1.userThumbnail.loadingImage;
    end;
end;
v8.render = function(v13)
    local l_props_0 = v13.props;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_props_0.Size, 
        Position = l_props_0.Position, 
        AnchorPoint = l_props_0.AnchorPoint, 
        LayoutOrder = l_props_0.LayoutOrder, 
        ZIndex = l_props_0.ZIndex
    }, {
        AutoThumbnail = v1.createElement(v7, {
            Id = l_props_0.Id, 
            RenderContents = function(v15, v16)
                local v17 = v13:getThumbnail(v15, v16);
                local l_Stylizer_2 = l_props_0.Stylizer;
                local v19 = (1 - l_Stylizer_2.userThumbnail.avatarSizeRatio) / 2;
                return v1.createElement(l_Pane_0, {
                    BackgroundColor3 = l_props_0.BackgroundColor3, 
                    BackgroundTransparency = l_props_0.BackgroundTransparency
                }, {
                    ActivityRing = v1.createElement(l_Image_0, {
                        Image = l_props_0.Stylizer.activityRing, 
                        ImageColor3 = not not l_props_0.IsIdle and l_Stylizer_2.userThumbnail.idleTint or l_props_0.RingColor, 
                        Style = {
                            Transparency = not l_props_0.IsIdle and 0 or 0.2
                        }, 
                        Size = UDim2.fromScale(1, 1)
                    }), 
                    Avatar = v1.createElement("ImageLabel", {
                        Image = v17, 
                        Size = UDim2.fromScale(l_Stylizer_2.userThumbnail.avatarSizeRatio, l_Stylizer_2.userThumbnail.avatarSizeRatio), 
                        Position = UDim2.fromScale(v19, v19), 
                        BackgroundColor3 = not not l_props_0.IsIdle and l_Stylizer_2.userThumbnail.avatarIdleBackground or l_Stylizer_2.userThumbnail.avatarBackground, 
                        BackgroundTransparency = 0, 
                        ImageColor3 = not not l_props_0.IsIdle and l_Stylizer_2.userThumbnail.idleTint or nil, 
                        ImageTransparency = not l_props_0.IsIdle and 0 or 0.2
                    }, {
                        Corner = v1.createElement("UICorner", {
                            CornerRadius = UDim.new(0.5, 0)
                        })
                    }), 
                    Corner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    })
                });
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v8));
