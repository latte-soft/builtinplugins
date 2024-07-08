local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.Packages.Framework).Util.Signal;
local v2 = require(l_Parent_0.Src.Util.quickWait);
local l_Workspace_0 = game:GetService("Workspace");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = Vector3.new(0, 1, 0);
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8, v9, v10)
    assert(v7, "MidPlanePreview needs reference to plugin");
    local v11 = (v9 + v10) * 0.5;
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "MidPlanePreview";
    l_Part_0.Size = Vector3.new(1, 1, 1);
    l_Part_0.Position = v11;
    l_Part_0.TopSurface = "Smooth";
    l_Part_0.BottomSurface = "Smooth";
    l_Part_0.CastShadow = false;
    l_Part_0.Locked = true;
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.BrickColor = BrickColor.new("Toothpaste");
    l_Part_0.Material = Enum.Material.Neon;
    l_Part_0.Archivable = false;
    l_Part_0.Transparency = 1;
    local l_BlockMesh_0 = Instance.new("BlockMesh");
    local v14 = v10 - v9;
    l_BlockMesh_0.Scale = Vector3.new(v14.x, 1, v14.z);
    l_BlockMesh_0.Parent = l_Part_0;
    l_Part_0.Parent = v8;
    local v15 = setmetatable({
        _plugin = v7, 
        _mouse = v7:GetMouse(), 
        _selectingHeight = false, 
        _target = v8, 
        _rootPart = l_Part_0, 
        _blockMesh = l_BlockMesh_0, 
        _targetRegion = Region3.new(v9, v10)
    }, v6);
    v15._heightSelectedSignal = l_Signal_0.new();
    return v15;
end;
v6.destroy = function(v16)
    if v16._blockMesh then
        v16._blockMesh:Destroy();
        v16._blockMesh = nil;
    end;
    if v16._rootPart then
        v16._rootPart:Destroy();
        v16._rootPart = nil;
    end;
    if v16._connection then
        v16._connection:Disconnect();
    end;
end;
v6.updateCollisionPlaneNormal = function(v17)
    local l_Position_0 = v17._rootPart.Position;
    local l_p_0 = l_Workspace_0.CurrentCamera.CoordinateFrame.p;
    local l_v5_0 = v5;
    local v21 = l_p_0 - l_Position_0;
    if l_v5_0:Dot(v21) == 0 then
        v17._planeNormal = nil;
        return ;
    else
        v17._planeNormal = l_v5_0:Cross(v21):Cross(l_v5_0).Unit;
        return ;
    end;
end;
v6.calcPlaneHit = function(v22)
    local l_p_1 = l_Workspace_0.CurrentCamera.CoordinateFrame.p;
    local l_Direction_0 = v22._mouse.UnitRay.Direction;
    local v25 = l_Direction_0:Dot(v22._planeNormal);
    if v25 < 0 then
        return l_p_1 + ((v22._rootPart.Position - l_p_1):Dot(v22._planeNormal) / v25) * l_Direction_0;
    else
        return nil;
    end;
end;
v6.calcAxisPosMouseClick = function(v26)
    if v26._planeNormal then
        local v27 = v26:calcPlaneHit();
        if not v27 then
            return v26._position;
        else
            return ((v27 - v26._prevPosition):Dot(v5) / v5:Dot(v5)) * v5 + v26._prevPosition;
        end;
    else
        return ;
    end;
end;
v6.startSelectHeight = function(v28, v29, v30)
    if not v28._connection then
        v28._plugin:Activate(true);
        v28:updateCollisionPlaneNormal();
        v28._prevPosition = v28._rootPart.Position;
        v28._connection = l_UserInputService_0.InputEnded:Connect(function()
            if v28._planeNormal then
                v28._planeNormal = nil;
            end;
            v29();
            v28._plugin:Deactivate();
            v28._connection:Disconnect();
            v28._connection = nil;
        end);
        spawn(function()
            while v28._connection ~= nil do
                local v31 = v28:calcAxisPosMouseClick();
                if v28._rootPart.Position ~= v31 then
                    v28._rootPart.Position = v31;
                    v30(v31.Y);
                end;
                v2();
            end;
        end);
        return ;
    else
        return ;
    end;
end;
v6.updateVisibility = function(v32, v33)
    if v32._rootPart then
        v32._rootPart.Transparency = not v33 and 1 or 0.9;
    end;
end;
v6.updatePlaneScaling = function(v34, v35, v36)
    local v37 = v36 - v35;
    local v38 = (v35 + v36) * 0.5;
    local l_Y_0 = v34._rootPart.Position.Y;
    v34._blockMesh.Scale = Vector3.new(v37.x * 1.2, 1, v37.z * 1.2);
    v34._rootPart.Position = Vector3.new(v38.X, l_Y_0, v38.Z);
end;
v6.setY = function(v40, v41)
    assert(type(v41) == "number", "");
    local l_Position_1 = v40._rootPart.Position;
    v40._rootPart.Position = Vector3.new(l_Position_1.X, v41, l_Position_1.Z);
end;
v6.setPosition = function(v43, v44)
    v43._rootPart.Position = v44;
end;
v6.getPosition = function(v45)
    return v45._rootPart.Position;
end;
return v6;
