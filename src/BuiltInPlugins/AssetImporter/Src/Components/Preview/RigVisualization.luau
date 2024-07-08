local v0 = require(script:FindFirstAncestor("AssetImporter").Packages.Roact);
local v1 = v0.PureComponent:extend("RigVisualization");
v1.init = function(v2)
    v2.viewportFrameRef = v0.createRef();
    v2.camera = v2.props.Camera;
    v2.viewportFrameModel = nil;
    v2.centerModel = function(v3)
        local l_viewportFrameModel_0 = v2.viewportFrameModel;
        local _ = nil;
        l_viewportFrameModel_0:TranslateBy(if not v3:IsA("Model") then -v3.CFrame.Position else -v3:GetBoundingBox().Position);
    end;
end;
v1.addViewportModel = function(v6)
    v6.viewportFrameModel = v6.props.AssetImportSession:GetRigVisualization(v6.props.SelectedImportItem):Clone();
    v6.centerModel(v6.props.PreviewInstance);
    local v7 = v6.viewportFrameRef:getValue();
    if v7 then
        v6.viewportFrameModel.Parent = v7;
    end;
end;
v1.didUpdate = function(v8)
    if v8.viewportFrameModel then
        v8.viewportFrameModel:Destroy();
        v8.viewportFrameModel = nil;
    end;
    v8:addViewportModel();
end;
v1.didMount = function(v9)
    v9:addViewportModel();
end;
v1.willUnmount = function(v10)
    if v10.viewportFrameModel then
        v10.viewportFrameModel:Destroy();
        v10.viewportFrameModel = nil;
    end;
end;
v1.render = function(v11)
    local l_props_0 = v11.props;
    return v0.createElement("ViewportFrame", {
        LayoutOrder = l_props_0.LayoutOrder, 
        Position = l_props_0.Position or UDim2.new(0, 0, 0, 0), 
        Size = l_props_0.Size or UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        CurrentCamera = v11.camera, 
        [v0.Ref] = v11.viewportFrameRef
    });
end;
return v1;
