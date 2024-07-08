local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.ConvertForAnalytics);
local v4 = require(l_Util_0.DebugFlags);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_HttpService_0 = game:GetService("HttpService");
local l_StudioService_0 = game:GetService("StudioService");
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
return function(v9)
    local function v12(v10, v11)
        v11 = v3(l_join_0({
            studioSid = v9:GetSessionId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        }, v11));
        if v4.LogAnalytics() then
            print((("(EVENT) TerrainEditor reported event %* with payload %*"):format(tostring(v10), (l_HttpService_0:JSONEncode(v11)))));
        end;
        v9:SendEventDeferred("studio", "TerrainEditor", v10, v11);
    end;
    local function _(v13, v14)
        v14 = v14 or 1;
        if v4.LogAnalytics() then
            print((("Terrain ReportCounter counterName=%* count=%*"):format(v13, v14)));
        end;
        v9:ReportCounter(v13, v14);
    end;
    local function _(v16, v17)
        if v4.LogAnalytics() then
            print((("Terrain ReportCounter counterName=%* count=%*"):format(v16, v17)));
        end;
        v9:ReportStats(v16, v17);
    end;
    return {
        Activated = function(_, v20, v21)
            local v22 = ("%*ToolActivated"):format(v20);
            local v23 = v21 or 1;
            if v4.LogAnalytics() then
                print((("Terrain ReportCounter counterName=%* count=%*"):format(v22, v23)));
            end;
            v9:ReportCounter(v22, v23);
        end, 
        Usage = function(_, v25, v26)
            local v27 = ("%*ToolUsage"):format(v25);
            local v28 = v26 or 1;
            if v4.LogAnalytics() then
                print((("Terrain ReportCounter counterName=%* count=%*"):format(v27, v28)));
            end;
            v9:ReportCounter(v27, v28);
        end, 
        Performance = if not v8() then nil else function(_, v30, v31)
            local v32 = ("%*ToolPerformance"):format(v30);
            if v4.LogAnalytics() then
                print((("Terrain ReportCounter counterName=%* count=%*"):format(v32, v31)));
            end;
            v9:ReportStats(v32, v31);
        end, 
        BrushProperties = function(_, v34)
            v12("terrainEditorBrushProperties", v34);
        end, 
        RegionProperties = function(_, v36)
            v12("terrainEditorRegionProperties", v36);
        end, 
        MaterialProperties = function(_, v38)
            v12("terrainEditorMaterialProperties", v38);
        end
    };
end;
