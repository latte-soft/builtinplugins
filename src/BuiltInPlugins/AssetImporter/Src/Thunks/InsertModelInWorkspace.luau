local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_InsertService_0 = game:GetService("InsertService");
local l_Selection_0 = game:GetService("Selection");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v4 = require(l_script_FirstAncestor_0.Src.Utility.getWorkspaceInsertPosition);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagZoomToExtentsApi);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCinFixUploadResults);
local function _(v7, v8)
    local l_ViewportSize_0 = v8.ViewportSize;
    return (v7.Magnitude / 2) / math.sin((math.atan(math.tan((math.rad(v8.FieldOfView / 2))) * math.min(1, l_ViewportSize_0.X / l_ViewportSize_0.Y))));
end;
local function v17(v11, v12)
    local v13 = if not v12:IsA("Model") then v12.CFrame else v12:GetModelCFrame();
    local v14 = if not v12:IsA("Model") then v12.Size else v12:GetExtentsSize();
    if not v5() then
        v11.CameraType = Enum.CameraType.Fixed;
        local l_ViewportSize_1 = v11.ViewportSize;
        local v16 = (v14.Magnitude / 2) / math.sin((math.atan(math.tan((math.rad(v11.FieldOfView / 2))) * math.min(1, l_ViewportSize_1.X / l_ViewportSize_1.Y))));
        l_ViewportSize_1 = v11.CFrame;
        v11.CFrame = ((l_ViewportSize_1 - l_ViewportSize_1.p) + v13.p) - l_ViewportSize_1.LookVector * v16;
        v11.Focus = v13;
        return ;
    else
        v11:zoomToExtents(v13, v14);
        return ;
    end;
end;
local function v25(v18, v19)
    if v19.InsertInWorkspace then
        local l_Instance_0 = v18.Instance;
        if not ((not v19.AddModelToInventory or not v19.ShouldImport) or not v19.ImportAsPackage) then
            local v21 = "rbxassetid://%d";
            local l_status_0, l_result_0 = pcall(l_InsertService_0.LoadPackageAssetAsync, l_InsertService_0, if not v6() then v21:format(v18.AssetIds[v19.Id]) else v21:format(v18.AssetIds[tostring(v19.Id)]));
            if l_status_0 then
                l_Instance_0 = l_result_0[1];
            else
                error("Error trying to insert asset from import");
                return ;
            end;
        end;
        if l_Instance_0 == nil then
            return ;
        else
            l_InsertService_0:Insert(l_Instance_0);
            if not v19.InsertWithScenePosition then
                local v24 = v4();
                if not l_Instance_0:IsA("Model") then
                    if l_Instance_0:IsA("MeshPart") then
                        l_Instance_0.Position = v24;
                    end;
                else
                    l_Instance_0:MoveTo(v24);
                end;
            end;
            l_Selection_0:Set({
                l_Instance_0
            });
            l_ChangeHistoryService_0:SetWaypoint("Insert imported asset");
            v17(game.Workspace.CurrentCamera, l_Instance_0);
            return ;
        end;
    else
        return ;
    end;
end;
return function(v26, v27)
    return function()
        v25(v26, v27);
    end;
end;
