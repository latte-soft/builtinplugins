local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useTerrain);
local v4 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v5 = require(script.Line);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Workspace_0 = game:GetService("Workspace");
return function(v8)
    local v9 = v3();
    local v10 = if not v8.Center then v8.Transform.Rotation * Vector3.yAxis else v8.Center:PointToObjectSpace(v8.Transform.Position);
    local l_Position_0 = v8.Transform.Position;
    local l_Transform_0 = v8.Transform;
    local v13 = v8.Size * v4.VoxelResolution;
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local v17 = {};
    for v18 = 1, 10 do
        local v19 = (((v18 - ((v10.Y / v13) % 1 or 0)) - 1.5) / 9) % 1;
        local v20 = (v13 * 9) * math.sin((math.acos(v19 * 1.99 - 0.995)));
        local v21 = ((v19 - 0.5) * 9) * v13;
        local v22 = (((v18 - ((v10.X / v13) % 1 or 0)) - 1.5) / 9) % 1;
        local v23 = (v13 * 9) * math.sin((math.acos(v22 * 1.99 - 0.995)));
        local v24 = ((v22 - 0.5) * 9) * v13;
        local v25 = math.pow((l_Workspace_0.CurrentCamera.CFrame.Position - l_Position_0).Magnitude, 0.5) / v4.GridLineWidth;
        local v26 = Vector3.new(v20, v25, v25);
        local v27 = CFrame.new(0, v21, 0);
        local v28 = Vector3.new(v25, v23, v25);
        local v29 = CFrame.new(v24, 0, 0);
        v14[("Line%*"):format(v18)] = v1.createElement(v5, {
            Adornee = v9, 
            CFrame = l_Transform_0 * v27, 
            Size = v26
        });
        v15[("Line%*"):format(v18)] = v1.createElement(v5, {
            Adornee = v9, 
            AlwaysOnTop = true, 
            CFrame = l_Transform_0 * v27, 
            Size = v26, 
            Visible = v8.AlwaysOnTop
        });
        v16[("Line%*"):format(v18)] = v1.createElement(v5, {
            Adornee = v9, 
            CFrame = l_Transform_0 * v29, 
            Size = v28
        });
        v17[("Line%*"):format(v18)] = v1.createElement(v5, {
            Adornee = v9, 
            AlwaysOnTop = true, 
            CFrame = l_Transform_0 * v29, 
            Size = v28, 
            Visible = v8.AlwaysOnTop
        });
    end;
    return v2.createPortal({
        Grid = v1.createElement("Folder", {}, {
            Lines = v1.createElement("Folder", {}, v14), 
            LinesOnTop = v1.createElement("Folder", {}, v15), 
            LinesPerpendicular = v1.createElement("Folder", {}, v16), 
            LinesOnTopPerpendicular = v1.createElement("Folder", {}, v17)
        })
    }, l_CoreGui_0);
end;
