local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(script.class);
local v4 = require(script.constants);
local v5 = require(script.Util);
local v6 = require(script.WindhoseSimulation);
local v7 = require(script.Parent.Parent.Util.AnalyticsGlobals);
local l_EnableWindControlRBXTelemetry_0 = game:GetFastFlag("EnableWindControlRBXTelemetry");
local v10 = v3(function(v9)
    v9.cameraCFrame = nil;
    v9.initSucceded = false;
    v9.animStartCFrame = nil;
    v9.animTargetCFrame = nil;
    v9.windhoseSimulation = nil;
    v9.lastTick = nil;
    v9.currentTime = nil;
    v9.windScaleFactor = 10;
    v9.spinX = 0;
    v9.spinY = 1.5707963267948966;
    v9.windSpeed = workspace.GlobalWind.Magnitude;
    v9.lastWind = nil;
end);
v10.init = function(v11, v12, v13, v14, v15, v16, v17, v18)
    v11.worldModel = v12;
    v11.viewportCamera = v13;
    v11.viewport = v14;
    v11.onWindChanged = v15;
    v11.onWindowMoved = v16;
    v11.onisChangingPitchChanged = v17;
    v11.onisChangingYawChanged = v18;
    v11.selectRing = v12:WaitForChild("UnitSelectRingXZ");
    v11.selectStick = v12:WaitForChild("UnitSelectStickDownPositiveZ");
    v11.selectArrow = v12:WaitForChild("ArrowTipDownPositiveZ");
    v11.selectStick.Color = Color3.new(0, 0, 1);
    v11.selectRing.Size = Vector3.new(v11.selectRing.Size.x, 2 * v11.selectRing.Size.y, v11.selectRing.Size.z);
    v11.selectRingOrigSize = v11.selectRing.Size;
    v11.selectStick.Size = Vector3.new(4 * v11.selectStick.Size.x, 4 * v11.selectStick.Size.y, v11.selectStick.Size.z);
    v11.selectStickOrigSize = v11.selectStick.Size;
    v11.selectArrow.Size = Vector3.new(4 * v11.selectArrow.Size.x, 4 * v11.selectArrow.Size.y, 2 * v11.selectArrow.Size.z);
    v11.selectArrowOrigSize = v11.selectArrow.Size;
    v11.ringDragIndicatorPart = Instance.new("Part");
    v11.ringDragIndicatorPart.Parent = v12;
    v11.ringDragIndicatorPart.Material = v11.selectRing.Material;
    v11.ringDragIndicatorPart.Color = Color3.new(0, 1, 0);
    v11.ringDragIndicatorPart.Transparency = 1;
    v11.ringDragIndicatorPart.Size = Vector3.new(0.05, 0.05, v11.selectRing.Size.z / 2);
    v11.ringDragIndicatorPart.CFrame = CFrame.new(v11.selectRing.CFrame.Position + Vector3.new(0, 0, v11.selectRing.Size.z / 2));
    v11.initSucceded = true;
end;
v10.loadValuesFromGlobalWind = function(v19)
    if not (((v19.windChanged or v19.isScaling) or v19.isChangingPitch) or v19.isChangingYaw) and v19.lastWind ~= workspace.GlobalWind then
        if workspace.GlobalWind:Dot(workspace.GlobalWind) > 0 then
            local v20 = -workspace.GlobalWind.Unit;
            local v21 = 0;
            if v20.z < 0 then
                v21 = 3.141592653589793;
            end;
            if v20.z ~= 0 then
                v19.spinY = v21 + math.atan(v20.x / v20.z);
            elseif v20.x > 0 then
                v19.spinY = v21 + 1.5707963267948966;
            else
                v19.spinY = v21 - 1.5707963267948966;
            end;
            v19.spinX = math.asin((math.clamp(-v20.y, -1, 1)));
        end;
        if v19.lastWind ~= workspace.GlobalWind then
            v19.selectStick.CFrame = CFrame.fromEulerAnglesYXZ(0, v19.spinY, 0) * CFrame.fromEulerAnglesYXZ(v19.spinX, 0, 0);
            v19.selectStick.CFrame = v19.selectStick.CFrame - v19.selectStick.CFrame.LookVector;
            v19.onWindChanged();
        end;
        v19.windSpeed = math.clamp(workspace.GlobalWind.Magnitude, 0, 999.9);
        v19.lastWind = workspace.GlobalWind;
    end;
end;
v10.onMouseEnter = function(v22)
    v22.hover = true;
end;
v10.onMouseLeave = function(v23)
    v23.hover = false;
    v23.isHoveringOverRing = false;
    v23.isHoveringOverStick = false;
end;
v10.processRaycast = function(v24, v25, v26)
    v24:updatePickRay(v25, v26);
    local v27 = RaycastParams.new();
    v27.FilterType = Enum.RaycastFilterType.Blacklist;
    v27.FilterDescendantsInstances = {
        v24.windhoseSimulation.cone
    };
    local v28 = v24.worldModel:Raycast(v24.ray.Origin, v24.ray.Direction * v4.planeTestRayLength, v27);
    if not v28 then
        v24.isHoveringOverRing = false;
        v24.isHoveringOverArrow = false;
        v24.isHoveringOverStick = false;
        return ;
    else
        if v24.selectRing == v28.Instance then
            v24.isHoveringOverRing = true;
        else
            v24.isHoveringOverRing = false;
        end;
        if v24.selectStick == v28.Instance then
            v24.isHoveringOverStick = true;
            v24.isHoveringOverRing = false;
        else
            v24.isHoveringOverStick = false;
        end;
        if v24.selectArrow == v28.Instance then
            v24.isHoveringOverStick = true;
            return ;
        else
            v24.isHoveringOverArrow = false;
            return ;
        end;
    end;
end;
v10.onMouseMove = function(v29, v30, v31)
    if v29.initSucceded then
        if not v5.isInvalidCameraType() then
            v29:processRaycast(v30, v31);
            local l_ray_0 = v29.ray;
            local v33 = Vector3.new(0, 0, 0);
            local v34 = nil;
            if v29.isChangingYaw then
                v34 = v5.getRayPlaneHit(l_ray_0.Origin, l_ray_0.Origin + l_ray_0.Direction * v4.planeTestRayLength, Vector3.new(0, 1, 0), v4.selectRingXZDistance);
                if not v29.rayHitLastFrame then
                    v29.rayHitLastFrame = v34;
                end;
                local v35 = v34 - v33;
                v35 = Vector3.new(v35.x, 0, v35.z).Unit;
                local l_Unit_0 = (v29.rayHitLastFrame - v33).Unit;
                l_Unit_0 = Vector3.new(l_Unit_0.x, 0, l_Unit_0.z).Unit;
                local _ = nil;
                v29.spinY = v29.spinY + (v35:Cross(l_Unit_0).y >= 0 and -1 or 1) * math.acos((math.clamp(v35:Dot(l_Unit_0), -1, 1)));
            end;
            if v29.isChangingPitch then
                v34 = v5.getRayPlaneHit(l_ray_0.Origin, l_ray_0.Origin + l_ray_0.Direction * v4.planeTestRayLength, v29.selectStick.CFrame.RightVector, 0);
                if CFrame.fromEulerAnglesYXZ(0, v29.spinY, 0).LookVector:Dot(v34) < 0 then
                    if not v29.rayHitLastFrame then
                        v29.rayHitLastFrame = v34;
                    end;
                    local l_Unit_1 = (v34 - v33).Unit;
                    local _ = Vector3.new(l_Unit_1.x, 0, l_Unit_1.z).Unit;
                    v29.spinX = math.asin((math.clamp(-l_Unit_1.y, -1, 1)));
                end;
            end;
            v29.rayHitLastFrame = v34;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v10.onInputChanged = function(v40, v41)
    if v40.mouseDownPosition == nil then
        return ;
    else
        if v41.UserInputType == Enum.UserInputType.MouseMovement then
            local l_x_0 = v41.Position.x;
            local l_y_0 = v41.Position.y;
            if v4.dragDelta < math.abs(v40.mouseDownPosition.x - l_x_0) + math.abs(v40.mouseDownPosition.y - l_y_0) then
                local v44 = (v40.mouseDownGuiPosition.X.Offset + l_x_0) - v40.mouseDownPosition.x;
                local v45 = (v40.mouseDownGuiPosition.Y.Offset + l_y_0) - v40.mouseDownPosition.y;
                if not (not (v40.isChangingYaw or v40.isChangingPitch) and not v40.isScaling) then
                    v40:onMouseMove(l_x_0, l_y_0);
                    v40.windChanged = true;
                end;
                if not ((v40.isChangingYaw or v40.isChangingPitch) or v40.isScaling) then
                    v40.viewport.Position = UDim2.new(v40.mouseDownGuiPosition.X.Scale, v44, v40.mouseDownGuiPosition.Y.Scale, v45);
                end;
            end;
        end;
        return ;
    end;
end;
v10.onInputEnded = function(v46, v47)
    if v47.UserInputType == Enum.UserInputType.MouseButton1 then
        v46.isChangingYaw = false;
        v46.isChangingPitch = false;
        v46.isScaling = false;
        v46.ringDragIndicatorPart.Transparency = 1;
    end;
    if not (not (v47.UserInputType == Enum.UserInputType.MouseButton1) or not v46.mouseDownPosition) then
        v46.mouseDownPosition = nil;
    end;
end;
v10.screenPointToViewport = function(v48, v49, v50)
    local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
    return (v49 - v48.viewport.AbsolutePosition.x) - l_l_GuiService_0_GuiInset_0.x, (v50 - v48.viewport.AbsolutePosition.y) - l_l_GuiService_0_GuiInset_0.y;
end;
v10.updatePickRay = function(v52, v53, v54)
    local v55, v56 = v52:screenPointToViewport(v53, v54);
    v52.ray = v52.viewportCamera:ViewportPointToRay(v55 / v52.viewport.AbsoluteSize.x, v56 / v52.viewport.AbsoluteSize.y, 0);
    if v52.cameraCFrame == nil then
        return ;
    else
        v52.direction = v52.cameraCFrame:VectorToWorldSpace(v52.ray.Direction);
        return ;
    end;
end;
v10.onMouseButton1Down = function(v57, v58, v59)
    if v57.initSucceded then
        v57:processRaycast(v58, v59);
        v57.mouseDownPosition = Vector2.new(v58, v59);
        v57.mouseDownGuiPosition = v57.viewport.Position;
        v57.isChangingPitch = v57.isHoveringOverStick or v57.isHoveringOverArrow;
        v57.isChangingYaw = (not v57.isChangingPitch and not v57.isScaling) and v57.isHoveringOverRing;
        v57.ringDragIndicatorPart.Transparency = not v57.isChangingYaw and 1 or 0;
        if not v57.isChangingYaw then
            if v57.isChangingPitch then
                v57.onisChangingPitchChanged();
            end;
        else
            v57.onisChangingYawChanged();
            if l_EnableWindControlRBXTelemetry_0 then
                local l_v7_0 = v7;
                l_v7_0.greenCircleCount = l_v7_0.greenCircleCount + 1;
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v10.afterCamera = function(v61, _)
    local l_viewportCamera_0 = v61.viewportCamera;
    local l_selectStick_0 = v61.selectStick;
    local l_selectRing_0 = v61.selectRing;
    local l_selectArrow_0 = v61.selectArrow;
    local l_isHoveringOverStick_0 = v61.isHoveringOverStick;
    local l_isHoveringOverRing_0 = v61.isHoveringOverRing;
    local l_isHoveringOverArrow_0 = v61.isHoveringOverArrow;
    local l_isChangingPitch_0 = v61.isChangingPitch;
    local l_isChangingYaw_0 = v61.isChangingYaw;
    local l_isScaling_0 = v61.isScaling;
    if l_viewportCamera_0 == nil then
        return ;
    else
        v61:loadValuesFromGlobalWind();
        if v61.windChanged then
            workspace.GlobalWind = v61.selectStick.CFrame.LookVector * workspace.GlobalWind.Magnitude;
            v61.onWindChanged();
            v61.windChanged = false;
        end;
        v61.windhoseSimulation.windSpeed = v61.windSpeed;
        v61.windhoseSimulation.windDir = l_selectArrow_0.CFrame.LookVector;
        v61.windhoseSimulation.spinY = v61.spinY;
        v61.windhoseSimulation.spinX = v61.spinX;
        l_viewportCamera_0.CFrame = CFrame.new(l_viewportCamera_0.CFrame.Position.X, l_viewportCamera_0.CFrame.Position.Y, l_viewportCamera_0.CFrame.Position.Z + 0.001 * (tick() - v61.lastTick));
        l_selectStick_0.CFrame = CFrame.fromEulerAnglesYXZ(0, v61.spinY, 0) * CFrame.fromEulerAnglesYXZ(v61.spinX, 0, 0);
        l_selectStick_0.CFrame = l_selectStick_0.CFrame - l_selectStick_0.CFrame.LookVector;
        v61.ringDragIndicatorPart.CFrame = CFrame.fromEulerAnglesYXZ(0, v61.spinY, 0);
        v61.ringDragIndicatorPart.CFrame = v61.ringDragIndicatorPart.CFrame - v61.ringDragIndicatorPart.CFrame.LookVector / 2;
        v61.ringDragIndicatorPart.CFrame = v61.ringDragIndicatorPart.CFrame - Vector3.yAxis / 2;
        l_selectArrow_0.CFrame = l_selectStick_0.CFrame + (0.5 * (l_selectArrow_0.Size.z + l_selectStick_0.Size.z)) * l_selectStick_0.CFrame.LookVector;
        v61.windhoseSimulation.cone.CFrame = CFrame.fromEulerAnglesYXZ(0, v61.spinY, 0) * CFrame.fromEulerAnglesYXZ(v61.spinX, 0, 0);
        if v61.windhoseSimulation.physicallyAnimate then
            v61.windhoseSimulation.cone.CFrame = CFrame.lookAt(-5 * l_selectArrow_0.CFrame.LookVector, -10 * l_selectArrow_0.Position);
        end;
        local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
        if (((l_isChangingPitch_0 or l_isScaling_0) or l_isHoveringOverArrow_0) or l_isHoveringOverStick_0) or not l_isHoveringOverRing_0 and not l_isChangingYaw_0 then
            l_selectRing_0.Size = v61.selectRingOrigSize;
            l_selectRing_0.Transparency = 0.2;
        else
            l_selectRing_0.Size = v61.selectRingOrigSize + Vector3.new(0.05, 0.05, 0.05);
            l_selectRing_0.Transparency = 0;
        end;
        if (l_isChangingYaw_0 or l_isScaling_0) or not l_isHoveringOverStick_0 and not l_isChangingPitch_0 then
            l_selectStick_0.Size = v61.selectStickOrigSize + Vector3.new(0.05, 0.05, -0.75);
            l_selectStick_0.Transparency = 0.2;
        else
            l_selectStick_0.Size = v61.selectStickOrigSize + Vector3.new(0.1, 0.1, -0.75);
            l_selectStick_0.Transparency = 0;
        end;
        l_selectStick_0.Size = Vector3.new(l_selectStick_0.Size.x, l_selectStick_0.Size.y, l_selectStick_0.Size.z * v61.windScaleFactor);
        if (l_isChangingYaw_0 or l_isScaling_0) or not l_isHoveringOverStick_0 and not l_isChangingPitch_0 then
            l_selectArrow_0.Size = v61.selectArrowOrigSize;
            l_selectArrow_0.Transparency = 0.2;
            v61.windScaleFactor = 1;
        else
            l_selectArrow_0.Size = v61.selectArrowOrigSize + Vector3.new(0.05, 0.05, 0.05);
            l_selectArrow_0.Transparency = 0;
        end;
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        l_viewportCamera_0.CFrame = CFrame.fromMatrix(-l_CFrame_0.LookVector * v4.cameraDistance + Vector3.new(0, -0.5, 0), l_CFrame_0.RightVector, l_CFrame_0.UpVector, -l_CFrame_0.LookVector);
        if l_viewportCamera_0.CFrame ~= v61.cameraCFrame then
            v61.cameraCFrame = l_viewportCamera_0.CFrame;
            v61.viewport.LightDirection = (v61.cameraCFrame - v61.cameraCFrame.Position):ToWorldSpace(CFrame.new(-1, -1, -1)).Position;
        end;
        return ;
    end;
end;
v10.setEnabled = function(v75, v76)
    local function v78(v77)
        v75:onInputChanged(v77);
    end;
    local function v80(v79)
        v75:onInputEnded(v79);
    end;
    if v75.inputChangedConnection ~= nil then
        v75.inputChangedConnection:Disconnect();
    end;
    if v75.inputEndedConnection ~= nil then
        v75.inputEndedConnection:Disconnect();
    end;
    if not v76 or not v75.initSucceded then
        l_RunService_0:UnbindFromRenderStep("WindControlAfterCamera");
        if v75.windhoseSimulation ~= nil then
            v75.windhoseSimulation:destroy();
            v75.windhoseSimulation = nil;
        end;
        return ;
    else
        v75.windhoseSimulation = v6();
        v75.windhoseSimulation:init(v75.worldModel);
        v75.lastTick = tick();
        l_RunService_0:BindToRenderStep("WindControlAfterCamera", Enum.RenderPriority.Camera.Value + 1, function(v81)
            v75:afterCamera(v81);
        end);
        v75.inputChangedConnection = l_UserInputService_0.InputChanged:connect(v78);
        v75.inputEndedConnection = l_UserInputService_0.InputEnded:connect(v80);
        return ;
    end;
end;
return v10;
