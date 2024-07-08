local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local _ = require(l_script_FirstAncestor_0.Src.Model.Tracking.VisualizationModeServiceTracker);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6)
    local v7 = setmetatable({}, v4);
    v7._maid = v2.new();
    v7._visualizationModeServiceTracker = assert(v6, "No tracker");
    v7._plugin = assert(v5, "No plugin");
    v7:_setupStateBinding();
    v7:_bindRemoteRequests();
    return v7;
end;
v4._bindRemoteRequests = function(v8)
    v8._maid:giveTask(v8._plugin:OnInvoke("updateVisualizationModeIsEnabled", function(v9, v10, v11)
        assert(typeof(v9) == "string", "Bad visualizationModeCategoryName");
        assert(typeof(v10) == "string", "Bad visualizationModeName");
        assert(typeof(v11) == "boolean", "Bad isEnabled");
        v8._visualizationModeServiceTracker:updateVisualizationModeIsEnabled(v9, v10, v11);
    end));
    v8._maid:giveTask(v8._plugin:OnInvoke("updateVisualizationModeCategoryIsEnabled", function(v12, v13)
        assert(typeof(v12) == "string", "Bad visualizationModeCategoryName");
        assert(typeof(v13) == "boolean", "Bad isEnabled");
        v8._visualizationModeServiceTracker:updateVisualizationModeCategoryIsEnabled(v12, v13);
    end));
end;
v4._setupStateBinding = function(v14)
    v14._maid:giveTask(v14._visualizationModeServiceTracker.changed:Connect(function()
        v14:_reportCombinerClientState();
    end));
    v14._maid:giveTask(v14._plugin:OnInvoke("queryClientCombinerState", function()
        v14:_reportCombinerClientState();
    end));
    v14._maid:giveTask(v14._plugin:GetPropertyChangedSignal("HostDataModelType"):Connect(function()
        v14:_reportCombinerClientState();
    end));
    v14._maid:giveTask(function()
        v14:_reportCombinerClientClosingState();
    end);
    v14:_reportCombinerClientState();
end;
v4._reportCombinerClientState = function(v15)
    local v16 = v15._visualizationModeServiceTracker:getState();
    if v16 == nil then
        return ;
    else
        v15._plugin:Invoke("reportClientCombinerState", {
            visualizationModeServiceState = v16, 
            hostDataModelType = v15._plugin.HostDataModelType
        });
        return ;
    end;
end;
v4._reportCombinerClientClosingState = function(v17)
    v17._plugin:Invoke("reportClientCombinerState", {
        visualizationModeServiceState = {}, 
        hostDataModelType = v17._plugin.HostDataModelType
    });
end;
v4.destroy = function(v18)
    v18._maid:destroy();
end;
return v4;
