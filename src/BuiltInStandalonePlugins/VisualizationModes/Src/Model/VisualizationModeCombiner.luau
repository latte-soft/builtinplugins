local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Signal);
local v6 = {};
v6.__index = v6;
local function _(v7)
    local v8 = false;
    if typeof(v7) == "table" then
        v8 = false;
        if typeof(v7.visualizationModeCategoryName) == "string" then
            v8 = false;
            if typeof(v7.visualizationModeName) == "string" then
                v8 = typeof(v7.lastEditUnixTimeStamp) == "number";
            end;
        end;
    end;
    return v8;
end;
local function _(v10, v11)
    local v12 = false;
    if v10.visualizationModeCategoryName == v11.visualizationModeCategoryName then
        v12 = v10.visualizationModeName == v11.visualizationModeName;
    end;
    return v12;
end;
v6.new = function(v14)
    local v15 = setmetatable({}, v6);
    v15._maid = v4.new();
    v15._plugin = assert(v14, "No plugin");
    v15._recentModeRecordList = {};
    v15._lastReportedClientCombinerStateMap = {};
    v15._state = nil;
    v15._session = nil;
    v15.changed = v15._maid:add(v5.new());
    v15:_connectToFocusedDataModelSession();
    v15._maid:giveTask(v15._plugin:OnInvoke("reportClientCombinerState", function(v16)
        v15._lastReportedClientCombinerStateMap[v16.hostDataModelType] = v16;
        v15:_queueUpdateState();
    end));
    v15:_loadRecentRecords();
    v15._plugin:Invoke("queryClientCombinerState");
    return v15;
end;
v6._queueUpdateState = function(v17)
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
v6._updateState = function(v18)
    local v19 = {};
    local l_None_0 = Enum.StudioDataModelType.None;
    if v18._session ~= nil then
        l_None_0 = v18._session.CurrentDataModelType;
    end;
    for v21, v22 in v18._lastReportedClientCombinerStateMap, nil, nil do
        for _, v24 in v22.visualizationModeServiceState, nil, nil do
            local v25 = v19[v24.name];
            if v25 == nil then
                v25 = {
                    lastState = v24, 
                    visualizationModes = {}
                };
                v19[v24.name] = v25;
            end;
            if v21 == l_None_0 then
                v25.lastState = v24;
            end;
            for _, v27 in v24.visualizationModeList, nil, nil do
                v25.visualizationModes[v27.name] = v27;
            end;
        end;
    end;
    local v28 = {};
    for _, v30 in v19, nil, nil do
        table.insert(v28, v30.lastState);
    end;
    table.sort(v28, function(v31, v32)
        return v31.title < v32.title;
    end);
    local v33 = {};
    for _, v35 in v18._recentModeRecordList, nil, nil do
        local v36 = v19[v35.visualizationModeCategoryName];
        if v36 ~= nil then
            local v37 = v36.visualizationModes[v35.visualizationModeName];
            if v37 ~= nil then
                local v38 = table.clone(v37);
                v38.visualizationModeCategoryName = v35.visualizationModeCategoryName;
                table.insert(v33, v38);
            end;
        end;
    end;
    v18:_setState(table.freeze({
        categories = v28, 
        recentModes = table.freeze(v33)
    }));
end;
v6._setState = function(v39, v40)
    if v39._state == v40 then
        return ;
    else
        v39._state = v40;
        v39.changed:Fire(v40);
        return ;
    end;
end;
v6.getState = function(v41)
    return v41._state;
end;
v6.updateVisualizationModeCategoryIsEnabled = function(v42, v43, v44)
    v42._plugin:Invoke("updateVisualizationModeCategoryIsEnabled", v43, v44);
    for v45, v46 in v42._lastReportedClientCombinerStateMap, nil, nil do
        v42._lastReportedClientCombinerStateMap[v45] = v2.Dictionary.join(v46, {
            visualizationModeServiceState = v3.map(v46.visualizationModeServiceState, function(v47)
                if v47.name ~= v43 then
                    return v47;
                else
                    return v2.Dictionary.join(v47, {
                        enabled = v44
                    });
                end;
            end)
        });
    end;
    v42:_queueUpdateState();
end;
v6.updateVisualizationModeIsEnabled = function(v48, v49, v50, v51)
    v48._plugin:Invoke("updateVisualizationModeIsEnabled", v49, v50, v51);
    for v52, v53 in v48._lastReportedClientCombinerStateMap, nil, nil do
        v48._lastReportedClientCombinerStateMap[v52] = v2.Dictionary.join(v53, {
            visualizationModeServiceState = v3.map(v53.visualizationModeServiceState, function(v54)
                if v54.name ~= v49 then
                    return v54;
                else
                    return v2.Dictionary.join(v54, {
                        visualizationModeList = v3.map(v54.visualizationModeList, function(v55)
                            if v55.name ~= v50 then
                                return v55;
                            else
                                return v2.Dictionary.join(v55, {
                                    enabled = v51
                                });
                            end;
                        end)
                    });
                end;
            end)
        });
    end;
    v48:_queueUpdateState();
end;
v6._loadRecentRecords = function(v56)
    local l_Setting_0 = v56._plugin:GetSetting("RecentVisualizationModes");
    if typeof(l_Setting_0) ~= "table" then
        return ;
    else
        local v58 = {};
        for _, v60 in l_Setting_0, nil, nil do
            local v61 = false;
            if typeof(v60) == "table" then
                v61 = false;
                if typeof(v60.visualizationModeCategoryName) == "string" then
                    v61 = false;
                    if typeof(v60.visualizationModeName) == "string" then
                        v61 = typeof(v60.lastEditUnixTimeStamp) == "number";
                    end;
                end;
            end;
            if v61 then
                table.insert(v58, v60);
            end;
        end;
        table.sort(v58, function(v62, v63)
            return v63.lastEditUnixTimeStamp < v62.lastEditUnixTimeStamp;
        end);
        while #v58 > 3 do
            table.remove(v58);
        end;
        v56._recentModeRecordList = v58;
        v56:_queueUpdateState();
        return ;
    end;
end;
v6._connectToFocusedDataModelSession = function(v64)
    local l_MultipleDocumentInterfaceInstance_0 = v64._plugin.MultipleDocumentInterfaceInstance;
    if l_MultipleDocumentInterfaceInstance_0 == nil then
        return ;
    else
        local l_FocusedDataModelSession_0 = l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession;
        if l_FocusedDataModelSession_0 == nil then
            return ;
        else
            v64._session = l_FocusedDataModelSession_0;
            v64._maid:giveTask(l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(function()
                v64:_queueUpdateState();
            end));
            return ;
        end;
    end;
end;
v6.recordRecentVisualizationMode = function(v67, v68, v69)
    local v70 = {
        visualizationModeCategoryName = v68, 
        visualizationModeName = v69, 
        lastEditUnixTimeStamp = DateTime.now().UnixTimestamp
    };
    local v71 = nil;
    local v72 = nil;
    for v73, v74 in v67._recentModeRecordList, nil, nil do
        local v75 = false;
        if v74.visualizationModeCategoryName == v70.visualizationModeCategoryName then
            v75 = v74.visualizationModeName == v70.visualizationModeName;
        end;
        if not v75 then
            if v72 == nil then
                v72 = v73;
            elseif v74.lastEditUnixTimeStamp < v67._recentModeRecordList[v72].lastEditUnixTimeStamp then
                v72 = v73;
            end;
        else
            v71 = v73;
        end;
    end;
    local v76 = nil;
    v76 = if v71 ~= nil then v71 else if #v67._recentModeRecordList >= 3 and v72 ~= nil then v72 else #v67._recentModeRecordList + 1;
    local v77 = table.clone(v67._recentModeRecordList);
    v77[v76] = v70;
    v67._recentModeRecordList = table.freeze(v77);
    v67._plugin:SetSetting("RecentVisualizationModes", v77);
    v67:_queueUpdateState();
end;
v6.destroy = function(v78)
    v78._maid:destroy();
end;
return v6;
