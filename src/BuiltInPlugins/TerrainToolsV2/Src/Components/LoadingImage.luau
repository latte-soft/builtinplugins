local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_withContext_0 = v1.ContextServices.withContext;
local v5 = require(l_Parent_0.Src.ContextItems);
local v6 = require(l_Parent_0.Src.Components.Spinner);
local v7 = v2.PureComponent:extend("LoadingImage");
v7.init = function(v8)
    v8.state = {
        currentImageLoaded = false
    };
    v8.mostRecentRequestedImage = nil;
    v8.requestLoadImage = function(v9)
        if v9 == v8.mostRecentRequestedImage then
            return ;
        else
            v8:setState({
                currentImageLoaded = false
            });
            v8.mostRecentRequestedImage = v9;
            if v9 ~= nil and v9 ~= "" then
                v8.props.ImageLoader:loadImage(v9);
            end;
            return ;
        end;
    end;
    v8.onImageLoaded = function(v10)
        if v8.isMounted then
            if v10 == v8.mostRecentRequestedImage then
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
v7.didMount = function(v11)
    v11.isMounted = true;
    v11.onImageLoaderConnection = v11.props.ImageLoader.ImageLoaded:Connect(v11.onImageLoaded);
    v11.requestLoadImage(v11.props.Image);
end;
v7.willUnmount = function(v12)
    if v12.onImageLoaderConnection then
        v12.onImageLoaderConnection:Disconnect();
        v12.onImageLoaderConnection = nil;
    end;
    v12.isMounted = false;
end;
v7.didUpdate = function(v13, v14, _)
    if v14.Image ~= v13.props.Image then
        v13.requestLoadImage(v13.props.Image);
    end;
end;
v7.render = function(v16)
    local l_props_0 = v16.props;
    local l_currentImageLoaded_0 = v16.state.currentImageLoaded;
    return v2.createElement("Frame", {
        LayoutOrder = l_props_0.LayoutOrder, 
        AnchorPoint = l_props_0.AnchorPoint, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        ZIndex = l_props_0.ZIndex, 
        BackgroundTransparency = 1
    }, {
        Image = l_currentImageLoaded_0 and v2.createElement("ImageLabel", not not l_currentImageLoaded_0 and v3.Dictionary.join(l_props_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = v3.None, 
            AnchorPoint = v3.None, 
            Position = v3.None, 
            ZIndex = v3.None, 
            ImageLoader = v3.None
        }) or {}), 
        LoadingSpinner = not l_currentImageLoaded_0 and v2.createElement(v6, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
    });
end;
return (l_withContext_0({
    ImageLoader = v5.ImageLoader
})(v7));
