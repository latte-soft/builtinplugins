local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_Parent_0.Src.Components.AutoThumbnails.AutoThumbnail);
local v5 = v1.Component:extend(script.Name);
v5.getThumbnail = function(v6, v7, v8)
    local l_Stylizer_0 = v6.props.Stylizer;
    if v8 == Enum.AssetFetchStatus.Success then
        return v7;
    elseif v8 == Enum.AssetFetchStatus.Failure then
        return l_Stylizer_0.badgeIconThumbnail.loadFailureImage;
    else
        return l_Stylizer_0.badgeIconThumbnail.loadingImage;
    end;
end;
v5.render = function(v10)
    local l_props_0 = v10.props;
    local l_Id_0 = l_props_0.Id;
    assert(type(l_Id_0) == "number");
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = not not l_props_0.Size and l_props_0.Size or UDim2.fromScale(1, 1), 
        Position = l_props_0.Position, 
        AnchorPoint = l_props_0.AnchorPoint, 
        LayoutOrder = l_props_0.LayoutOrder, 
        ZIndex = l_props_0.ZIndex
    }, {
        AutoThumbnail = v1.createElement(v4, {
            Id = l_Id_0, 
            ThumbnailType = "BadgeIcon", 
            UseAssetThumbnailUrl = true, 
            RenderContents = function(v13, v14)
                return v1.createElement("ImageLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Image = v10:getThumbnail(v13, v14)
                });
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));
