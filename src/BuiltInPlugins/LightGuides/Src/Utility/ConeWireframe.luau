local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Utility.Constants);
local v3 = require(l_Parent_0.Src.Flags.getFFlagLightGuidesSupportNestedAttachments)();
local v4 = {
    [Enum.NormalId.Back] = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), (Vector3.new(0, 0, 1))), 
    [Enum.NormalId.Front] = CFrame.fromMatrix(Vector3.new(), Vector3.new(-1, 0, 0), Vector3.new(0, 1, 0), (Vector3.new(0, 0, -1))), 
    [Enum.NormalId.Right] = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, -1), Vector3.new(0, 1, 0), (Vector3.new(1, 0, 0))), 
    [Enum.NormalId.Left] = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1), Vector3.new(0, 1, 0), (Vector3.new(-1, 0, 0))), 
    [Enum.NormalId.Bottom] = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0), Vector3.new(0, 0, 1), (Vector3.new(0, -1, 0))), 
    [Enum.NormalId.Top] = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0), Vector3.new(0, 0, -1), (Vector3.new(0, 1, 0)))
};
local l_THICKNESS_0 = v2.THICKNESS;
local l_TRANSPARENCY_0 = v2.TRANSPARENCY;
local v7 = {};
v7.__index = v7;
v7.new = function()
    return (setmetatable({
        _adornee = nil, 
        _parent = nil, 
        _light = nil, 
        _handlesFolder = Instance.new("Folder"), 
        _guidesFolder = nil, 
        _handles = {}, 
        _handlesPresent = false, 
        _listener = nil, 
        _attachmentListener = nil
    }, v7));
end;
v7.render = function(v8)
    v8:_setListeners();
    if v8:_setAncestry() then
        if not v8._handlesPresent then
            v8:_setHandles();
        end;
        local l_Enabled_0 = v8._light.Enabled;
        local l_Range_0 = v8._light.Range;
        local v11 = math.rad(v8._light.Angle);
        local l_Color_0 = v8._light.Color;
        local v13 = l_Range_0 * math.sin(v11 / 2);
        local v14 = l_Range_0 * math.cos(v11 / 2);
        local l_Spot_0 = v8._handles.Spot;
        local l_Left_0 = v8._handles.Left;
        local l_Right_0 = v8._handles.Right;
        local l_Top_0 = v8._handles.Top;
        local l_Bottom_0 = v8._handles.Bottom;
        local l_Center_0 = v8._handles.Center;
        l_Spot_0.Adornee = v8._adornee;
        l_Spot_0.Radius = v13;
        l_Spot_0.InnerRadius = v13 - l_THICKNESS_0;
        l_Spot_0.Visible = l_Enabled_0;
        l_Spot_0.Color3 = l_Color_0;
        l_Left_0.Height = l_Range_0;
        l_Left_0.Adornee = v8._adornee;
        l_Left_0.Visible = l_Enabled_0;
        l_Left_0.Color3 = l_Color_0;
        l_Right_0.Height = l_Range_0;
        l_Right_0.Adornee = v8._adornee;
        l_Right_0.Visible = l_Enabled_0;
        l_Right_0.Color3 = l_Color_0;
        l_Top_0.Height = l_Range_0;
        l_Top_0.Adornee = v8._adornee;
        l_Top_0.Visible = l_Enabled_0;
        l_Top_0.Color3 = l_Color_0;
        l_Bottom_0.Height = l_Range_0;
        l_Bottom_0.Adornee = v8._adornee;
        l_Bottom_0.Visible = l_Enabled_0;
        l_Bottom_0.Color3 = l_Color_0;
        l_Center_0.Height = l_Range_0;
        l_Center_0.Adornee = v8._adornee;
        l_Center_0.Visible = l_Enabled_0;
        l_Center_0.Color3 = l_Color_0;
        v8:_setCFrameValues(v4[v8._light.Face], v13, l_Range_0, v14, v11);
        return ;
    else
        return ;
    end;
end;
v7.pool = function(v21)
    assert(v21._handlesFolder, "Wireframe already pooled");
    assert(v21._light, "Wireframe already pooled");
    v21._handlesFolder.Name = "pooled";
    v21._handlesFolder.Parent = nil;
    v21._light = nil;
    v21:_removeListeners();
    return v21;
end;
v7.adorn = function(v22, v23)
    assert(v23, "Can't adorn nil");
    assert(not v22._light, "Wireframe already adorned");
    v22._light = v23;
    v22._handlesFolder.Name = v23.name;
    v22._handlesFolder.Parent = v22._guidesFolder;
    local l_Parent_1 = v23.Parent;
    if not l_Parent_1 or not l_Parent_1:IsA("Attachment") then
        v22._adornee = l_Parent_1;
        v22._parent = l_Parent_1;
    else
        v22._adornee = l_Parent_1.Parent;
        v22._offset = l_Parent_1.CFrame;
        v22._parent = l_Parent_1;
    end;
    v22:_setListeners();
    return v22;
end;
v7.destroy = function(v25)
    v25:_removeHandles();
    v25:_removeListeners();
    v25._handlesFolder:Destroy();
    v25._handlesFolder = nil;
end;
v7.setGuidesFolder = function(v26, v27)
    v26._guidesFolder = v27;
end;
v7._setAncestry = function(v28)
    local l_Parent_2 = v28._light.Parent;
    local v30 = CFrame.new((Vector3.new()));
    if l_Parent_2 then
        assert(l_Parent_2, "Cone Wireframe should have valid Adornee.");
        if not v3 then
            if l_Parent_2:IsA("Attachment") then
                l_Parent_2 = v28._light.Parent.Parent;
                v30 = v28._light.Parent.CFrame;
                if l_Parent_2:IsA("Attachment") then
                    v28:_removeHandles();
                    return false;
                end;
            end;
            if not (not (not v28._light.Parent:IsA("Attachment") and not v28._light.Parent:IsA("BasePart")) and not l_Parent_2:IsA("Attachment")) then
                v28:_removeHandles();
                return false;
            end;
        else
            if l_Parent_2:IsA("Attachment") then
                l_Parent_2 = v28._light.Parent.Parent;
                v30 = v28._light.Parent.CFrame;
                while l_Parent_2:IsA("Attachment") do
                    v30 = l_Parent_2.CFrame * v30;
                    l_Parent_2 = l_Parent_2.Parent;
                end;
            end;
            if not (l_Parent_2:IsA("Attachment") or l_Parent_2:IsA("BasePart")) then
                v28:_removeHandles();
                return false;
            end;
        end;
        v28._adornee = l_Parent_2;
        v28._offset = v30;
        v28._parent = v28._light.Parent;
        return true;
    else
        return false;
    end;
end;
v7._setCFrameValues = function(v31, v32, v33, v34, v35, v36)
    if v31._handles then
        local v37 = v33 / 2;
        local v38 = v35 / 2;
        local v39 = v34 / 2;
        local v40 = v36 / 2;
        v31._handles.Spot.CFrame = v31._offset * (v32 * CFrame.new(0, 0, v35));
        v31._handles.Left.CFrame = v31._offset * ((v32 * CFrame.new(v37, 0, v38)) * CFrame.Angles(0, v40, 0));
        v31._handles.Right.CFrame = v31._offset * ((v32 * CFrame.new(-v37, 0, v38)) * CFrame.Angles(0, -v40, 0));
        v31._handles.Top.CFrame = v31._offset * ((v32 * CFrame.new(0, v37, v38)) * CFrame.Angles(-v40, 0, 0));
        v31._handles.Bottom.CFrame = v31._offset * ((v32 * CFrame.new(0, -v37, v38)) * CFrame.Angles(v40, 0, 0));
        v31._handles.Center.CFrame = v31._offset * (v32 * CFrame.new(0, 0, v39));
    end;
end;
v7._setHandles = function(v41)
    local l_CylinderHandleAdornment_0 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_0.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_0.Height = l_THICKNESS_0;
    l_CylinderHandleAdornment_0.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_0.Parent = v41._handlesFolder;
    local l_CylinderHandleAdornment_1 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_1.Radius = l_THICKNESS_0 / 2;
    l_CylinderHandleAdornment_1.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_1.Parent = v41._handlesFolder;
    local l_CylinderHandleAdornment_2 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_2.Radius = l_THICKNESS_0 / 2;
    l_CylinderHandleAdornment_2.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_2.Parent = v41._handlesFolder;
    local l_CylinderHandleAdornment_3 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_3.Radius = l_THICKNESS_0 / 2;
    l_CylinderHandleAdornment_3.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_3.Parent = v41._handlesFolder;
    local l_CylinderHandleAdornment_4 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_4.Radius = l_THICKNESS_0 / 2;
    l_CylinderHandleAdornment_4.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_4.Parent = v41._handlesFolder;
    local l_CylinderHandleAdornment_5 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_5.Radius = l_THICKNESS_0 / 2;
    l_CylinderHandleAdornment_5.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_5.Parent = v41._handlesFolder;
    v41._handles.Spot = l_CylinderHandleAdornment_0;
    v41._handles.Left = l_CylinderHandleAdornment_1;
    v41._handles.Right = l_CylinderHandleAdornment_2;
    v41._handles.Top = l_CylinderHandleAdornment_3;
    v41._handles.Bottom = l_CylinderHandleAdornment_4;
    v41._handles.Center = l_CylinderHandleAdornment_5;
    v41._handlesPresent = true;
end;
v7._removeHandles = function(v48)
    if not (not v48._handles or not v48._handlesPresent) then
        v48._handles.Spot:Destroy();
        v48._handles.Left:Destroy();
        v48._handles.Right:Destroy();
        v48._handles.Top:Destroy();
        v48._handles.Bottom:Destroy();
        v48._handles.Center:Destroy();
        v48._handlesPresent = false;
    end;
end;
v7._setListeners = function(v49)
    if not v3 then
        if not v49._listener then
            v49._listener = v49._light.Changed:Connect(function()
                v49:render();
            end);
        end;
        if not (v49._attachmentListener or not v49._parent:IsA("Attachment")) then
            v49._attachmentListener = v49._parent:GetPropertyChangedSignal("CFrame"):Connect(function()
                v49:render();
            end);
        end;
    else
        if not v49._listener then
            v49._listener = v49._light.Changed:Connect(function()
                v49:render();
            end);
        end;
        if not (v49._attachmentListeners or not v49._parent:IsA("Attachment")) then
            v49._attachmentListeners = {};
            local l__parent_0 = v49._parent;
            while l__parent_0:IsA("Attachment") do
                table.insert(v49._attachmentListeners, l__parent_0:GetPropertyChangedSignal("CFrame"):Connect(function()
                    v49:render();
                end));
                table.insert(v49._attachmentListeners, l__parent_0:GetPropertyChangedSignal("Parent"):Connect(function()
                    v49:_removeListeners();
                    v49:_setListeners();
                    v49:render();
                end));
                l__parent_0 = l__parent_0.Parent;
            end;
        end;
    end;
end;
v7._removeListeners = function(v51)
    if not v3 then
        if v51._listener then
            v51._listener:Disconnect();
        end;
        if v51._attachmentListener then
            v51._attachmentListener:Disconnect();
        end;
        v51._listener = nil;
        v51._attachmentListener = nil;
    else
        if v51._listener then
            v51._listener:Disconnect();
            v51._listener = nil;
        end;
        if v51._attachmentListeners then
            for _, v53 in v51._attachmentListeners, nil, nil do
                v53:Disconnect();
            end;
            v51._attachmentListeners = nil;
            return ;
        end;
    end;
end;
return v7;
