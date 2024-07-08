local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5, v6, v7)
    local v8 = setmetatable({
        _axis = v6, 
        _mouse = v4, 
        _position = v5, 
        _clampingFunc = v7
    }, v3);
    assert(v4 ~= nil, "Mouse missing in for AxisLockedDragger");
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "AdornPart";
    l_Part_0.Transparency = 1;
    l_Part_0.TopSurface = "Smooth";
    l_Part_0.BottomSurface = "Smooth";
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = true;
    l_Part_0.CastShadow = false;
    l_Part_0.Parent = l_CoreGui_0;
    local l_SphereHandleAdornment_0 = Instance.new("SphereHandleAdornment");
    l_SphereHandleAdornment_0.Color = BrickColor.new("Toothpaste");
    l_SphereHandleAdornment_0.Radius = 10;
    l_SphereHandleAdornment_0.AlwaysOnTop = true;
    l_SphereHandleAdornment_0.Visible = false;
    l_SphereHandleAdornment_0.ZIndex = 1;
    v8._updateDrag = function()
        local v11 = v8:calcAxisPosMouseClick();
        if v11 then
            v8:setPosition(v11);
        end;
    end;
    v8._endDrag = function()
        if v8._updateDragConnection then
            v8._updateDragConnection:Disconnect();
            v8._updateDragConnection = nil;
        end;
        if v8._mouseButton1UpConnection then
            v8._mouseButton1UpConnection:Disconnect();
            v8._mouseButton1UpConnection = nil;
        end;
    end;
    v8._startDrag = function()
        if not v8._updateDragConnection then
            v8:updateCollisionPlaneNormal();
            v8._prevPosition = v8._position;
            v8._mouseButton1UpConnection = v8._mouse.Button1Up:Connect(v8._endDrag);
            v8._updateDragConnection = l_RunService_0.RenderStepped:Connect(v8._updateDrag);
            return ;
        else
            return ;
        end;
    end;
    v8._mouseButton1UpConnection = nil;
    v8._mouseButton1DownConnection = l_SphereHandleAdornment_0.MouseButton1Down:Connect(v8._startDrag);
    v8._updateDragConnection = nil;
    l_SphereHandleAdornment_0.Adornee = l_Part_0;
    l_SphereHandleAdornment_0.Parent = l_Part_0;
    v8._part = l_Part_0;
    v8._adorn = l_SphereHandleAdornment_0;
    return v8;
end;
v3.destroy = function(v12)
    v12._clampingFunc = nil;
    if v12._updateDragConnection then
        v12._updateDragConnection:Disconnect();
        v12._updateDragConnection = nil;
    end;
    if v12._mouseButton1DownConnection then
        v12._mouseButton1DownConnection:Disconnect();
        v12._mouseButton1DownConnection = nil;
    end;
    if v12._mouseButton1UpConnection then
        v12._mouseButton1UpConnection:Disconnect();
        v12._mouseButton1UpConnection = nil;
    end;
    if v12._adorn then
        v12._adorn:Destroy();
        v12._adorn = nil;
    end;
    if v12._part then
        v12._part:Destroy();
        v12._part = nil;
    end;
end;
v3.updateVisibility = function(v13, v14)
    v13._adorn.Visible = v14;
    if not v14 then
        v13._endDrag();
    end;
end;
v3.getPosition = function(v15)
    return v15._position;
end;
v3.setPosition = function(v16, v17)
    if v16._position ~= v17 then
        v16._position = v17;
        v16._part.Position = v17;
        v16._adorn.Radius = math.sqrt(((l_Workspace_0.CurrentCamera.CoordinateFrame.p + v16._position) / 2).Magnitude);
    end;
end;
v3.updateCollisionPlaneNormal = function(v18)
    local l__position_0 = v18._position;
    local l_p_0 = l_Workspace_0.CurrentCamera.CoordinateFrame.p;
    local l__axis_0 = v18._axis;
    local v22 = l_p_0 - l__position_0;
    if l__axis_0:Dot(v22) == 0 then
        v18._planeNormal = nil;
        return ;
    else
        v18._planeNormal = l__axis_0:Cross(v22):Cross(l__axis_0).Unit;
        return ;
    end;
end;
v3.calcPlaneHit = function(v23)
    local l_p_1 = l_Workspace_0.CurrentCamera.CoordinateFrame.p;
    local l_Direction_0 = v23._mouse.UnitRay.Direction;
    local v26 = l_Direction_0:Dot(v23._planeNormal);
    if v26 < 0 then
        return l_p_1 + ((v23._position - l_p_1):Dot(v23._planeNormal) / v26) * l_Direction_0;
    else
        return nil;
    end;
end;
v3.calcAxisPosMouseClick = function(v27)
    if v27._planeNormal then
        local v28 = v27:calcPlaneHit();
        if not v28 then
            return v27._position;
        else
            local v29 = v28 - v27._prevPosition;
            local l__axis_1 = v27._axis;
            local v31 = (v29:Dot(l__axis_1) / l__axis_1:Dot(l__axis_1)) * l__axis_1 + v27._prevPosition;
            if v27._clampingFunc then
                v31 = v27._clampingFunc(v31);
            end;
            return v31;
        end;
    else
        return ;
    end;
end;
return v3;
