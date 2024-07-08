local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v4 = require(l_Parent_0.Src.Util.Constants);
local l_ToolId_0 = require(l_Parent_0.Src.Util.TerrainEnums).ToolId;
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v7 = l_ContextItem_0:extend("TerrainSeaLevel");
v7.new = function(v8)
    assert(v8 and type(v8) == "table", "TerrainSeaLevel.new() requires an options table");
    local v9 = setmetatable({
        _localization = v8.localization, 
        _terrain = v8.terrain, 
        _replacing = false, 
        _replacingProgress = 0, 
        _updateSignal = l_Signal_0.new()
    }, v7);
    assert(v9._terrain, "TerrainSeaLevel.new() requires a terrain instance");
    v9._setReplacing = function(v10)
        if v10 ~= v9._replacing then
            v9._replacing = v10;
            v9._updateSignal:Fire();
        end;
        if v10 == false then
            v9._replacingProgress = 0;
        end;
    end;
    v9._updateReplaceProgress = function(v11)
        v9._replaceProgress = v11;
        v9._updateSignal:Fire();
        if v11 >= 1 then
            v9._setReplacing(false);
        end;
    end;
    return v9;
end;
v7.getSignal = function(v12)
    return v12._updateSignal;
end;
v7.destroy = function(v13)
    v13:cancel();
end;
v7.localizedWarn = function(v14, ...)
    if v14._localization then
        warn(v14._localization:getText(...));
    end;
end;
v7.subscribeToProgressChange = function(v15, ...)
    return v15._progressChanged:Connect(...);
end;
v7.subscribeToStateChange = function(v16, ...)
    return v16._stateChange:Connect(...);
end;
v7.isReplacing = function(v17)
    return v17._replacing;
end;
v7.getProgress = function(v18)
    return v18._replacingProgress;
end;
v7.cancel = function(v19)
    v19._setReplacing(false);
end;
v7.replaceMaterial = function(v20, v21, v22, v23, v24, v25)
    if not v20._replacing then
        v20._updateReplaceProgress(0);
        v20._setReplacing(true);
        local l__terrain_0 = v20._terrain;
        if l__terrain_0 then
            assert(v22.x >= 4, "");
            assert(v22.y >= 4, "");
            assert(v22.z >= 4, "");
            v21 = v21 / v4.VOXEL_RESOLUTION;
            v22 = v22 / v4.VOXEL_RESOLUTION;
            local v27 = v22 / 2;
            local v28 = v21 - v27;
            local v29 = v21 + v27;
            local v30 = math.floor(v29.Y);
            local v31 = v29.Y % 1;
            local v32 = math.floor(4194303 / (math.ceil(v22.y) * math.ceil(v22.z)));
            if v32 == 0 then
                v20:localizedWarn("Warning", "RegionTooLarge");
                v20._setReplacing(false);
                return ;
            else
                local v33 = Vector3.new(v32, 0, 0) * v4.VOXEL_RESOLUTION;
                local v34 = Vector3.new(math.floor(v28.X), math.floor(v28.Y), (math.floor(v28.Z))) * v4.VOXEL_RESOLUTION;
                local v35 = Vector3.new(math.ceil((math.min(v29.X, v28.X + v32))), math.ceil(v29.Y), (math.ceil(v29.Z))) * v4.VOXEL_RESOLUTION;
                local v36 = v29.x * v4.VOXEL_RESOLUTION;
                local v37 = v28.x * v4.VOXEL_RESOLUTION;
                if v25 == l_ToolId_0.SeaLevel then
                    l__terrain_0.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditSeaLevelTool;
                elseif v25 == l_ToolId_0.Replace then
                    l__terrain_0.LastUsedModificationMethod = Enum.TerrainAcquisitionMethod.EditReplaceTool;
                end;
                while not (not (v34.x <= v36) or not v20._replacing) do
                    v20._updateReplaceProgress(1 - (v36 - v34.X) / (v36 - v37));
                    local v38 = Region3.new(v34, v35):ExpandToGrid(v4.VOXEL_RESOLUTION);
                    do
                        local l_v38_0 = v38;
                        pcall(function()
                            l__terrain_0:ReplaceMaterial(l_v38_0, v4.VOXEL_RESOLUTION, v23, v24);
                        end);
                        wait();
                        if v31 > 0 then
                            local v40 = Region3.new(Vector3.new(v34.X, v30 * v4.VOXEL_RESOLUTION, v34.Z), (Vector3.new(v35.X, (v30 + 1) * v4.VOXEL_RESOLUTION, v35.Z))):ExpandToGrid(v4.VOXEL_RESOLUTION);
                            local v41, v42 = l__terrain_0:ReadVoxels(v40, v4.VOXEL_RESOLUTION);
                            for v43, v44 in ipairs(v42) do
                                for v45, v46 in pairs(v44) do
                                    for v47, _ in pairs(v46) do
                                        local v49 = v41[v43][v45][v47];
                                        local v50 = v42[v43][v45][v47];
                                        if not (v49 ~= v24) or v24 == Enum.Material.Water and v50 < 1 then
                                            v42[v43][v45][v47] = v31;
                                            v41[v43][v45][v47] = v24;
                                        end;
                                    end;
                                end;
                            end;
                            l__terrain_0:WriteVoxels(v40, v4.VOXEL_RESOLUTION, v41, v42);
                        end;
                        v34 = v34 + v33;
                        v35 = if v35.X + v33.X <= v29.X * v4.VOXEL_RESOLUTION then v35 + v33 else Vector3.new(v29.X * v4.VOXEL_RESOLUTION, v35.Y, v35.Z);
                    end;
                end;
                l_ChangeHistoryService_0:SetWaypoint("TerrainReplace");
                v20._updateReplaceProgress(1);
                v20._setReplacing(false);
                return ;
            end;
        else
            v20:localizedWarn("Warning", "MissingTerrain");
            return ;
        end;
    else
        v20:localizedWarn("Warning", "AlreadyGeneratingTerrain");
        return ;
    end;
end;
return v7;
