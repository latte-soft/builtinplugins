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
        return l_Stylizer_0.subjectThumbnail.loadFailureImage;
    else
        return l_Stylizer_0.subjectThumbnail.loadingImage;
    end;
end;
v5.init = function(v10)
    v10.maskRef = v1.createRef();
    v10.maskBackgroundParent = nil;
    v10.parentChanged = nil;
    v10.colorChanged = nil;
    v10.getBackgroundParent = function(v11)
        local l_Parent_1 = v11.Parent;
        if l_Parent_1 ~= nil and l_Parent_1:IsA("GuiObject") then
            if l_Parent_1.BackgroundTransparency ~= 1 then
                return l_Parent_1;
            else
                return v10.getBackgroundParent(l_Parent_1);
            end;
        else
            return nil;
        end;
    end;
end;
v5.didMount = function(v13)
    local function v15()
        local v14 = v13.maskRef:getValue();
        if v14 then
            v14.ImageColor3 = v13.maskBackgroundParent.BackgroundColor3;
            return ;
        else
            return ;
        end;
    end;
    local function v18()
        local v16 = v13.maskRef:getValue();
        if v16 then
            v13.maskBackgroundParent = v13.getBackgroundParent(v16.Parent);
            if v13.colorChanged then
                v13.colorChanged:Disconnect();
            end;
            if v13.maskBackgroundParent then
                v13.colorChanged = v13.maskBackgroundParent:GetPropertyChangedSignal("BackgroundColor3"):Connect(v15);
                local v17 = v13.maskRef:getValue();
                if v17 then
                    v17.ImageColor3 = v13.maskBackgroundParent.BackgroundColor3;
                else
                    return ;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v13.parentChanged = v13.maskRef:getValue().AncestryChanged:Connect(v18);
    v18();
end;
v5.willUnmount = function(v19)
    v19.parentChanged:Disconnect();
    if v19.colorChanged then
        v19.colorChanged:Disconnect();
    end;
end;
v5.render = function(v20)
    local l_props_0 = v20.props;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_props_0.Size, 
        Position = l_props_0.Position, 
        AnchorPoint = l_props_0.AnchorPoint, 
        LayoutOrder = l_props_0.LayoutOrder, 
        ZIndex = l_props_0.ZIndex
    }, {
        AutoThumbnail = v1.createElement(v4, {
            Id = l_props_0.Id, 
            ThumbnailType = "AvatarHeadShot", 
            RenderContents = function(v22, v23)
                local v24 = v20:getThumbnail(v22, v23);
                local l_Stylizer_1 = l_props_0.Stylizer;
                return v1.createElement("ImageLabel", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundColor3 = l_Stylizer_1.subjectThumbnail.background, 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    Image = v24
                }, {
                    Mask = v1.createElement("ImageLabel", {
                        [v1.Ref] = v20.maskRef, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        Image = l_Stylizer_1.subjectThumbnail.maskImage
                    })
                });
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));
