local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_TabId_0 = v3.TabId;
local l_ToolId_0 = v3.ToolId;
local l_TransformMode_0 = v3.TransformMode;
return (v1.createReducer({
    currentTab = l_TabId_0.Create, 
    currentTool = l_ToolId_0.None, 
    SelectionTransform = CFrame.new(), 
    SelectionSize = Vector3.new(64, 32, 64), 
    ShorelinesUpgradePercent = -1, 
    ShorelinesUpgradePossible = false, 
    ShorelinesUpgradeSuggestion = false, 
    SmoothVoxelsUpgradePercent = -1, 
    SmoothVoxelsUpgradePossible = false, 
    SmoothVoxelsUpgradeSuggestion = false, 
    SnapToVoxels = true, 
    TransformMode = l_TransformMode_0.Move, 
    lastToolPerTab = {}
}, {
    ChangeSelection = function(v7, v8)
        return v2.Dictionary.join(v7, {
            SelectionTransform = v8.selectionTransform, 
            SelectionSize = v8.selectionSize
        });
    end, 
    ChangeTab = function(v9, v10)
        local l_tabName_0 = v10.tabName;
        return v2.Dictionary.join(v9, {
            currentTab = l_tabName_0, 
            currentTool = v9.lastToolPerTab[l_tabName_0] or l_ToolId_0.None
        });
    end, 
    ChangeTool = function(v12, v13)
        local l_currentTool_0 = v13.currentTool;
        if l_currentTool_0 == v12.currentTool then
            l_currentTool_0 = l_ToolId_0.None;
        end;
        return v2.Dictionary.join(v12, {
            currentTool = l_currentTool_0, 
            lastToolPerTab = v2.Dictionary.join(v12.lastToolPerTab, {
                [v12.currentTab] = l_currentTool_0
            }), 
            TransformMode = l_TransformMode_0.Move
        });
    end, 
    SetShorelinesUpgradePercent = function(v15, v16)
        return v2.Dictionary.join(v15, {
            ShorelinesUpgradePercent = v16.shorelinesUpgradePercent
        });
    end, 
    SetShorelinesUpgradePossible = function(v17, v18)
        return v2.Dictionary.join(v17, {
            ShorelinesUpgradePossible = v18.shorelinesUpgradePossible
        });
    end, 
    SetShorelinesUpgradeSuggestion = function(v19, v20)
        return v2.Dictionary.join(v19, {
            ShorelinesUpgradeSuggestion = v20.shorelinesUpgradeSuggestion
        });
    end, 
    SetSmoothVoxelsUpgradePercent = function(v21, v22)
        return v2.Dictionary.join(v21, {
            SmoothVoxelsUpgradePercent = v22.smoothVoxelsUpgradePercent
        });
    end, 
    SetSmoothVoxelsUpgradePossible = function(v23, v24)
        return v2.Dictionary.join(v23, {
            SmoothVoxelsUpgradePossible = v24.smoothVoxelsUpgradePossible
        });
    end, 
    SetSmoothVoxelsUpgradeSuggestion = function(v25, v26)
        return v2.Dictionary.join(v25, {
            SmoothVoxelsUpgradeSuggestion = v26.smoothVoxelsUpgradeSuggestion
        });
    end, 
    SetSnapToVoxels = function(v27, v28)
        return v2.Dictionary.join(v27, {
            SnapToVoxels = v28.snapToVoxels
        });
    end, 
    SetTerrainRegion = function(v29, v30)
        return v2.Dictionary.join(v29, {
            TerrainRegion = v30.TerrainRegion
        });
    end, 
    SetTerrainRegionCopyBuffer = function(v31, v32)
        return v2.Dictionary.join(v31, {
            TerrainRegionCopyBuffer = v32.TerrainRegionCopyBuffer, 
            TerrainRegionCopyTransform = v32.TerrainRegionCopyTransform, 
            TerrainRegionCopySize = v32.TerrainRegionCopySize
        });
    end, 
    SetTransformMode = function(v33, v34)
        return v2.Dictionary.join(v33, {
            TransformMode = v34.TransformMode, 
            currentTool = l_ToolId_0.Transform
        });
    end
}));
