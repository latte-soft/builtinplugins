local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useState_0 = v2.useState;
local v6 = require(l_script_FirstAncestor_0.Src.Controllers.ShortcutController);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useTerrain);
local v9 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Util.ApplyPlaneLock);
local v11 = require(l_script_FirstAncestor_0.Src.Util.ConvertForPivot);
local v12 = require(l_script_FirstAncestor_0.Src.Util.getCameraLookPlane);
local v13 = require(l_script_FirstAncestor_0.Src.Util.getPlaneIntersection);
local v14 = require(l_script_FirstAncestor_0.Src.Util.getSnappedToVoxel);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local v19 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v19.BrushSettings;
local l_BrushShape_0 = v19.BrushShape;
local l_Category_0 = v19.Category;
local l_MaterialSettings_0 = v19.MaterialSettings;
local l_PlaneLock_0 = v19.PlaneLock;
local l_Snapping_0 = v19.Snapping;
local l_Tool_0 = v19.Tool;
local v27 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorBrushPerformanceEnhancements);
local v28 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorAirSourceMaterial);
return function(v29, v30, v31)
    local v32 = v6:use();
    local v33 = v32:getMouse();
    local v34, v35 = l_useState_0({
        Distance = v33.Origin.Position.Magnitude, 
        Normal = Vector3.yAxis, 
        Position = Vector3.zero
    });
    local v36, v37 = l_useState_0({
        Distance = v33.Origin.Position.Magnitude, 
        Normal = Vector3.yAxis, 
        Position = Vector3.zero
    });
    local v38, v39 = l_useState_0(CFrame.lookAt(v34.Position, v34.Position + Vector3.yAxis));
    l_useEffect_0(function()
        if not v32:IsMouseDown() then
            v39((CFrame.lookAt(v34.Position, v34.Position + v12())));
        end;
    end, {
        v29, 
        v34
    });
    local v40, v41 = l_useState_0({
        CacheID = nil, 
        CachePoint = Vector3.zero
    });
    local v42, v43 = l_useState_0(v32:isMouseMoveReserved());
    local v44 = v8();
    local v45 = v30[l_Category_0.MaterialSettings];
    local v46 = l_useCallback_0(function()
        return (math.min(((v30[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize].Size / 2) * v9.VoxelResolution) * v9.TerrainCacheMultiplier, v9.TerrainCacheMaxRadius));
    end, {
        v30[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize]
    });
    local v47 = l_useCallback_0(function()
        if v29 == l_Tool_0.Draw and not v30[l_Category_0.BrushSettings][l_BrushSettings_0.TemporarySmooth] or not (not (v29 == l_Tool_0.Paint) or not v45) and (not (v45[l_MaterialSettings_0.TargetMaterial] ~= Enum.Material.Air) or v28() and v45[l_MaterialSettings_0.SourceMaterial] == Enum.Material.Air) then
            return v30[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Off;
        else
            return false;
        end;
    end, {
        v30[l_Category_0.BrushSettings][l_BrushSettings_0.TemporarySmooth], 
        v30[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock], 
        not v45 and true or v45[l_MaterialSettings_0.TargetMaterial], 
        v29
    });
    local v55 = l_useCallback_0(function(v48)
        local v49 = v30[l_Category_0.BrushSettings][l_BrushSettings_0.BrushShape];
        local v50 = v30[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize];
        local v51 = v11(v30[l_Category_0.BrushSettings][l_BrushSettings_0.PivotPosition], v48.Position, if v49 == l_BrushShape_0.Sphere then v50.Size * v9.VoxelResolution else v50.Height * v9.VoxelResolution);
        local l_BrushVisual_0 = l_CoreGui_0:FindFirstChild("BrushVisual");
        if l_BrushVisual_0 then
            local l_l_BrushVisual_0_FirstChild_0 = l_BrushVisual_0:FindFirstChild("Central", true);
            if l_l_BrushVisual_0_FirstChild_0 then
                local v54 = if v49 == l_BrushShape_0.Cylinder then CFrame.Angles(1.5707963267948966, 0, 0) + v51 else CFrame.new(v51);
                l_l_BrushVisual_0_FirstChild_0.CFrame = v54;
                l_BrushVisual_0:FindFirstChild("OnTop", true).CFrame = v54;
                l_BrushVisual_0:FindFirstChild("Outline", true).CFrame = v54;
            end;
            return ;
        else
            return ;
        end;
    end, {
        v30
    });
    local v58 = l_useCallback_0(function(v56)
        local v57 = {
            [l_Category_0.BrushSettings] = {
                [l_BrushSettings_0.State] = v56
            }
        };
        if v27() and v29 ~= l_Tool_0.Build then
            v55(v56);
        end;
        v35(v56);
        v31(v57);
    end, {
        v38, 
        v31, 
        v29, 
        v55
    });
    local v79 = l_useCallback_0(function()
        local l_Position_0 = v33.Origin.Position;
        local l_Direction_0 = v33.UnitRay.Direction;
        local v61 = RaycastParams.new();
        if not v30[l_Category_0.BrushSettings][l_BrushSettings_0.IgnoreParts] then
            local v62 = {};
            if not (not l_Players_0.LocalPlayer or not l_Players_0.LocalPlayer.Character) then
                table.insert(v62, l_Players_0.LocalPlayer.Character);
            end;
            v61.FilterType = Enum.RaycastFilterType.Blacklist;
            v61.FilterDescendantsInstances = v62;
        else
            local v63 = {
                v44
            };
            local l_Baseplate_0 = l_Workspace_0:FindFirstChild("Baseplate");
            if l_Baseplate_0 then
                table.insert(v63, l_Baseplate_0);
            end;
            v61.FilterType = Enum.RaycastFilterType.Whitelist;
            v61.FilterDescendantsInstances = v63;
        end;
        v61.IgnoreWater = v30[l_Category_0.BrushSettings][l_BrushSettings_0.IgnoreWater];
        v61.BruteForceAllSlow = true;
        local v65 = l_Workspace_0:Raycast(l_Position_0, l_Direction_0 * v9.RayLength, v61);
        if not (not v32:IsMouseDown() or not v47()) then
            local v66 = if not v65 then v34.Position else v65.Position;
            local l_magnitude_0 = (v66 - v40.CachePoint).magnitude;
            local l_CacheID_0 = v40.CacheID;
            do
                local l_l_CacheID_0_0 = l_CacheID_0;
                if not (v46() * v9.TerrainCacheUpdateThreshold >= l_magnitude_0 and l_l_CacheID_0_0) then
                    l_l_CacheID_0_0 = l_Workspace_0:CacheCurrentTerrain(v40.CacheID or "", v66, v46());
                    local l_v66_0 = v66 --[[ copy: 4 -> 8 ]];
                    v41(function(v71)
                        return v1.join(v71, {
                            CacheID = l_l_CacheID_0_0, 
                            CachePoint = l_v66_0
                        });
                    end);
                end;
                v65 = l_Workspace_0:RaycastCachedTerrain(l_l_CacheID_0_0, l_Position_0, l_Direction_0 * v9.RayLength, true, v61);
            end;
        end;
        if not v65 then
            local v72 = v12();
            local v73, v74 = v13(l_Position_0, l_Direction_0, Vector3.zero, Vector3.yAxis);
            if not (not v73 or not v74) and v74 >= 0 then
                v65 = {
                    Distance = (v73 - l_Position_0).Magnitude, 
                    Normal = v72, 
                    Position = v73
                };
            else
                local v75 = l_Position_0 + l_Direction_0 * v9.RayLength;
                v65 = {
                    Distance = (v75 - l_Position_0).Magnitude, 
                    Normal = v72, 
                    Position = v75
                };
            end;
        else
            v65 = {
                Distance = (v65.Position - l_Position_0).Magnitude, 
                Instance = v65.Instance, 
                Material = v65.Material, 
                Normal = v65.Normal, 
                Position = v65.Position
            };
        end;
        local v76 = v10(v30, if not v32:IsMouseDown() then CFrame.lookAt(v65.Position, v65.Position + v12()) else v38, v33);
        if v76 then
            v65 = v76;
        end;
        local v77 = v30[l_Category_0.BrushSettings][l_BrushSettings_0.Snapping];
        v37(table.clone(v65));
        if v77 ~= nil and v77 ~= l_Snapping_0.Off then
            local v78 = v14(v65.Position);
            if v30[l_Category_0.BrushSettings][l_BrushSettings_0.FixedYPlane] then
                v78 = Vector3.new(v78.X, v30[l_Category_0.BrushSettings][l_BrushSettings_0.FixedYPlanePosition], v78.Z);
            end;
            v65.Distance = (v78 - l_Position_0).Magnitude;
            v65.Position = v78;
        end;
        return v65;
    end, {
        not v32:IsMouseDown() and true or v38, 
        v40, 
        v46, 
        v47, 
        v30[l_Category_0.BrushSettings][l_BrushSettings_0.IgnoreParts], 
        v30[l_Category_0.BrushSettings][l_BrushSettings_0.IgnoreWater], 
        v30[l_Category_0.BrushSettings][l_BrushSettings_0.Snapping], 
        v30[l_Category_0.BrushSettings][l_BrushSettings_0.FixedYPlane], 
        v30[l_Category_0.BrushSettings][l_BrushSettings_0.FixedYPlanePosition], 
        v30[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform], 
        v30[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock]
    });
    v7(v33.Button1Down, function()
        if v47() then
            v41(function(v80)
                if not v80.CacheID then
                    return {
                        CacheID = l_Workspace_0:CacheCurrentTerrain("", v34.Position, v46()), 
                        CachePoint = v34.Position
                    };
                else
                    return v80;
                end;
            end);
        end;
    end, {
        v34
    });
    v7(v33.Button1Up, function()
        if v40.CacheID then
            l_Workspace_0:ClearCachedTerrain(v40.CacheID);
        end;
        v41({
            CachePoint = Vector3.zero
        });
    end, {
        v40
    });
    v7(v32.MouseMoveAction, function()
        if v42 then
            v43(false);
        end;
    end, {
        v42
    });
    l_useEffect_0(function()
        if not v27() then
            return function()
            end;
        else
            l_RunService_0:BindToRenderStep("TerrainRaycast", 1, function()
                if v32:isMouseMoveReserved() then
                    if not v42 then
                        v43(true);
                    end;
                    return ;
                else
                    v58(v79(v32:IsMouseDown()));
                    return ;
                end;
            end);
            return function()
                l_RunService_0:UnbindFromRenderStep("TerrainRaycast");
            end;
        end;
    end, {
        v58
    });
    l_useEffect_0(function()
        if not v27() then
            task.defer(function()
                if v32:isMouseMoveReserved() then
                    if not v42 then
                        v43(true);
                    end;
                    return ;
                else
                    v58(v79(v32:IsMouseDown()));
                    return ;
                end;
            end);
        end;
    end, {
        v29, 
        v79, 
        v58, 
        v34, 
        v42
    });
    return v34, v36;
end;
