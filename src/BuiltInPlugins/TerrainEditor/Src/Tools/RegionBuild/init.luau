local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Src.Tools.BaseTool);
local l_deepCopy_0 = v1.Util.deepCopy;
local _ = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorBrushPerformanceEnhancements);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Generation.MaterialLUT);
local v7 = require(l_script_FirstAncestor_0.Src.Util.TerrainPlacementHelper);
local v8 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v8.BuildSettings;
local l_Category_0 = v8.Category;
local l_Gizmo_0 = v8.Gizmo;
local l_Tab_0 = v8.Tab;
local l_TerrainType_0 = v8.TerrainType;
local l_Tool_0 = v8.Tool;
local v15 = {
    [l_TerrainType_0.Arctic] = require(script.Arctic), 
    [l_TerrainType_0.Crater] = require(script.Crater), 
    [l_TerrainType_0.Desert] = require(script.Desert), 
    [l_TerrainType_0.Lake] = require(script.Lake), 
    [l_TerrainType_0.Mesa] = require(script.Mesa), 
    [l_TerrainType_0.Mountain] = require(script.Mountain), 
    [l_TerrainType_0.None] = require(script.None), 
    [l_TerrainType_0.Plain] = require(script.Plain), 
    [l_TerrainType_0.Volcano] = require(script.Volcano)
};
local v16 = {
    [l_TerrainType_0.Arctic] = require(l_script_FirstAncestor_0.Src.Stamps.ArcticStamp), 
    [l_TerrainType_0.Crater] = require(l_script_FirstAncestor_0.Src.Stamps.CraterStamp), 
    [l_TerrainType_0.Desert] = require(l_script_FirstAncestor_0.Src.Stamps.DesertStamp), 
    [l_TerrainType_0.Lake] = require(l_script_FirstAncestor_0.Src.Stamps.LakeStamp), 
    [l_TerrainType_0.Mesa] = require(l_script_FirstAncestor_0.Src.Stamps.MesaStamp), 
    [l_TerrainType_0.Mountain] = require(l_script_FirstAncestor_0.Src.Stamps.MountainStamp), 
    [l_TerrainType_0.Plain] = require(l_script_FirstAncestor_0.Src.Stamps.PlainStamp), 
    [l_TerrainType_0.Volcano] = require(l_script_FirstAncestor_0.Src.Stamps.VolcanoStamp)
};
local v17 = v2:new(l_Tool_0.Build, l_Tab_0.Create, {
    {
        Defaults = {}, 
        Id = l_Category_0.BuildSettings
    }
}, {});
v17.init = function(v18, v19, v20)
    v2.init(v18, v19, v20);
    v18._terrainType = l_TerrainType_0.None;
    v18._tools = {};
    for v21, v22 in v15, nil, nil do
        local v23 = v22:new();
        v23:init(v19, v20);
        v18._tools[v21] = v23;
        v18._tools[v21]._overrides = {
            [l_Category_0.BuildSettings] = {
                [l_BuildSettings_0.Material] = {
                    Schema = {
                        OnReset = function()
                            v18:saveForm({
                                [l_Category_0.BuildSettings] = {
                                    [l_BuildSettings_0.Material] = l_deepCopy_0(v18._tools[v18._terrainType]._configuration[1].Defaults[l_BuildSettings_0.Material])
                                }
                            });
                            if not v5() then
                                v18.OnGizmoChanged:Fire();
                                return ;
                            else
                                v18.OnInternalsChanged:Fire();
                                return ;
                            end;
                        end
                    }
                }, 
                [l_BuildSettings_0.Confirm] = {
                    Hidden = false, 
                    Label = "", 
                    Schema = {
                        CanConfirm = false, 
                        CanRegenerate = false, 
                        OnClick = function()
                            if v18._stamp then
                                v18._stamp:commit();
                                v18._stamp = nil;
                                v18:finishRecording(Enum.FinishRecordingOperation.Append);
                                v18._previousTerrainType = v18._terrainType;
                                v18:saveForm({
                                    [l_Category_0.BuildSettings] = {
                                        [l_BuildSettings_0.TerrainType] = l_TerrainType_0.None
                                    }
                                });
                                v18._tools[v18._terrainType]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema.CanConfirm = false;
                                v18._tools[v18._terrainType]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema.CanRegenerate = true;
                                v18._terrainType = l_TerrainType_0.None;
                                if not v5() then
                                    v18.OnGizmoChanged:Fire();
                                    return ;
                                else
                                    v18.OnInternalsChanged:Fire();
                                    return ;
                                end;
                            else
                                return ;
                            end;
                        end, 
                        OnRegenerate = function()
                            if v18._previousTerrainType then
                                v18._terrainType = v18._previousTerrainType;
                                v18._tools[v18._terrainType]:setPayload({
                                    [l_Category_0.BuildSettings] = {
                                        [l_BuildSettings_0.PlacementMode] = false, 
                                        [l_BuildSettings_0.TerrainType] = v18._previousTerrainType
                                    }
                                });
                                local l_Schema_0 = v18._tools[v18._terrainType]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema;
                                l_Schema_0.CanRegenerate = false;
                                l_Schema_0.CanConfirm = true;
                                if not v5() then
                                    v18.OnFormChanged:Fire();
                                    v18.OnGizmoChanged:Fire();
                                else
                                    v18.OnInternalsChanged:Fire();
                                end;
                                v18:createStamp();
                            end;
                        end
                    }
                }
            }
        };
    end;
end;
v17.form = function(v25)
    local _ = v25:getPayload();
    return v25._tools[v25._terrainType]:form();
end;
v17.setTerrainType = function(v27, v28)
    local v29 = v28[l_Category_0.BuildSettings][l_BuildSettings_0.TerrainType];
    if v29 then
        v27:destroyStamp();
        if v27._onFormChangedForwarder then
            v27._onFormChangedForwarder:Disconnect();
        end;
        if v27._onGizmoChangedForwarder then
            v27._onGizmoChangedForwarder:Disconnect();
        end;
        if v27._onUndoConnection then
            v27._onUndoConnection:Disconnect();
        end;
        v27._onFormChangedForwarder = v27._tools[v29].OnFormChanged:Connect(function()
            v27.OnFormChanged:Fire();
        end);
        v27._onGizmoChangedForwarder = v27._tools[v29].OnGizmoChanged:Connect(function()
            v27.OnGizmoChanged:Fire();
        end);
        v27._tools[v29]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema.CanRegenerate = false;
        v28[l_Category_0.BuildSettings][l_BuildSettings_0.PlacementMode] = true;
        v27._terrainType = v29;
        return v28;
    else
        return v28;
    end;
end;
v17.setMaterial = function(_, v31)
    local v32 = v31[l_Category_0.BuildSettings][l_BuildSettings_0.Material];
    if v32 then
        v31[l_Category_0.BuildSettings][l_BuildSettings_0.MaterialLUT] = v6.new(v32);
        return v31;
    else
        return v31;
    end;
end;
v17.setPlacementMode = function(v33, v34)
    if v34[l_Category_0.BuildSettings][l_BuildSettings_0.PlacementMode] == nil then
        return v34;
    else
        if v33._onUndoConnection then
            v33._onUndoConnection:Disconnect();
        end;
        v33._onUndoConnection = v33._services.ChangeHistoryService.OnUndo:Connect(function()
            v33._tools[v33._terrainType]:saveForm({
                [l_Category_0.BuildSettings] = {
                    [l_BuildSettings_0.PlacementMode] = true
                }
            });
            v33._stamp = nil;
            v33:finishRecording(Enum.FinishRecordingOperation.Cancel);
        end);
        local v35 = v33._tools[v33._terrainType]:getPayload();
        v34[l_BuildSettings_0.Transform] = v7.Place(v35[l_Category_0.BuildSettings][l_BuildSettings_0.Transform], v35[l_Category_0.BuildSettings][l_BuildSettings_0.Size], v35[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength], v33._terrainType);
        return v34;
    end;
end;
v17.finishRecording = function(v36, v37)
    if not v36._recording then
        return false;
    else
        v36._services.ChangeHistoryService:FinishRecording(v36._recording, v37);
        v36._recording = nil;
        return true;
    end;
end;
v17.saveForm = function(v38, v39)
    local v40 = v38:setMaterial((v38:setTerrainType((l_deepCopy_0(v39)))));
    v38._tools[v38._terrainType]:saveForm(v40);
    if v38._stamp then
        v38._stamp:update(v38._tools[v38._terrainType]:getPayload(), v40);
    end;
end;
v17.gizmos = function(v41)
    local _ = v41:getPayload();
    if v41._terrainType == l_TerrainType_0.None then
        return {};
    else
        local v43 = v41._tools[v41._terrainType]:gizmos();
        local v44 = {};
        for _, v46 in v43, nil, nil do
            if not (v46.Id == l_Gizmo_0.Placement) or not v46.Value[l_Category_0.BuildSettings][l_BuildSettings_0.PlacementMode] then
                if not (not (v46.Id == l_Gizmo_0.Region) or v46.Value[l_Category_0.BuildSettings][l_BuildSettings_0.PlacementMode]) then
                    table.insert(v44, v46);
                end;
            else
                table.insert(v44, v46);
            end;
        end;
        return v44;
    end;
end;
v17.saveGizmos = function(v47, v48)
    local v49 = v47:setPlacementMode((l_deepCopy_0(v48)));
    v47._tools[v47._terrainType]:saveGizmos(v49);
    if not v47._stamp then
        v47:createStamp();
        return ;
    else
        v47._stamp:update(v47._tools[v47._terrainType]:getPayload(), v49);
        return ;
    end;
end;
v17.activate = function(v50)
    v50:saveForm((v50:getPayload()));
    v50._tools[v50._terrainType]:activate();
end;
v17.deactivate = function(v51)
    v51._tools[v51._terrainType]:deactivate();
    if v51._onFormChangedForwarder then
        v51._onFormChangedForwarder:Disconnect();
    end;
    if v51._onGizmoChangedForwarder then
        v51._onGizmoChangedForwarder:Disconnect();
    end;
    if v51._mouseDownConnection then
        v51._mouseDownConnection:Disconnect();
    end;
    if v51._onUndoConnection then
        v51._onUndoConnection:Disconnect();
    end;
    v51:finishRecording(Enum.FinishRecordingOperation.Cancel);
    v51:destroyStamp();
end;
v17.destroyStamp = function(v52)
    if v52._stamp then
        v52._stamp:destroy();
        v52._stamp = nil;
    end;
end;
v17.createStamp = function(v53)
    local v54 = v53._tools[v53._terrainType]:getPayload();
    if v53._terrainType ~= l_TerrainType_0.None and not v54[l_Category_0.BuildSettings][l_BuildSettings_0.PlacementMode] then
        v53:destroyStamp();
        if not v54[l_Category_0.BuildSettings][l_BuildSettings_0.MaterialLUT] then
            v54 = v53:setMaterial(v54);
            v53._tools[v53._terrainType]:setPayload(v54);
        end;
        v53:finishRecording(Enum.FinishRecordingOperation.Commit);
        v53._recording = v53._services.ChangeHistoryService:TryBeginRecording("TerrainPlacement", "Placed Terrain");
        v53._stamp = v16[v53._terrainType]:new(v53._terrainType);
        v53._stamp:init(v54, v53._services);
        v53._stamp:update(v54);
        v53:finishRecording(Enum.FinishRecordingOperation.Commit);
        v53._recording = v53._services.ChangeHistoryService:TryBeginRecording("TerrainPlacement", "Adjust");
        v53._tools[v53._terrainType]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema.CanConfirm = true;
        return ;
    else
        return ;
    end;
end;
return v17;
