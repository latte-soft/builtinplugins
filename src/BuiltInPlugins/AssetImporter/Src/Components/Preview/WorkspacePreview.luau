local v0 = require(script:FindFirstAncestor("AssetImporter").Packages.Roact);
local v1 = v0.PureComponent:extend("WorkspacePreview");
v1.updateViewportModel = function(v2, v3)
    local v4 = v2.viewportFrameRef:getValue();
    if v4 then
        v2.viewportFrameModel = v3.Model:Clone();
        v2.viewportFrameModel:PivotTo(v3.Offset);
        v4:ClearAllChildren();
        v2.viewportFrameModel.Parent = v4;
    end;
end;
v1.init = function(v5)
    local l_props_0 = v5.props;
    v5.viewportFrameRef = v0.createRef();
    v5.camera = l_props_0.ReferenceCamera;
    v5.viewportFrameModel = nil;
    if l_props_0.Model then
        v5:updateViewportModel(l_props_0);
    end;
end;
v1.willUnmount = function(v7)
    if v7.viewportFrameModel then
        v7.viewportFrameModel:Destroy();
        v7.viewportFrameModel = nil;
    end;
end;
v1.willUpdate = function(v8, v9)
    local v10 = v8.viewportFrameRef:getValue();
    if not v9.Model then
        v8.viewportFrameModel:Destroy();
        v8.viewportFrameModel = nil;
        v10:ClearAllChildren();
        return ;
    else
        v8:updateViewportModel(v9);
        return ;
    end;
end;
v1.render = function(v11)
    local l_props_1 = v11.props;
    return v0.createElement("ViewportFrame", {
        LayoutOrder = l_props_1.LayoutOrder, 
        Position = l_props_1.Position, 
        Size = l_props_1.Size or UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ImageTransparency = 0.7, 
        CurrentCamera = v11.camera, 
        [v0.Ref] = v11.viewportFrameRef
    });
end;
return v1;
