local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_Dash_0 = v1.Dash;
local l_withContext_0 = v1.ContextServices.withContext;
local l_LoadingIndicator_0 = v1.UI.LoadingIndicator;
local v6 = require(l_Parent_0.Src.Controllers.ImageLoader);
local v7 = v2.PureComponent:extend("LoadingImage");
v7.init = function(v8)
    local l_props_0 = v8.props;
    v8.state = {
        currentImageLoaded = false
    };
    v8.mostRecentRequestedImage = nil;
    v8.requestLoadImage = function(v10)
        if v10 == v8.mostRecentRequestedImage then
            return ;
        else
            v8:setState({
                currentImageLoaded = false
            });
            v8.mostRecentRequestedImage = v10;
            if v10 ~= nil and v10 ~= "" then
                l_props_0.ImageLoader:loadImage(v10);
            end;
            return ;
        end;
    end;
    v8.onImageLoaded = function(v11)
        if v8.isMounted then
            if v11 == v8.mostRecentRequestedImage then
                v8:setState({
                    currentImageLoaded = true
                });
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v7.didMount = function(v12)
    local l_props_1 = v12.props;
    v12.isMounted = true;
    v12.onImageLoaderConnection = l_props_1.ImageLoader.ImageLoaded:Connect(v12.onImageLoaded);
    v12.requestLoadImage(l_props_1.Image);
end;
v7.willUnmount = function(v14)
    if v14.onImageLoaderConnection then
        v14.onImageLoaderConnection:Disconnect();
        v14.onImageLoaderConnection = nil;
    end;
    v14.isMounted = false;
end;
v7.didUpdate = function(v15, v16, _)
    local l_props_2 = v15.props;
    if v16.Image ~= l_props_2.Image then
        v15.requestLoadImage(l_props_2.Image);
    end;
end;
v7.render = function(v19)
    local l_props_3 = v19.props;
    local l_currentImageLoaded_0 = v19.state.currentImageLoaded;
    return v2.createElement("Frame", {
        LayoutOrder = l_props_3.LayoutOrder, 
        AnchorPoint = l_props_3.AnchorPoint, 
        Position = l_props_3.Position, 
        Size = l_props_3.Size, 
        ZIndex = l_props_3.ZIndex, 
        BackgroundTransparency = 1
    }, {
        Image = l_currentImageLoaded_0 and v2.createElement("ImageLabel", not not l_currentImageLoaded_0 and l_Dash_0.join(l_props_3, {
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = 2, 
            AnchorPoint = l_Dash_0.None, 
            Position = l_Dash_0.None, 
            ZIndex = l_Dash_0.None, 
            ImageTransparency = 0.5, 
            ImageLoader = l_Dash_0.None
        }) or {}), 
        LoadingSpinner = if l_currentImageLoaded_0 then nil else v2.createElement(l_LoadingIndicator_0, {
            LayoutOrder = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.fromScale(0.5, 0.5)
        })
    });
end;
return (l_withContext_0({
    ImageLoader = v6
})(v7));
