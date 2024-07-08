local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Flags.getFFlagLightGuidesSupportNestedAttachments)();
local v3 = require(l_Parent_0.Src.Utility.Constants);
local l_THICKNESS_0 = v3.THICKNESS;
local l_TRANSPARENCY_0 = v3.TRANSPARENCY;
local v6 = {};
v6.__index = v6;
v6.new = function()
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
    }, v6));
end;
v6.render = function(v7)
    v7:_setListeners();
    if v7:_setAncestry() then
        if not v7._handlesPresent then
            v7:_setHandles();
        end;
        local l_Enabled_0 = v7._light.Enabled;
        local l_Color_0 = v7._light.Color;
        local l_Range_0 = v7._light.Range;
        local l_AxisAdornmentX_0 = v7._handles.AxisAdornmentX;
        local l_AxisAdornmentY_0 = v7._handles.AxisAdornmentY;
        local l_AxisAdornmentZ_0 = v7._handles.AxisAdornmentZ;
        l_AxisAdornmentX_0.Radius = l_Range_0;
        l_AxisAdornmentX_0.InnerRadius = l_Range_0 - l_THICKNESS_0;
        l_AxisAdornmentX_0.Adornee = v7._adornee;
        l_AxisAdornmentX_0.Visible = l_Enabled_0;
        l_AxisAdornmentX_0.Color3 = l_Color_0;
        l_AxisAdornmentX_0.CFrame = v7._offset * CFrame.Angles(0, 1.5707963267948966, 0);
        l_AxisAdornmentY_0.Radius = l_Range_0;
        l_AxisAdornmentY_0.InnerRadius = l_Range_0 - l_THICKNESS_0;
        l_AxisAdornmentY_0.Adornee = v7._adornee;
        l_AxisAdornmentY_0.Visible = l_Enabled_0;
        l_AxisAdornmentY_0.Color3 = l_Color_0;
        l_AxisAdornmentY_0.CFrame = v7._offset * CFrame.Angles(1.5707963267948966, 0, 0);
        l_AxisAdornmentZ_0.Radius = l_Range_0;
        l_AxisAdornmentZ_0.InnerRadius = l_Range_0 - l_THICKNESS_0;
        l_AxisAdornmentZ_0.Adornee = v7._adornee;
        l_AxisAdornmentZ_0.Visible = l_Enabled_0;
        l_AxisAdornmentZ_0.Color3 = l_Color_0;
        l_AxisAdornmentZ_0.CFrame = v7._offset;
        return ;
    else
        return ;
    end;
end;
v6.pool = function(v14)
    assert(v14._handlesFolder, "Wireframe already pooled");
    assert(v14._light, "Wireframe already pooled");
    v14._handlesFolder.Name = "pooled";
    v14._handlesFolder.Parent = nil;
    v14._light = nil;
    v14:_removeListeners();
    return v14;
end;
v6.adorn = function(v15, v16)
    assert(v16, "Can't adorn nil");
    assert(not v15._light, "Wireframe already adorned");
    v15._light = v16;
    v15._handlesFolder.Name = v16.name;
    v15._handlesFolder.Parent = v15._guidesFolder;
    local l_Parent_1 = v16.Parent;
    if not l_Parent_1 or not l_Parent_1:IsA("Attachment") then
        v15._adornee = l_Parent_1;
        v15._parent = l_Parent_1;
    else
        v15._adornee = l_Parent_1.Parent;
        v15._offset = l_Parent_1.CFrame;
        v15._parent = l_Parent_1;
    end;
    v15:_setListeners();
    return v15;
end;
v6.destroy = function(v18)
    v18:_removeHandles();
    v18:_removeListeners();
    v18._handlesFolder:Destroy();
    v18._handlesFolder = nil;
end;
v6.setGuidesFolder = function(v19, v20)
    v19._guidesFolder = v20;
end;
v6._setAncestry = function(v21)
    local l_Parent_2 = v21._light.Parent;
    local v23 = CFrame.new((Vector3.new()));
    if l_Parent_2 then
        assert(l_Parent_2, "Sphere Wireframe should have valid Adornee.");
        if not v2 then
            if l_Parent_2:IsA("Attachment") then
                l_Parent_2 = v21._light.Parent.Parent;
                v23 = v21._light.Parent.CFrame;
                if l_Parent_2:IsA("Attachment") then
                    v21:_removeHandles();
                    return false;
                end;
            end;
            if not (not (not v21._light.Parent:IsA("Attachment") and not v21._light.Parent:IsA("BasePart")) and not l_Parent_2:IsA("Attachment")) then
                v21:_removeHandles();
                return false;
            end;
        else
            if l_Parent_2:IsA("Attachment") then
                l_Parent_2 = v21._light.Parent.Parent;
                v23 = v21._light.Parent.CFrame;
                while l_Parent_2:IsA("Attachment") do
                    v23 = l_Parent_2.CFrame * v23;
                    l_Parent_2 = l_Parent_2.Parent;
                end;
            end;
            if not (l_Parent_2:IsA("Attachment") or l_Parent_2:IsA("BasePart")) then
                v21:_removeHandles();
                return false;
            end;
        end;
        v21._adornee = l_Parent_2;
        v21._offset = v23;
        v21._parent = v21._light.Parent;
        return true;
    else
        return false;
    end;
end;
v6._setHandles = function(v24)
    local l_CylinderHandleAdornment_0 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_0.Height = l_THICKNESS_0;
    l_CylinderHandleAdornment_0.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_0.Parent = v24._handlesFolder;
    local l_CylinderHandleAdornment_1 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_1.Height = l_THICKNESS_0;
    l_CylinderHandleAdornment_1.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_1.Parent = v24._handlesFolder;
    local l_CylinderHandleAdornment_2 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_2.Height = l_THICKNESS_0;
    l_CylinderHandleAdornment_2.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_2.Parent = v24._handlesFolder;
    v24._handles.AxisAdornmentX = l_CylinderHandleAdornment_0;
    v24._handles.AxisAdornmentY = l_CylinderHandleAdornment_1;
    v24._handles.AxisAdornmentZ = l_CylinderHandleAdornment_2;
    v24._handlesPresent = true;
end;
v6._removeHandles = function(v28)
    if not (not v28._handles or not v28._handlesPresent) then
        v28._handles.AxisAdornmentX:Destroy();
        v28._handles.AxisAdornmentY:Destroy();
        v28._handles.AxisAdornmentZ:Destroy();
        v28._handlesPresent = false;
    end;
end;
v6._setListeners = function(v29)
    if not v2 then
        if not v29._listener then
            v29._listener = v29._light.Changed:Connect(function()
                v29:render();
            end);
        end;
        if not (v29._attachmentListener or not v29._parent:IsA("Attachment")) then
            v29._attachmentListener = v29._parent:GetPropertyChangedSignal("CFrame"):Connect(function()
                v29:render();
            end);
        end;
    else
        if not v29._listener then
            v29._listener = v29._light.Changed:Connect(function()
                v29:render();
            end);
        end;
        if not (v29._attachmentListeners or not v29._parent:IsA("Attachment")) then
            v29._attachmentListeners = {};
            local l__parent_0 = v29._parent;
            while l__parent_0:IsA("Attachment") do
                table.insert(v29._attachmentListeners, l__parent_0:GetPropertyChangedSignal("CFrame"):Connect(function()
                    v29:render();
                end));
                table.insert(v29._attachmentListeners, l__parent_0:GetPropertyChangedSignal("Parent"):Connect(function()
                    v29:_removeListeners();
                    v29:_setListeners();
                    v29:render();
                end));
                l__parent_0 = l__parent_0.Parent;
            end;
        end;
    end;
end;
v6._removeListeners = function(v31)
    if not v2 then
        if v31._listener then
            v31._listener:Disconnect();
        end;
        if v31._attachmentListener then
            v31._attachmentListener:Disconnect();
        end;
        v31._listener = nil;
        v31._attachmentListener = nil;
    else
        if v31._listener then
            v31._listener:Disconnect();
            v31._listener = nil;
        end;
        if v31._attachmentListeners then
            for _, v33 in v31._attachmentListeners, nil, nil do
                v33:Disconnect();
            end;
            v31._attachmentListeners = nil;
            return ;
        end;
    end;
end;
return v6;
