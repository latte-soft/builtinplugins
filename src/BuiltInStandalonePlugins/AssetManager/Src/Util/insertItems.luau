local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_InsertService_0 = game:GetService("InsertService");
local l_Selection_0 = game:GetService("Selection");
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagZoomToExtentsApi);
local function _(v6, v7)
    local l_ViewportSize_0 = v7.ViewportSize;
    return (v6.Magnitude / 2) / math.sin((math.atan(math.tan((math.rad(v7.FieldOfView / 2))) * math.min(1, l_ViewportSize_0.X / l_ViewportSize_0.Y))));
end;
local function v21(v10)
    local v11 = Vector3.new(math.huge, math.huge, math.huge);
    local v12 = Vector3.new(-math.huge, -math.huge, -math.huge);
    local function v18(v13)
        local v14 = if not v13:IsA("Model") then v13.CFrame else v13:GetModelCFrame();
        local v15 = if not v13:IsA("Model") then v13.Size else v13:GetExtentsSize() * 0.5;
        local v16 = v14.Position + Vector3.new(-v15.X, -v15.Y, -v15.Z);
        local v17 = v14.Position + Vector3.new(v15.X, v15.Y, v15.Z);
        v11 = Vector3.new(math.min(v11.X, v16.X), math.min(v11.Y, v16.Y), (math.min(v11.Z, v16.Z)));
        v12 = Vector3.new(math.max(v12.X, v17.X), math.max(v12.Y, v17.Y), (math.max(v12.Z, v17.Z)));
    end;
    for _, v20 in v10, nil, nil do
        if not (not v20:IsA("Model") and not v20:IsA("BasePart")) then
            v18(v20);
        end;
    end;
    return CFrame.new((v11 + v12) * 0.5), v12 - v11;
end;
local function v28(v22, v23)
    local v24, v25 = v21(v23);
    if not v5() then
        v22.CameraType = Enum.CameraType.Fixed;
        local l_ViewportSize_1 = v22.ViewportSize;
        local v27 = (v25.Magnitude / 2) / math.sin((math.atan(math.tan((math.rad(v22.FieldOfView / 2))) * math.min(1, l_ViewportSize_1.X / l_ViewportSize_1.Y))));
        l_ViewportSize_1 = v22.CFrame;
        v22.CFrame = ((l_ViewportSize_1 - l_ViewportSize_1.p) + v24.p) - l_ViewportSize_1.LookVector * v27;
        v22.Focus = v24;
        return ;
    else
        v22:ZoomToExtents(v24, v25);
        return ;
    end;
end;
return function(v29)
    local v30 = {};
    for v31, _ in v29, nil, nil do
        local l_status_0, l_result_0 = pcall(l_InsertService_0.LoadAsset, l_InsertService_0, v31);
        if not l_status_0 or not l_result_0 then
            if v4() then
                warn("Asset failed to load");
            end;
        else
            table.insert(v30, l_result_0);
            l_result_0.Parent = game.Workspace;
        end;
    end;
    l_Selection_0:Set(v30);
    l_ChangeHistoryService_0:SetWaypoint("Insert asset");
    v28(game.Workspace.CurrentCamera, v30);
end;
