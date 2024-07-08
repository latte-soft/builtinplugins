local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local l_HttpService_0 = game:GetService("HttpService");
local l_StudioService_0 = game:GetService("StudioService");
return function(v5)
    local function v9(v6, v7)
        local v8 = v1.Dictionary.join({
            studioSid = v5:GetSessionId(), 
            clientId = v5:GetClientId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        }, v7 or {});
        if v2.LogAnalytics() then
            print(("Terrain SendEvent eventName=%s args=%s"):format(tostring(v6), l_HttpService_0:JSONEncode(v8)));
        end;
        v5:SendEventDeferred("studio", "Terrain", v6, v8);
    end;
    local function _(v10, v11)
        v11 = v11 or 1;
        if v2.LogAnalytics() then
            print(("Terrain ReportCounter counterName=%s count=%s"):format(tostring(v10), (tostring(v11))));
        end;
        v5:ReportCounter(v10, v11);
    end;
    return {
        changeTool = function(_, v14)
            v9("ToolSelected", {
                name = v14
            });
        end, 
        changeTab = function(_, v16)
            v9("TabSelected", {
                name = v16
            });
        end, 
        toggleWidget = function()
            local v17 = nil or 1;
            if v2.LogAnalytics() then
                print(("Terrain ReportCounter counterName=%s count=%s"):format(tostring("TerrainToolsToggleButton"), (tostring(v17))));
            end;
            v5:ReportCounter("TerrainToolsToggleButton", v17);
            v9("ToggleWidget");
        end, 
        openWidget = function()
            local v18 = nil or 1;
            if v2.LogAnalytics() then
                print(("Terrain ReportCounter counterName=%s count=%s"):format(tostring("TerrainToolsOpenWidget"), (tostring(v18))));
            end;
            v5:ReportCounter("TerrainToolsOpenWidget", v18);
            v9("OpenWidget");
        end, 
        closeWidget = function()
            local v19 = nil or 1;
            if v2.LogAnalytics() then
                print(("Terrain ReportCounter counterName=%s count=%s"):format(tostring("TerrainToolsCloseWidget"), (tostring(v19))));
            end;
            v5:ReportCounter("TerrainToolsCloseWidget", v19);
            v9("CloseWidget");
        end, 
        generateTerrain = function(_, v21, v22, v23)
            v9("GenerateTerrain", {
                numVoxels = v21, 
                biomesize = v22, 
                seed = v23
            });
        end, 
        useBrushTool = function(_, v25)
            v9("UseTerrainTool", {
                toolName = v25
            });
        end, 
        useBrushToolExtended = function(_, v27)
            v9("UseTerrainTool", {
                toolName = v27.currentTool, 
                brushShape = v27.brushShape, 
                cursorSize = v27.cursorSize, 
                cursorHeight = v27.cursorHeight, 
                strength = v27.strength, 
                material = v27.material, 
                autoMaterial = v27.autoMaterial, 
                flattenMode = v27.flattenMode, 
                pivot = v27.pivot, 
                ignoreWater = v27.ignoreWater, 
                ignoreParts = v27.ignoreParts, 
                planeLock = v27.planeLock, 
                fixedPlane = v27.fixedPlane, 
                snapToVoxel = v27.snapToVoxel, 
                planePositionY = v27.planePositionY, 
                source = v27.source, 
                target = v27.target
            });
        end, 
        importTerrain = function(_, v29, v30, v31)
            v9("ImportTerrain", {
                regionDims = ("%d,%d,%d)"):format(v29.Size.x, v29.Size.y, v29.Size.z), 
                heightMapUrl = v30, 
                colorMapUrl = v31
            });
        end, 
        importTerrainLocal = function(_, v33, v34, v35, v36, v37)
            local v38 = {
                regionDims = ("%d,%d,%d)"):format(v33.Size.x, v33.Size.y, v33.Size.z), 
                heightMapImgDims = ("%d, %d"):format(v35.width, v35.height), 
                heightMapChannels = v35.channels, 
                material = v34, 
                guid = v37
            };
            if next(v36) then
                v38.colorMapImgDims = ("%d, %d"):format(v36.width, v36.height);
                v38.colorMapChannels = v36.channels;
            end;
            v9("ImportTerrainLocal", v38);
        end, 
        importTerrainLocalHeightMap = function(_, v40, v41)
            v9("ImportTerrainHeightmapMapping", {
                assetId = v40, 
                guid = v41
            });
        end, 
        importTerrainLocalColorMap = function(_, v43, v44)
            v9("ImportTerrainColormapMapping", {
                assetId = v43, 
                guid = v44
            });
        end, 
        upgradeShorelinesAction = function(_, v46)
            v9("UpgradeShorelinesAction", {
                source = v46
            });
        end, 
        upgradeShorelinesCancel = function(_)
            v9("UpgradeShorelinesCancel", {});
        end, 
        upgradeShorelinesDismiss = function(_, v49)
            v9("UpgradeShorelinesDismiss", {
                dontAsk = v49
            });
        end, 
        upgradeSmoothVoxelsAction = function(_, v51)
            v9("UpgradeSmoothVoxelsAction", {
                source = v51
            });
        end, 
        upgradeSmoothVoxelsCancel = function(_)
            v9("UpgradeSmoothVoxelsCancel", {});
        end, 
        upgradeSmoothVoxelsDismiss = function(_, v54)
            v9("UpgradeSmoothVoxelsDismiss", {
                dontAsk = v54
            });
        end, 
        regionAction = function(_, v56)
            local v57 = "TerrainToolsRegion" .. v56;
            local v58 = nil or 1;
            if v2.LogAnalytics() then
                print(("Terrain ReportCounter counterName=%s count=%s"):format(tostring(v57), (tostring(v58))));
            end;
            v5:ReportCounter(v57, v58);
        end, 
        regionMode = function(_, v60)
            local v61 = "TerrainToolsRegionMode" .. v60;
            local v62 = nil or 1;
            if v2.LogAnalytics() then
                print(("Terrain ReportCounter counterName=%s count=%s"):format(tostring(v61), (tostring(v62))));
            end;
            v5:ReportCounter(v61, v62);
        end
    };
end;
