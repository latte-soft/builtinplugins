local v0 = {};
local v1 = require(script.Parent.CoreGuiManager);
local v2 = require(script.Parent.Enum.Direction);
local v3 = require(script.Parent.MouseIconManager);
local v4 = require(script.Parent.SelectionManager);
local v5 = require(script.Parent.Utility);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v7 = nil;
local v8 = nil;
local _ = {};
local v10 = {};
local v11 = false;
local v12 = 0;
local v13 = 0;
local v14 = 0;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = {};
local function v19()
    v17 = Instance.new("Frame");
    v17.Name = "UIEditorRotationHandleParent";
    v17.BackgroundTransparency = 1;
    v17.BackgroundColor3 = Color3.new(0, 0, 255);
    v17.BorderSizePixel = 0;
    v17.Parent = v1:findOrCreateScreenGui("RotationHandles");
end;
local function _()
    if v17 then
        v17:Destroy();
    end;
end;
local function _(v21)
    v10[v21] = true;
end;
local function _(v23)
    v10[v23] = false;
end;
local function _()
    local l_NOT_SET_0 = v2.NOT_SET;
    for v26 = v2.FIRST, v2.LAST do
        if v10[v26] then
            return v26;
        end;
    end;
    return l_NOT_SET_0;
end;
local function _()
    for v28 = v2.FIRST, v2.LAST do
        v10[v28] = false;
    end;
end;
local function v38()
    if not v17 then
        error("Could not create the rotation handles because the parent was nil.");
    end;
    local v30 = {
        [v2.E] = Vector2.new(0, 0.5), 
        [v2.SE] = Vector2.new(0, 0), 
        [v2.S] = Vector2.new(0.5, 0), 
        [v2.SW] = Vector2.new(1, 0), 
        [v2.W] = Vector2.new(1, 0.5), 
        [v2.NW] = Vector2.new(1, 1), 
        [v2.N] = Vector2.new(0.5, 1), 
        [v2.NE] = Vector2.new(0, 1)
    };
    local v31 = {
        [v2.E] = UDim2.new(1, 0, 0.5, 0), 
        [v2.SE] = UDim2.new(1, 0, 1, 0), 
        [v2.S] = UDim2.new(0.5, 0, 1, 0), 
        [v2.SW] = UDim2.new(0, 0, 1, 0), 
        [v2.W] = UDim2.new(0, 0, 0.5, 0), 
        [v2.NW] = UDim2.new(0, 0, 0, 0), 
        [v2.N] = UDim2.new(0.5, 0, 0, 0), 
        [v2.NE] = UDim2.new(1, 0, 0, 0)
    };
    for v32 = v2.FIRST, v2.LAST do
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = "RotationHandle_" .. v2:toShortName(v32);
        l_Frame_0.AnchorPoint = v30[v32];
        l_Frame_0.Size = UDim2.new(0, 20, 0, 20);
        l_Frame_0.Position = v31[v32];
        l_Frame_0.BackgroundColor3 = Color3.new(0, 255, 0);
        l_Frame_0.BackgroundTransparency = 1;
        l_Frame_0.BorderSizePixel = 0;
        l_Frame_0.MouseEnter:connect(function(_, _)
            v10[v32] = true;
        end);
        l_Frame_0.MouseLeave:connect(function(_, _)
            v10[v32] = false;
        end);
        l_Frame_0.Parent = v17;
        v18[v32] = l_Frame_0;
    end;
end;
local function _()
    v19();
    v38();
end;
v0.getRotation = function(_)
    if v8 then
        return v8.AbsoluteRotation;
    else
        return 0;
    end;
end;
v0.updateMouseIcon = function(_)
    if not v11 then
        local l_NOT_SET_1 = v2.NOT_SET;
        for v43 = v2.FIRST, v2.LAST do
            if v10[v43] then
                l_NOT_SET_1 = v43;
                break;
            end;
        end;
        local l_l_NOT_SET_1_0 = l_NOT_SET_1;
        if l_l_NOT_SET_1_0 ~= v2.NOT_SET then
            v3:setToRotateIcon((v3:calcMouseIconDirection(l_l_NOT_SET_1_0, v8.AbsoluteRotation)));
        end;
        return ;
    else
        return ;
    end;
end;
v0.isOverAHandle = function(_)
    local l_NOT_SET_2 = v2.NOT_SET;
    for v47 = v2.FIRST, v2.LAST do
        if v10[v47] then
            l_NOT_SET_2 = v47;
            break;
        end;
    end;
    return l_NOT_SET_2 ~= v2.NOT_SET;
end;
local function _(v48)
    return Vector2.new(v48.AbsolutePosition.X + math.floor(v48.AbsoluteSize.X / 2), v48.AbsolutePosition.Y + math.floor(v48.AbsoluteSize.Y / 2));
end;
v0.onMouseDown = function(_, v51)
    if v8 then
        local l_NOT_SET_3 = v2.NOT_SET;
        for v53 = v2.FIRST, v2.LAST do
            if v10[v53] then
                l_NOT_SET_3 = v53;
                break;
            end;
        end;
        if v2:isValid(l_NOT_SET_3) then
            v11 = true;
            v12 = v8.Rotation;
            v13 = v8.Rotation;
            local l_v8_0 = v8;
            v15 = Vector2.new(l_v8_0.AbsolutePosition.X + math.floor(l_v8_0.AbsoluteSize.X / 2), l_v8_0.AbsolutePosition.Y + math.floor(l_v8_0.AbsoluteSize.Y / 2));
            v14 = 0;
            v16 = v51 - v15;
            v7:onRotateBegan(v51);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function _(v55)
    return (math.floor(v55 + 0.5));
end;
local function _(v57)
    if v57 >= 0 then
        return v57 % 360;
    else
        return -(-v57 % 360);
    end;
end;
v0.onMouseMove = function(_, v60)
    if v11 then
        local v61 = v60 - v15;
        v14 = v14 + math.deg((v5:angleVector2(v16, v61)));
        local v62 = math.floor((v13 + v14) + 0.5);
        v8.Rotation = if v62 >= 0 then v62 % 360 else -(-v62 % 360);
        v16 = v61;
        if math.abs(v14) > 90 then
            v13 = v8.Rotation;
            v14 = 0;
        end;
        v0:update();
        v7:onRotateChanged(v60);
        return ;
    else
        return ;
    end;
end;
v0.onMouseUp = function(_, v64)
    if v11 then
        if v8.Rotation ~= v12 then
            l_ChangeHistoryService_0:SetWaypoint("Rotate object");
        end;
        v11 = false;
        v15 = nil;
        v16 = nil;
        v0:update();
        v7:onRotateEnded(v64);
        return ;
    else
        return ;
    end;
end;
v0.isRotating = function(_)
    return v11;
end;
v0.update = function(_)
    if v8 then
        v17.AnchorPoint = v8.AnchorPoint;
        local l_AbsolutePosition_0 = v8.AbsolutePosition;
        v17.Position = UDim2.new(0, l_AbsolutePosition_0.X, 0, l_AbsolutePosition_0.Y);
        local l_AbsoluteSize_0 = v8.AbsoluteSize;
        v17.Size = UDim2.new(0, l_AbsoluteSize_0.X, 0, l_AbsoluteSize_0.Y);
        v17.Rotation = v8.AbsoluteRotation;
        return ;
    else
        return ;
    end;
end;
v0.onSelectionChanged = function(_)
    local v70 = v4:getFilteredSelection();
    if #v70 == 1 then
        v8 = v70[1];
        v0:update();
        v17.Visible = true;
        return ;
    else
        v8 = nil;
        v17.Visible = false;
        return ;
    end;
end;
v0.On = function(_)
    v19();
    v38();
    for v72 = v2.FIRST, v2.LAST do
        v10[v72] = false;
    end;
    v11 = false;
    v0:update();
end;
v0.Off = function(_)
    if v17 then
        v17:Destroy();
    end;
    v11 = false;
end;
v0.setActionMediator = function(_, v75)
    v7 = v75;
end;
return v0;
