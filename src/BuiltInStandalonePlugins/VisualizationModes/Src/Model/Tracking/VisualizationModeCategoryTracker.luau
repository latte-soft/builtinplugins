local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Signal);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(script.Parent.VisualizationModeTracker);
local v5 = {};
v5.__index = v5;
v5.new = function(v6)
    local v7 = false;
    if typeof(v6) == "Instance" then
        v7 = v6:IsA("VisualizationModeCategory");
    end;
    assert(v7, "Bad visualizationModeCategory");
    local v8 = setmetatable({}, v5);
    v8._maid = v1.new();
    v8._visualizationModeCategory = v6;
    v8._visualizationModeTrackers = {};
    v8._state = nil;
    v8.changed = v2.new();
    v8:_startTracking();
    return v8;
end;
v5.getState = function(v9)
    return v9._state;
end;
v5._setState = function(v10, v11)
    if v10._state == v11 then
        return ;
    else
        v10._state = v11;
        v10.changed:Fire(v11);
        return ;
    end;
end;
v5._startTracking = function(v12)
    v12._maid:giveTask(v12._visualizationModeCategory.ChildAdded:Connect(function(v13)
        v12:_handleChildAdded(v13);
    end));
    v12._maid:giveTask(v12._visualizationModeCategory.ChildRemoved:Connect(function(v14)
        v12._maid[v14] = nil;
    end));
    v12._maid:giveTask(v12._visualizationModeCategory:GetPropertyChangedSignal("Title"):Connect(function()
        v12:_queueUpdateState();
    end));
    v12._maid:giveTask(v12._visualizationModeCategory:GetPropertyChangedSignal("Enabled"):Connect(function()
        v12:_queueUpdateState();
    end));
    for _, v16 in v12._visualizationModeCategory:GetChildren() do
        v12:_handleChildAdded(v16);
    end;
    v12:_queueUpdateState();
end;
v5._queueUpdateState = function(v17)
    if not v17._maid._stateUpdateQueue then
        v17._maid._stateUpdateQueue = task.defer(function()
            v17._maid._stateUpdateQueue = nil;
            v17:_updateState();
        end);
        return ;
    else
        return ;
    end;
end;
v5._updateState = function(v18)
    local v19 = {};
    for _, v21 in v18._visualizationModeTrackers, nil, nil do
        local v22 = v21:getState();
        if v22 then
            table.insert(v19, v22);
        end;
    end;
    v18:_setState(table.freeze({
        visualizationModeList = v19, 
        name = v18._visualizationModeCategory.Name, 
        title = v18._visualizationModeCategory.Title, 
        enabled = v18._visualizationModeCategory.Enabled, 
        lastUpdateTimeUnixTimeStamp = DateTime.now().UnixTimestamp
    }));
end;
v5.updateVisualizationModeIsEnabled = function(v23, v24, v25)
    for _, v27 in v23._visualizationModeTrackers, nil, nil do
        local v28 = v27:getState();
        if v28 ~= nil and v28.name == v24 then
            v27:updateVisualizationModeIsEnabled(v25);
        end;
    end;
end;
v5.setIsCategoryEnabled = function(v29, v30)
    v29._visualizationModeCategory.Enabled = v30;
end;
v5._handleChildAdded = function(v31, v32)
    if v32:IsA("VisualizationMode") then
        local v33 = v1.new();
        local v34 = v33:add(v4.new(v32));
        table.insert(v31._visualizationModeTrackers, v34);
        v33:giveTask(v34.changed:Connect(function()
            v31:_queueUpdateState();
        end));
        v33:giveTask(function()
            local v35 = table.find(v31._visualizationModeTrackers, v34);
            if v35 then
                table.remove(v31._visualizationModeTrackers, v35);
                v31:_queueUpdateState();
            end;
        end);
        v31._maid[v32] = v33;
        v31:_queueUpdateState();
        return ;
    else
        return ;
    end;
end;
v5.destroy = function(v36)
    v36._maid:destroy();
end;
return v5;
