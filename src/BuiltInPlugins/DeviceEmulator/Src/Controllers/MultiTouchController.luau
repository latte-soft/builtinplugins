local v0 = require(script.Parent.Parent.Parent.Packages.Framework);
local l_ServiceWrapper_0 = v0.TestHelpers.ServiceWrapper;
local v2 = v0.ContextServices.ContextItem:extend("MultiTouchController");
v2.new = function(v3)
    local v4 = setmetatable({
        _studioDeviceEmulatorService = l_ServiceWrapper_0.new("StudioDeviceEmulatorService", v3), 
        _screenGui = nil, 
        _pivot = nil, 
        _touches = {}, 
        _connectingLines = {}, 
        _mock = v3
    }, v2);
    v4._screenGui = v4:initScreenGui();
    v4._pivot = v4:makeNewPivotCircle();
    for v5 = 1, v4._studioDeviceEmulatorService:asService():GetMaxNumTouches() do
        v4._touches[v5] = v4:makeNewControlCircle();
        v4._connectingLines[v5] = v4:makeNewConnectingLine();
    end;
    if not v3 then
        v4._isMultiTouchEnabledChanged = v4._studioDeviceEmulatorService:asInstance():GetPropertyChangedSignal("IsMultiTouchEnabled"):Connect(function()
            if not v4._studioDeviceEmulatorService:asService().IsMultiTouchEnabled then
                v4._screenGui.Enabled = false;
                return ;
            else
                v4._screenGui.Enabled = true;
                v4:updateControlCirclePos(v4._pivot, v4._studioDeviceEmulatorService:asService().PivotPosition);
                for v6 = 1, #v4._touches do
                    v4:updateControlCirclePos(v4._touches[v6], v4._studioDeviceEmulatorService:asService():GetTouchPosition(v6 - 1));
                    v4:updateConnectingLine(v4._connectingLines[v6], v4._touches[v6]);
                end;
                return ;
            end;
        end);
        v4._pivotPositionChanged = v4._studioDeviceEmulatorService:asInstance():GetPropertyChangedSignal("PivotPosition"):Connect(function()
            v4:updateControlCirclePos(v4._pivot, v4._studioDeviceEmulatorService:asService().PivotPosition);
            for v7 = 1, #v4._touches do
                v4:updateConnectingLine(v4._connectingLines[v7], v4._touches[v7]);
            end;
        end);
        v4._touchPositionsChanged = v4._studioDeviceEmulatorService:asService().TouchPositionsChanged:Connect(function()
            for v8 = 1, #v4._touches do
                v4:updateControlCirclePos(v4._touches[v8], v4._studioDeviceEmulatorService:asService():GetTouchPosition(v8 - 1));
                v4:updateConnectingLine(v4._connectingLines[v8], v4._touches[v8]);
            end;
        end);
        v4._touchInBoundsChanged = v4._studioDeviceEmulatorService:asService().TouchInBoundsChanged:Connect(function()
            for v9 = 1, #v4._touches do
                v4:updateControlCircleColor(v4._touches[v9], v4._studioDeviceEmulatorService:asService():GetTouchInBounds(v9 - 1));
            end;
        end);
    end;
    return v4;
end;
v2.mock = function()
    return v2.new(true);
end;
v2.destroy = function(v10)
    if not v10._mock then
        v10._isMultiTouchEnabledChanged:Disconnect();
        v10._pivotPositionChanged:Disconnect();
        v10._touchPositionsChanged:Disconnect();
        v10._touchInBoundsChanged:Disconnect();
    end;
    if v10._screenGui then
        v10._screenGui:Destroy();
    end;
    v10._studioDeviceEmulatorService:destroy();
end;
v2.initScreenGui = function(_)
    local l_MultiTouchScreenGui_0 = game.CoreGui:FindFirstChild("MultiTouchScreenGui");
    if not l_MultiTouchScreenGui_0 then
        l_MultiTouchScreenGui_0 = Instance.new("ScreenGui");
        l_MultiTouchScreenGui_0.Name = "MultiTouchScreenGui";
        l_MultiTouchScreenGui_0.IgnoreGuiInset = true;
        l_MultiTouchScreenGui_0.Enabled = false;
        l_MultiTouchScreenGui_0.Parent = game.CoreGui;
        return l_MultiTouchScreenGui_0;
    else
        l_MultiTouchScreenGui_0:ClearAllChildren();
        return l_MultiTouchScreenGui_0;
    end;
end;
v2.makeNewControlCircle = function(v13)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Size = UDim2.new(0.05, 0, 0.05, 0);
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_0.BackgroundTransparency = 0.5;
    l_Frame_0.Parent = v13._screenGui;
    local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_0.AspectRatio = 1;
    l_UIAspectRatioConstraint_0.Parent = l_Frame_0;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(1, 0);
    l_UICorner_0.Parent = l_Frame_0;
    local l_UIStroke_0 = Instance.new("UIStroke");
    l_UIStroke_0.Transparency = 0.5;
    l_UIStroke_0.Parent = l_Frame_0;
    return l_Frame_0;
end;
v2.makeNewPivotCircle = function(v18)
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Parent = v18._screenGui;
    l_Frame_1.Size = UDim2.new(0.01, 0, 0.01, 0);
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_1.BackgroundTransparency = 0.5;
    local l_UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_1.AspectRatio = 1;
    l_UIAspectRatioConstraint_1.Parent = l_Frame_1;
    local l_UICorner_1 = Instance.new("UICorner");
    l_UICorner_1.CornerRadius = UDim.new(1, 0);
    l_UICorner_1.Parent = l_Frame_1;
    return l_Frame_1;
end;
v2.makeNewConnectingLine = function(v22)
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Parent = v22._screenGui;
    l_Frame_2.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    return l_Frame_2;
end;
v2.updateControlCirclePos = function(_, v25, v26)
    v25.Position = UDim2.new(0, v26.x, 0, v26.y);
end;
v2.updateControlCircleColor = function(_, v28, v29)
    if not v29 then
        v28.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
        return ;
    else
        v28.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
        return ;
    end;
end;
v2.updateConnectingLine = function(v30, v31, v32)
    local l_Offset_0 = v30._pivot.Position.X.Offset;
    local l_Offset_1 = v30._pivot.Position.Y.Offset;
    local l_Offset_2 = v32.Position.X.Offset;
    local l_Offset_3 = v32.Position.Y.Offset;
    v31.Size = UDim2.new(0, math.sqrt((l_Offset_2 - l_Offset_0) ^ 2 + (l_Offset_3 - l_Offset_1) ^ 2), 0, 0.5);
    v31.Position = UDim2.new(0, (l_Offset_0 + l_Offset_2) / 2, 0, (l_Offset_1 + l_Offset_3) / 2);
    v31.Rotation = math.deg((math.atan2(l_Offset_3 - l_Offset_1, l_Offset_2 - l_Offset_0)));
end;
return v2;
