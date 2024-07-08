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
        return l_Stylizer_1.subjectThumbnail.loadFailureImage;
    else
        return l_Stylizer_1.subjectThumbnail.loadingImage;
    end;
end;
v6.init = function(v11)
    v11.maskRef = v1.createRef();
    v11.maskBackgroundParent = nil;
    v11.parentChanged = nil;
    v11.colorChanged = nil;
    v11.getBackgroundParent = function(v12)
        local l_Parent_1 = v12.Parent;
        if l_Parent_1 ~= nil and l_Parent_1:IsA("GuiObject") then
            if l_Parent_1.BackgroundTransparency ~= 1 then
                return l_Parent_1;
            else
                return v11.getBackgroundParent(l_Parent_1);
            end;
        else
            return nil;
        end;
    end;
end;
v6.didMount = function(v14)
    local function v16()
        local v15 = v14.maskRef:getValue();
        if v15 then
            v15.ImageColor3 = v14.maskBackgroundParent.BackgroundColor3;
            return ;
        else
            return ;
        end;
    end;
    local function v19()
        local v17 = v14.maskRef:getValue();
        if v17 then
            v14.maskBackgroundParent = v14.getBackgroundParent(v17.Parent);
            if v14.colorChanged then
                v14.colorChanged:Disconnect();
            end;
            if v14.maskBackgroundParent then
                v14.colorChanged = v14.maskBackgroundParent:GetPropertyChangedSignal("BackgroundColor3"):Connect(v16);
                local v18 = v14.maskRef:getValue();
                if v18 then
                    v18.ImageColor3 = v14.maskBackgroundParent.BackgroundColor3;
                else
                    return ;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v14.parentChanged = v14.maskRef:getValue().AncestryChanged:Connect(v19);
    v19();
end;
v6.willUnmount = function(v20)
    v20.parentChanged:Disconnect();
    if v20.colorChanged then
        v20.colorChanged:Disconnect();
    end;
end;
v6.render = function(v21)
    local l_props_0 = v21.props;
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
            ThumbnailType = "AvatarHeadShot", 
            RenderContents = function(v23, v24)
                local v25 = v21:getThumbnail(v23, v24);
                local l_Stylizer_2 = v21.props.Stylizer;
                return v1.createElement("ImageLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundColor3 = l_Stylizer_2.subjectThumbnail.background, 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    Image = v25
                }, {
                    Mask = v1.createElement("ImageLabel", {
                        [v1.Ref] = v21.maskRef, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        Image = l_Stylizer_2.subjectThumbnail.maskImage
                    })
                });
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v6));
