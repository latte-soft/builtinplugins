local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local l_VisualizationModeService_0 = game:GetService("VisualizationModeService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Signal);
local v5 = require(script.Parent.VisualizationModeCategoryTracker);
local v6 = {};
v6.__index = v6;
v6.new = function()
    local v7 = setmetatable({}, v6);
    v7._maid = v3.new();
    v7._categoryTrackers = {};
    v7._state = nil;
    v7.changed = v7._maid:add(v4.new());
    v7:_startTracking();
    return v7;
end;
v6.getState = function(v8)
    return v8._state;
end;
v6._setState = function(v9, v10)
    if v9._state == v10 then
        return ;
    else
        v9._state = v10;
        v9.changed:Fire(v10);
        return ;
    end;
end;
v6._startTracking = function(v11)
    v11._maid:giveTask(l_VisualizationModeService_0.ChildAdded:Connect(function(v12)
        v11:_handleChildAdded(v12);
    end));
    v11._maid:giveTask(l_VisualizationModeService_0.ChildRemoved:Connect(function(v13)
        v11._maid[v13] = nil;
    end));
end;
v6.updateVisualizationModeIsEnabled = function(v14, v15, v16, v17)
    for _, v19 in v14._categoryTrackers, nil, nil do
        local v20 = v19:getState();
        if v20 ~= nil and v20.name == v15 then
            v19:updateVisualizationModeIsEnabled(v16, v17);
        end;
    end;
end;
v6.updateVisualizationModeCategoryIsEnabled = function(v21, v22, v23)
    for _, v25 in v21._categoryTrackers, nil, nil do
        local v26 = v25:getState();
        if v26 ~= nil and v26.name == v22 then
            v25:setIsCategoryEnabled(v23);
        end;
    end;
end;
v6._handleChildAdded = function(v27, v28)
    if v28:IsA("VisualizationModeCategory") then
        local v29 = v3.new();
        local v30 = v29:add(v5.new(v28));
        v29:giveTask(v30.changed:Connect(function()
            v27:_queueUpdateState();
        end));
        table.insert(v27._categoryTrackers, v30);
        v29:giveTask(function()
            local v31 = table.find(v27._categoryTrackers, v30);
            if v31 then
                table.remove(v27._categoryTrackers, v31);
            end;
            v27:_queueUpdateState();
        end);
        v27._maid[v28] = v29;
        v27:_queueUpdateState();
        return ;
    else
        return ;
    end;
end;
v6._queueUpdateState = function(v32)
    if not v32._maid._stateUpdateQueue then
        v32._maid._stateUpdateQueue = task.defer(function()
            v32._maid._stateUpdateQueue = nil;
            v32:_updateState();
        end);
        return ;
    else
        return ;
    end;
end;
v6._updateState = function(v33)
    local v34 = {};
    for _, v36 in v33._categoryTrackers, nil, nil do
        local v37 = v36:getState();
        if v37 then
            table.insert(v34, v37);
        end;
    end;
    table.sort(v34, function(v38, v39)
        return v38.title < v39.title;
    end);
    v33:_setState(table.freeze(v34));
end;
v6.destroy = function(v40)
    v40._maid:destroy();
end;
return v6;
