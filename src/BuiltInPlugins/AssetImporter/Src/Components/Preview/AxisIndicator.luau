local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Utility.createAxisIndicator);
local v3 = v1.PureComponent:extend("AxisIndicator");
local v4 = CFrame.new(0, 0, 6);
v3.init = function(v5)
    v5.isOrbitDragging = false;
    v5.isPanDragging = false;
    v5.lastClickTime = 0;
    v5.initialCenter = false;
    v5.props.Model = v2();
    v5.viewportFrameRef = v1.createRef();
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.Name = "AxisCamera";
    local l_ReferenceCamera_0 = v5.props.ReferenceCamera;
    l_Camera_0.CFrame = (l_ReferenceCamera_0.CFrame - l_ReferenceCamera_0.CFrame.Position):ToWorldSpace(v4);
    v5.refCamCFrameChangedConnection = l_ReferenceCamera_0:GetPropertyChangedSignal("CFrame"):Connect(function()
        l_Camera_0.CFrame = (l_ReferenceCamera_0.CFrame - l_ReferenceCamera_0.CFrame.Position):ToWorldSpace(v4);
    end);
    v5.camera = l_Camera_0;
    v5.viewportFrameModel = nil;
end;
v3.updateViewportModel = function(v8)
    v8.viewportFrameModel = v8.props.Model:Clone();
    local v9 = v8.viewportFrameRef:getValue();
    if v9 then
        v9:ClearAllChildren();
        v8.viewportFrameModel.Parent = v9;
    end;
end;
v3.didMount = function(v10)
    v10:updateViewportModel();
end;
v3.willUnmount = function(v11)
    if v11.viewportFrameModel then
        v11.viewportFrameModel:Destroy();
        v11.viewportFrameModel = nil;
    end;
    if v11.camera then
        v11.camera:Destroy();
        v11.camera = nil;
    end;
    v11.refCamCFrameChangedConnection:Disconnect();
end;
v3.render = function(v12)
    local l_props_0 = v12.props;
    return v1.createElement("ViewportFrame", {
        LayoutOrder = l_props_0.LayoutOrder, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size or UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        CurrentCamera = v12.camera, 
        [v1.Ref] = v12.viewportFrameRef
    });
end;
return v3;
