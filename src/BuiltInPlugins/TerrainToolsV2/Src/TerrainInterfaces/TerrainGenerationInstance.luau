local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v5 = require(l_Parent_0.Src.Util.Constants);
local v6 = require(script.Parent.makeTerrainGenerator);
local v7 = l_ContextItem_0:extend("TerrainGeneration");
v7.new = function(v8)
    assert(v8 and type(v8) == "table", "TerrainGeneration requires an options table");
    local v9 = setmetatable({
        _terrain = v8.terrain, 
        _localization = v8.localization, 
        _analytics = v8.analytics, 
        _generateSettings = {
            position = Vector3.new(0, 0, 0), 
            size = Vector3.new(0, 0, 0), 
            biomeSelection = {}, 
            biomeSize = 0, 
            haveCaves = false, 
            seed = "0"
        }, 
        _generating = false, 
        _generateStartTime = 0, 
        _generator = nil, 
        _generatorProgressConnection = nil, 
        _generatorPausedConnection = nil, 
        _generatorFinishedConnection = nil, 
        _updateSignal = l_Signal_0.new()
    }, v7);
    assert(v9._terrain, "TerrainGeneration.new() requires a terrain instance");
    v9._onGeneratorProgressUpdate = function(_)
        v9._updateSignal:Fire();
    end;
    v9._onGeneratorPaused = function(_)
        v9._updateSignal:Fire();
    end;
    v9._onGeneratorFinished = function()
        local _ = tick() - v9._generateStartTime;
        v9:_stopAndClearGenerator();
    end;
    return v9;
end;
v7.getSignal = function(v13)
    return v13._updateSignal;
end;
v7.isGenerating = function(v14)
    return v14._generating;
end;
v7.getProgress = function(v15)
    return not not v15._generator and v15._generator.getProgress() or 0;
end;
v7.isPaused = function(v16)
    if not v16._generator then
        return false;
    else
        return v16._generator.isPaused();
    end;
end;
v7.updateSettings = function(v17, v18)
    v17._generateSettings = v2.Dictionary.join(v17._generateSettings, v18);
end;
v7.destroy = function(v19)
    v19:cancelGeneration();
end;
v7.startGeneration = function(v20)
    if not v20._generating and not v20._generator then
        v20:_setGenerating(true);
        local l_position_0 = v20._generateSettings.position;
        local l_size_0 = v20._generateSettings.size;
        local l_seed_0 = v20._generateSettings.seed;
        local l_biomeSelection_0 = v20._generateSettings.biomeSelection;
        local v25 = Vector3.new(l_position_0.X, l_position_0.Y, l_position_0.Z);
        local v26 = Vector3.new(l_size_0.X, l_size_0.Y, l_size_0.Z);
        local v27 = v2.Dictionary.join(l_biomeSelection_0, {});
        local v28 = {};
        for v29, v30 in pairs(l_biomeSelection_0) do
            if v30 then
                table.insert(v28, v20._localization:getText("Generate", v5.BiomeToLocalizationKey[v29]));
            end;
        end;
        v20._generator = v6(v20._terrain, {
            position = v25, 
            size = v26, 
            biomeSelection = v27, 
            biomeSize = v20._generateSettings.biomeSize, 
            haveCaves = v20._generateSettings.haveCaves, 
            seed = l_seed_0
        }, v20._analytics);
        v20._generatorProgressConnection = v20._generator.progressSignal:Connect(v20._onGeneratorProgressUpdate);
        v20._generatorPausedConnection = v20._generator.pauseSignal:Connect(v20._onGeneratorPaused);
        v20._generatorFinishedConnection = v20._generator.finishSignal:Connect(v20._onGeneratorFinished);
        v20._generateStartTime = tick();
        spawn(v20._generator.start);
        return ;
    else
        return ;
    end;
end;
v7.togglePauseGeneration = function(v31)
    if v31._generator then
        if not v31._generator.isPaused() then
            v31._generator.pause();
            return ;
        else
            v31._generator.resume();
            return ;
        end;
    else
        return ;
    end;
end;
v7.cancelGeneration = function(v32)
    if v32._generator then
        v32._generator.cancel();
        return ;
    else
        return ;
    end;
end;
v7._setGenerating = function(v33, v34)
    if v34 ~= v33._generating then
        v33._generating = v34;
        v33._updateSignal:Fire();
    end;
end;
v7._stopAndClearGenerator = function(v35)
    if v35._generatorProgressConnection then
        v35._generatorProgressConnection:Disconnect();
        v35._generatorProgressConnection = nil;
    end;
    if v35._generatorPausedConnection then
        v35._generatorPausedConnection:Disconnect();
        v35._generatorPausedConnection = nil;
    end;
    if v35._generatorFinishedConnection then
        v35._generatorFinishedConnection:Disconnect();
        v35._generatorFinishedConnection = nil;
    end;
    v35._generator = nil;
    v35:_setGenerating(false);
end;
return v7;
