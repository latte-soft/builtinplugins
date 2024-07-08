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
        _sizeListener = nil, 
        _attachmentListener = nil
    }, v7));
end;
v7.render = function(v8)
    v8:_setListeners();
    if v8:_setAncestry() then
        if not v8._handlesPresent then
            v8:_setHandles();
        end;
        local v9 = Vector3.new();
        if v8._parent:IsA("BasePart") then
            v9 = v8._parent.Size;
        end;
        local l_Enabled_0 = v8._light.Enabled;
        local l_Color_0 = v8._light.Color;
        local l_Range_0 = v8._light.Range;
        local v13 = math.rad(v8._light.Angle);
        local v14 = l_Range_0 * math.cos(v13 / 2);
        local v15 = 2 * (l_Range_0 * math.sin(v13 / 2));
        local v16 = Vector3.fromNormalId(v8._light.Face);
        local l_magnitude_0 = (v9 * (CFrame.Angles(0, ((v16.Y - 1) * 3.141592653589793) / 2, (((v16.Z - 1) * (v16.X - 1)) * 3.141592653589793) / 2) * v16)).magnitude;
        local l_magnitude_1 = (v9 * (CFrame.Angles(((v16.X - 1) * 3.141592653589793) / 2, 0, (((v16.Z - 1) * (v16.Y - 1)) * 3.141592653589793) / 2) * v16)).magnitude;
        local v19 = l_magnitude_0 + v15;
        local v20 = l_magnitude_1 + v15;
        local l_magnitude_2 = (v9 * Vector3.fromNormalId(v8._light.Face)).magnitude;
        local v22 = math.sqrt((math.pow((v19 - l_magnitude_0) / 2, 2) + math.pow((v20 - l_magnitude_1) / 2, 2)) + math.pow(v14, 2));
        local l_innerTopOutline_0 = v8._handles.innerTopOutline;
        local l_innerBottomOutline_0 = v8._handles.innerBottomOutline;
        local l_innerLeftOutline_0 = v8._handles.innerLeftOutline;
        local l_innerRightOutline_0 = v8._handles.innerRightOutline;
        local l_outerTopOutline_0 = v8._handles.outerTopOutline;
        local l_outerBottomOutline_0 = v8._handles.outerBottomOutline;
        local l_outerLeftOutline_0 = v8._handles.outerLeftOutline;
        local l_outerRightOutline_0 = v8._handles.outerRightOutline;
        local l_topLeftOutline_0 = v8._handles.topLeftOutline;
        local l_topRightOutline_0 = v8._handles.topRightOutline;
        local l_bottomLeftOutline_0 = v8._handles.bottomLeftOutline;
        local l_bottomRightOutline_0 = v8._handles.bottomRightOutline;
        local l_centerOutline_0 = v8._handles.centerOutline;
        l_innerTopOutline_0.Height = l_magnitude_0;
        l_innerTopOutline_0.Adornee = v8._adornee;
        l_innerTopOutline_0.Visible = l_Enabled_0;
        l_innerTopOutline_0.Color3 = l_Color_0;
        l_innerBottomOutline_0.Height = l_magnitude_0;
        l_innerBottomOutline_0.Adornee = v8._adornee;
        l_innerBottomOutline_0.Visible = l_Enabled_0;
        l_innerBottomOutline_0.Color3 = l_Color_0;
        l_innerLeftOutline_0.Height = l_magnitude_1;
        l_innerLeftOutline_0.Adornee = v8._adornee;
        l_innerLeftOutline_0.Visible = l_Enabled_0;
        l_innerLeftOutline_0.Color3 = l_Color_0;
        l_innerRightOutline_0.Height = l_magnitude_1;
        l_innerRightOutline_0.Adornee = v8._adornee;
        l_innerRightOutline_0.Visible = l_Enabled_0;
        l_innerRightOutline_0.Color3 = l_Color_0;
        l_outerTopOutline_0.Height = v19;
        l_outerTopOutline_0.Adornee = v8._adornee;
        l_outerTopOutline_0.Visible = l_Enabled_0;
        l_outerTopOutline_0.Color3 = l_Color_0;
        l_outerBottomOutline_0.Height = v19;
        l_outerBottomOutline_0.Adornee = v8._adornee;
        l_outerBottomOutline_0.Visible = l_Enabled_0;
        l_outerBottomOutline_0.Color3 = l_Color_0;
        l_outerLeftOutline_0.Height = v20;
        l_outerLeftOutline_0.Adornee = v8._adornee;
        l_outerLeftOutline_0.Visible = l_Enabled_0;
        l_outerLeftOutline_0.Color3 = l_Color_0;
        l_outerRightOutline_0.Height = v20;
        l_outerRightOutline_0.Adornee = v8._adornee;
        l_outerRightOutline_0.Visible = l_Enabled_0;
        l_outerRightOutline_0.Color3 = l_Color_0;
        l_topLeftOutline_0.Height = v22;
        l_topLeftOutline_0.Adornee = v8._adornee;
        l_topLeftOutline_0.Visible = l_Enabled_0;
        l_topLeftOutline_0.Color3 = l_Color_0;
        l_topRightOutline_0.Height = v22;
        l_topRightOutline_0.Adornee = v8._adornee;
        l_topRightOutline_0.Visible = l_Enabled_0;
        l_topRightOutline_0.Color3 = l_Color_0;
        l_bottomLeftOutline_0.Height = v22;
        l_bottomLeftOutline_0.Adornee = v8._adornee;
        l_bottomLeftOutline_0.Visible = l_Enabled_0;
        l_bottomLeftOutline_0.Color3 = l_Color_0;
        l_bottomRightOutline_0.Height = v22;
        l_bottomRightOutline_0.Adornee = v8._adornee;
        l_bottomRightOutline_0.Visible = l_Enabled_0;
        l_bottomRightOutline_0.Color3 = l_Color_0;
        l_centerOutline_0.Height = l_Range_0;
        l_centerOutline_0.Adornee = v8._adornee;
        l_centerOutline_0.Visible = l_Enabled_0;
        l_centerOutline_0.Color3 = l_Color_0;
        v8:_setCFrameValues(v4[v8._light.Face], l_magnitude_0, l_magnitude_1, v19, v20, l_magnitude_2, l_Range_0, v14);
        return ;
    else
        return ;
    end;
end;
v7.pool = function(v36)
    assert(v36._handlesFolder, "Wireframe already pooled");
    assert(v36._light, "Wireframe already pooled");
    v36._handlesFolder.Name = "pooled";
    v36._handlesFolder.Parent = nil;
    v36._light = nil;
    v36:_removeListeners();
    return v36;
end;
v7.adorn = function(v37, v38)
    assert(v38, "Can't adorn nil");
    assert(not v37._light, "Wireframe already adorned");
    v37._light = v38;
    v37._handlesFolder.Name = v38.name;
    v37._handlesFolder.Parent = v37._guidesFolder;
    local l_Parent_1 = v38.Parent;
    if not l_Parent_1 or not l_Parent_1:IsA("Attachment") then
        v37._adornee = l_Parent_1;
        v37._parent = l_Parent_1;
    else
        v37._adornee = l_Parent_1.Parent;
        v37._offset = l_Parent_1.CFrame;
        v37._parent = l_Parent_1;
    end;
    v37:_setListeners();
    return v37;
end;
v7.destroy = function(v40)
    v40:_removeHandles();
    v40:_removeListeners();
    v40._handlesFolder:Destroy();
    v40._handlesFolder = nil;
end;
v7.setGuidesFolder = function(v41, v42)
    v41._guidesFolder = v42;
end;
v7._setAncestry = function(v43)
    local l_Parent_2 = v43._light.Parent;
    local v45 = CFrame.new((Vector3.new()));
    if l_Parent_2 then
        assert(l_Parent_2, "Trapezoidal Prism Wireframe should have valid Adornee.");
        if not v3 then
            if l_Parent_2:IsA("Attachment") then
                l_Parent_2 = v43._light.Parent.Parent;
                v45 = v43._light.Parent.CFrame;
                if l_Parent_2:IsA("Attachment") then
                    v43:_removeHandles();
                    return false;
                end;
            end;
            if not (not (not v43._light.Parent:IsA("Attachment") and not v43._light.Parent:IsA("BasePart")) and not l_Parent_2:IsA("Attachment")) then
                v43:_removeHandles();
                return false;
            end;
        else
            if l_Parent_2:IsA("Attachment") then
                l_Parent_2 = v43._light.Parent.Parent;
                v45 = v43._light.Parent.CFrame;
                while l_Parent_2:IsA("Attachment") do
                    v45 = l_Parent_2.CFrame * v45;
                    l_Parent_2 = l_Parent_2.Parent;
                end;
            end;
            if not (l_Parent_2:IsA("Attachment") or l_Parent_2:IsA("BasePart")) then
                v43:_removeHandles();
                return false;
            end;
        end;
        v43._adornee = l_Parent_2;
        v43._offset = v45;
        v43._parent = v43._light.Parent;
        return true;
    else
        return false;
    end;
end;
v7._setCFrameValues = function(v46, v47, v48, v49, v50, v51, v52, v53, v54)
    local v55 = math.atan((((v50 - v48) / 2) * 1.4142135623730951) / v54);
    local v56 = v49 / 2;
    local v57 = v52 / 2;
    local v58 = v48 / 2;
    local v59 = v51 / 2;
    local v60 = v50 / 2;
    local v61 = v52 / 2 + v54;
    local v62 = (v48 + v50) / 4;
    local v63 = (v49 + v51) / 4;
    local v64 = (v52 + v54) / 2;
    local v65 = (v52 + v53) / 2;
    v46._handles.innerTopOutline.CFrame = v46._offset * ((v47 * CFrame.new(0, v56, v57)) * CFrame.Angles(0, 1.5707963267948966, 0));
    v46._handles.innerBottomOutline.CFrame = v46._offset * ((v47 * CFrame.new(0, -v56, v57)) * CFrame.Angles(0, 1.5707963267948966, 0));
    v46._handles.innerRightOutline.CFrame = v46._offset * ((v47 * CFrame.new(v58, 0, v57)) * CFrame.Angles(1.5707963267948966, 0, 0));
    v46._handles.innerLeftOutline.CFrame = v46._offset * ((v47 * CFrame.new(-v58, 0, v57)) * CFrame.Angles(1.5707963267948966, 0, 0));
    v46._handles.outerTopOutline.CFrame = ((v46._offset * v47) * CFrame.new(0, v59, v61)) * CFrame.Angles(0, 1.5707963267948966, 0);
    v46._handles.outerBottomOutline.CFrame = v46._offset * ((v47 * CFrame.new(0, -v59, v61)) * CFrame.Angles(0, 1.5707963267948966, 0));
    v46._handles.outerLeftOutline.CFrame = v46._offset * ((v47 * CFrame.new(v60, 0, v61)) * CFrame.Angles(1.5707963267948966, 0, 0));
    v46._handles.outerRightOutline.CFrame = v46._offset * ((v47 * CFrame.new(-v60, 0, v61)) * CFrame.Angles(1.5707963267948966, 0, 0));
    v46._handles.topLeftOutline.CFrame = v46._offset * (((v47 * CFrame.new(v62, v63, v64)) * CFrame.Angles(0, 0, -0.7853981633974483)) * CFrame.Angles(-v55, 0, 0));
    v46._handles.topRightOutline.CFrame = v46._offset * (((v47 * CFrame.new(-v62, v63, v64)) * CFrame.Angles(0, 0, 0.7853981633974483)) * CFrame.Angles(-v55, 0, 0));
    v46._handles.bottomLeftOutline.CFrame = v46._offset * (((v47 * CFrame.new(v62, -v63, v64)) * CFrame.Angles(0, 0, 0.7853981633974483)) * CFrame.Angles(v55, 0, 0));
    v46._handles.bottomRightOutline.CFrame = v46._offset * (((v47 * CFrame.new(-v62, -v63, v64)) * CFrame.Angles(0, 0, -0.7853981633974483)) * CFrame.Angles(v55, 0, 0));
    v46._handles.centerOutline.CFrame = v46._offset * (v47 * CFrame.new(0, 0, v65));
end;
v7._setHandles = function(v66)
    local l_CylinderHandleAdornment_0 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_0.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_0.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_0.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_1 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_1.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_1.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_1.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_2 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_2.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_2.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_2.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_3 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_3.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_3.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_3.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_4 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_4.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_4.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_4.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_5 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_5.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_5.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_5.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_6 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_6.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_6.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_6.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_7 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_7.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_7.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_7.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_8 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_8.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_8.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_8.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_9 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_9.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_9.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_9.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_10 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_10.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_10.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_10.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_11 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_11.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_11.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_11.Parent = v66._handlesFolder;
    local l_CylinderHandleAdornment_12 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_12.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_12.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_12.Parent = v66._handlesFolder;
    v66._handles.innerTopOutline = l_CylinderHandleAdornment_0;
    v66._handles.innerBottomOutline = l_CylinderHandleAdornment_1;
    v66._handles.innerLeftOutline = l_CylinderHandleAdornment_2;
    v66._handles.innerRightOutline = l_CylinderHandleAdornment_3;
    v66._handles.outerTopOutline = l_CylinderHandleAdornment_4;
    v66._handles.outerBottomOutline = l_CylinderHandleAdornment_5;
    v66._handles.outerLeftOutline = l_CylinderHandleAdornment_6;
    v66._handles.outerRightOutline = l_CylinderHandleAdornment_7;
    v66._handles.topLeftOutline = l_CylinderHandleAdornment_8;
    v66._handles.topRightOutline = l_CylinderHandleAdornment_9;
    v66._handles.bottomLeftOutline = l_CylinderHandleAdornment_10;
    v66._handles.bottomRightOutline = l_CylinderHandleAdornment_11;
    v66._handles.centerOutline = l_CylinderHandleAdornment_12;
    v66._handlesPresent = true;
end;
v7._removeHandles = function(v80)
    if not (not v80._handles or not v80._handlesPresent) then
        v80._handles.innerTopOutline:Destroy();
        v80._handles.innerBottomOutline:Destroy();
        v80._handles.innerLeftOutline:Destroy();
        v80._handles.innerRightOutline:Destroy();
        v80._handles.outerTopOutline:Destroy();
        v80._handles.outerBottomOutline:Destroy();
        v80._handles.outerLeftOutline:Destroy();
        v80._handles.outerRightOutline:Destroy();
        v80._handles.topLeftOutline:Destroy();
        v80._handles.topRightOutline:Destroy();
        v80._handles.bottomLeftOutline:Destroy();
        v80._handles.bottomRightOutline:Destroy();
        v80._handles.centerOutline:Destroy();
        v80._handlesPresent = false;
    end;
end;
v7._setListeners = function(v81)
    if not v3 then
        if not v81._listener then
            v81._listener = v81._light.Changed:Connect(function()
                v81:render();
            end);
        end;
        if not ((v81._sizeListener or v81._parent:IsA("Attachment")) or not v81._parent:IsA("BasePart")) then
            v81._sizeListener = v81._parent:GetPropertyChangedSignal("Size"):Connect(function()
                v81:render();
            end);
        end;
        if not (v81._attachmentListener or not v81._parent:IsA("Attachment")) then
            v81._attachmentListener = v81._parent:GetPropertyChangedSignal("CFrame"):Connect(function()
                v81:render();
            end);
        end;
    else
        if not v81._listener then
            v81._listener = v81._light.Changed:Connect(function()
                v81:render();
            end);
        end;
        if not ((v81._sizeListener or v81._parent:IsA("Attachment")) or not v81._parent:IsA("BasePart")) then
            v81._sizeListener = v81._parent:GetPropertyChangedSignal("Size"):Connect(function()
                v81:render();
            end);
        end;
        if not (v81._attachmentListeners or not v81._parent:IsA("Attachment")) then
            v81._attachmentListeners = {};
            local l__parent_0 = v81._parent;
            while l__parent_0:IsA("Attachment") do
                table.insert(v81._attachmentListeners, l__parent_0:GetPropertyChangedSignal("CFrame"):Connect(function()
                    v81:render();
                end));
                table.insert(v81._attachmentListeners, l__parent_0:GetPropertyChangedSignal("Parent"):Connect(function()
                    v81:_removeListeners();
                    v81:_setListeners();
                    v81:render();
                end));
                l__parent_0 = l__parent_0.Parent;
            end;
        end;
    end;
end;
v7._removeListeners = function(v83)
    if not v3 then
        if v83._listener then
            v83._listener:Disconnect();
        end;
        if v83._sizeListener then
            v83._sizeListener:Disconnect();
        end;
        if v83._attachmentListener then
            v83._attachmentListener:Disconnect();
        end;
        v83._listener = nil;
        v83._sizeListener = nil;
        v83._attachmentListener = nil;
    else
        if v83._listener then
            v83._listener:Disconnect();
            v83._listener = nil;
        end;
        if v83._sizeListener then
            v83._sizeListener:Disconnect();
            v83._sizeListener = nil;
        end;
        if v83._attachmentListeners then
            for _, v85 in v83._attachmentListeners, nil, nil do
                v85:Disconnect();
            end;
            v83._attachmentListeners = nil;
            return ;
        end;
    end;
end;
return v7;
