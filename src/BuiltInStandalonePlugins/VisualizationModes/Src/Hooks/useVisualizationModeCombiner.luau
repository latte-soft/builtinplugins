local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Model.VisualizationModeCombiner);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Src.Model.Telemetry.VisualizationModeDurationTelemetry);
return function()
    local v6 = v4.ContextServices.Plugin:use():get();
    local v7 = v4.ContextServices.Analytics:use();
    local v8 = v2.useState(function()
        return v3.new(v6);
    end);
    local v9 = v2.useState(function()
        return v5.new(v8, v7);
    end);
    local v10, v11 = v2.useState(function()
        return v8:getState() or {
            categories = {}, 
            recentModes = {}
        };
    end);
    v2.useEffect(function()
        return function()
            v9:destroy();
            v8:destroy();
        end;
    end, {});
    v2.useEffect(function()
        local v13 = v8.changed:Connect(function(v12)
            v11(v12);
        end);
        local v14 = v8:getState();
        if v14 then
            v11(v14);
        end;
        return function()
            v13:Disconnect();
        end;
    end, {});
    return table.freeze({
        onVisualizationModeToggle = v2.useCallback(function(v15, v16, v17, v18)
            v8:updateVisualizationModeIsEnabled(v15, v16, v17);
            if v18 then
                v8:recordRecentVisualizationMode(v15, v16);
            end;
        end, {}), 
        onVisualizationModeCategoryToggle = v2.useCallback(function(v19, v20)
            v8:updateVisualizationModeCategoryIsEnabled(v19, v20);
        end, {}), 
        state = v10, 
        combiner = v8
    });
end;
