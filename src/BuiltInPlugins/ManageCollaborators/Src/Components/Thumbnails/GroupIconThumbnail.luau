local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v2.Style.Stylizer;
local l_withContext_0 = v2.ContextServices.withContext;
local v5 = require(l_Parent_0.Src.Components.Thumbnails.AutoThumbnail);
local v6 = v1.Component:extend(script.Name);
v6.getThumbnail = function(v7, v8, v9)
    local l_Stylizer_1 = v7.props.Stylizer;
    if v9 == Enum.AssetFetchStatus.Success then
        return v8;
    elseif v9 == Enum.AssetFetchStatus.Failure then
        return l_Stylizer_1.groupThumbnail.loadFailureImage;
    else
        return l_Stylizer_1.groupThumbnail.loadingImage;
    end;
end;
v6.render = function(v11)
    local l_props_0 = v11.props;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_props_0.Size, 
        Position = l_props_0.Position, 
        AnchorPoint = l_props_0.AnchorPoint, 
        LayoutOrder = l_props_0.LayoutOrder, 
        ZIndex = l_props_0.ZIndex
    }, {
        AutoThumbnail = v1.createElement(v5, {
            Id = l_props_0.Id, 
            ThumbnailType = "GroupIcon", 
            RenderContents = function(v13, v14)
                return v1.createElement("ImageLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Image = v11:getThumbnail(v13, v14)
                });
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v6));
