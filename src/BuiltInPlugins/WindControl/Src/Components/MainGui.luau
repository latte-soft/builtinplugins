local l_CoreGui_0 = game:GetService("CoreGui");
local l_InsertService_0 = game:GetService("InsertService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.ReactRoblox);
local v5 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v5.Style.Stylizer;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Pane_0 = v5.UI.Pane;
local v10 = require(script.Parent.Windhose);
local v11 = require(script.Parent.WindspeedDisplay);
local v12 = v3.PureComponent:extend("MainGui");
v12.init = function(v13)
    v13.cameraRef = v3.createRef();
    v13.viewportRef = v3.createRef();
    v13.textLabelRef = v3.createRef();
    v13.windhose = v10();
    v13:setState({
        windspeed = workspace.GlobalWind.Magnitude, 
        windDirection = workspace.GlobalWind.Unit, 
        isChangingPitch = false, 
        isChangingYaw = false
    });
    v13.onWindChanged = function()
        if not (not v13.windhose or not v13.windhose.selectStick) then
            v13:setState({
                windspeed = workspace.GlobalWind.Magnitude, 
                windDirection = v13.windhose.selectStick.CFrame.LookVector
            });
        end;
    end;
    v13.onisChangingPitchChanged = function(v14)
        v13:setState({
            isChangingPitch = v14
        });
    end;
    v13.onisChangingYawChanged = function(v15)
        v13:setState({
            isChangingYaw = v15
        });
    end;
    v13.onYawStateRequested = function()
        v13:setState({
            isChangingYaw = false, 
            isChangingPitch = true
        });
    end;
    v13.onPitchStateRequested = function()
        v13:setState({
            isChangingYaw = true, 
            isChangingPitch = false
        });
    end;
    v13.onSpeedStateRequested = function()
        v13:setState({
            isChangingYaw = false, 
            isChangingPitch = false
        });
    end;
end;
v12.loadPosition = function(v16)
    local v17 = v16.props.Plugin:get();
    local v18 = v16.viewportRef:getValue();
    if not (not v17 or not v18) then
        local l_X_0 = v18.AbsoluteSize.X;
        local function _(v20, v21)
            local v22 = game.Workspace.CurrentCamera.ViewportSize[v20];
            local v23 = 0.5;
            local v24 = 0.5;
            if l_X_0 < v22 then
                v23 = v17:GetSetting("WindControl_Position" .. v20) or v21;
                v24 = (v23 * (v22 - l_X_0) + v23 * l_X_0) / v22;
            end;
            return v23, v24;
        end;
        local l_X_1 = game.Workspace.CurrentCamera.ViewportSize.X;
        local v27 = 0.5;
        local v28 = 0.5;
        if l_X_0 < l_X_1 then
            v27 = v17:GetSetting("WindControl_Position" .. "X") or 1;
            v28 = (v27 * (l_X_1 - l_X_0) + v27 * l_X_0) / l_X_1;
        end;
        local l_v27_0 = v27;
        local l_v28_0 = v28;
        v28 = game.Workspace.CurrentCamera.ViewportSize.Y;
        local v31 = 0.5;
        local v32 = 0.5;
        if l_X_0 < v28 then
            v31 = v17:GetSetting("WindControl_Position" .. "Y") or 0;
            v32 = (v31 * (v28 - l_X_0) + v31 * l_X_0) / v28;
        end;
        l_X_1 = v31;
        v27 = v32;
        v18.AnchorPoint = Vector2.new(l_v27_0, l_X_1);
        v18.Position = UDim2.fromScale(l_v28_0, v27);
    end;
end;
v12.clampAndSavePosition = function(v33)
    local v34 = v33.props.Plugin:get();
    local v35 = v33.viewportRef:getValue();
    if not (not v34 or not v35) then
        local l_X_2 = v35.AbsoluteSize.X;
        local function _(v37)
            local v38 = game.Workspace.CurrentCamera.ViewportSize[v37];
            local v39 = 0.5;
            local v40 = 0.5;
            if l_X_2 < v38 then
                local v41 = math.clamp(v35.AbsolutePosition[v37], 0, v38 - l_X_2);
                v39 = v41 / (v38 - l_X_2);
                v40 = (v41 + v39 * l_X_2) / v38;
            end;
            v34:SetSetting("WindControl_Position" .. v37, v39);
            return v39, v40;
        end;
        local l_X_3 = game.Workspace.CurrentCamera.ViewportSize.X;
        local v44 = 0.5;
        local v45 = 0.5;
        if l_X_2 < l_X_3 then
            local v46 = math.clamp(v35.AbsolutePosition.X, 0, l_X_3 - l_X_2);
            v44 = v46 / (l_X_3 - l_X_2);
            v45 = (v46 + v44 * l_X_2) / l_X_3;
        end;
        v34:SetSetting("WindControl_Position" .. "X", v44);
        local l_v44_0 = v44;
        local l_v45_0 = v45;
        v45 = game.Workspace.CurrentCamera.ViewportSize.Y;
        local v49 = 0.5;
        local v50 = 0.5;
        if l_X_2 < v45 then
            local v51 = math.clamp(v35.AbsolutePosition.Y, 0, v45 - l_X_2);
            v49 = v51 / (v45 - l_X_2);
            v50 = (v51 + v49 * l_X_2) / v45;
        end;
        v34:SetSetting("WindControl_Position" .. "Y", v49);
        l_X_3 = v49;
        v44 = v50;
        v35.AnchorPoint = Vector2.new(l_v44_0, l_X_3);
        v35.Position = UDim2.fromScale(l_v45_0, v44);
    end;
end;
v12.loadWindControl = function(v52)
    coroutine.wrap(function()
        local v53 = nil;
        if v52.mounted then
            pcall(function()
                v53 = l_InsertService_0:LoadLocalAsset("rbxasset://models/WindControl/windhose.rbxm");
            end);
            if v53 == nil then
                return ;
            else
                v52.windControlModel = v53;
                if v52.viewportRef:getValue() then
                    v52.windControlModel.Parent = v52.viewportRef:getValue();
                    v52.windhose:init(v52.windControlModel, v52.cameraRef:getValue(), v52.viewportRef:getValue(), v52.onWindChanged, nil, v52.onYawStateRequested, v52.onPitchStateRequested);
                    v52.windhose:setEnabled(true);
                end;
                v52.loaded = true;
                return ;
            end;
        else
            return ;
        end;
    end)();
end;
v12.unloadWindControl = function(v54)
    if v54.mounted then
        v54.windhose:setEnabled(false);
        if v54.windControlModel ~= nil then
            v54.windControlModel:Destroy();
            v54.windControlModel = nil;
        end;
    end;
end;
v12.render = function(v55)
    local l_MainGui_0 = v55.props.Stylizer.MainGui;
    return v4.createPortal({
        WindControl = v3.createElement("Folder", {}, {
            Screengui = v3.createElement("ScreenGui", {}, {
                ViewportFrame = v3.createElement("ViewportFrame", {
                    ZIndex = 1, 
                    Size = l_MainGui_0.ViewportFrame.Size, 
                    Position = l_MainGui_0.ViewportFrame.Position, 
                    CurrentCamera = v55.cameraRef, 
                    BackgroundTransparency = 1, 
                    ref = v55.viewportRef
                }, {
                    Background = v3.createElement(l_Pane_0, l_MainGui_0.BackgroundPane), 
                    Camera = v3.createElement("Camera", {
                        CameraType = Enum.CameraType.Scriptable, 
                        CFrame = CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(0, 0, 0))), 
                        FieldOfView = l_MainGui_0.CameraFOV, 
                        ref = v55.cameraRef
                    }), 
                    ImageButton = v3.createElement("ImageButton", {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        [v3.Event.MouseEnter] = function()
                            v55.windhose:onMouseEnter();
                        end, 
                        [v3.Event.MouseLeave] = function()
                            v55.windhose:onMouseLeave();
                        end, 
                        [v3.Event.MouseButton1Down] = function(_, v58, v59)
                            v55.windhose:onMouseButton1Down(v58, v59);
                        end, 
                        [v3.Event.MouseMoved] = function(_, v61, v62)
                            v55.windhose:onMouseMove(v61, v62);
                        end
                    }), 
                    WindspeedDisplay = v3.createElement(v11, {
                        Windspeed = v55.state.windspeed, 
                        WindDirection = v55.state.windDirection, 
                        isChangingPitch = v55.state.isChangingPitch, 
                        isChangingYaw = v55.state.isChangingYaw, 
                        yawStateRequested = v55.onYawStateRequested, 
                        pitchStateRequested = v55.onPitchStateRequested, 
                        speedStateRequested = v55.onSpeedStateRequested
                    })
                })
            })
        })
    }, l_CoreGui_0);
end;
v12.didMount = function(v63)
    v63.mounted = true;
    v63:loadWindControl();
    v63:loadPosition();
end;
v12.willUnmount = function(v64)
    v64:unloadWindControl();
    v64:clampAndSavePosition();
end;
return (l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_Stylizer_0
})(v12));
