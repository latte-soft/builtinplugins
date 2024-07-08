local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v2.ContextServices.ContextItem;
local l_join_0 = v2.Dash.join;
local l_keys_0 = v2.Dash.keys;
local l_findIndex_0 = v2.Dash.findIndex;
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetActiveQueueItem);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetCurrentPreset);
local v9 = require(l_script_FirstAncestor_0.Src.Actions.SetSettingsChanged);
local v10 = require(l_script_FirstAncestor_0.Src.Actions.SetSessionQueue);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateSessionInfo);
local v12 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateChecked);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local v14 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFIntAssetImportMaxPresetCount);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
local v17 = l_ContextItem_0:extend("PresetController");
v17.new = function(v18, v19, v20, v21)
    local v22 = setmetatable({
        lastImportName = v20:getText("Templates", "LastImported"), 
        studioDefaultName = v20:getText("Templates", "StudioDefault"), 
        defaultName = "", 
        _assetImportServiceWrapper = wrapAssetImportService(v21), 
        _plugin = v18, 
        _store = v19, 
        _localization = v20, 
        _mock = v21
    }, v17);
    v22.defaultName = if not v21 and v22._plugin:GetSetting("AssetImporter_DefaultPreset") then v22._plugin:GetSetting("AssetImporter_DefaultPreset") else v22.studioDefaultName;
    return v22;
end;
wrapAssetImportService = function(v23)
    if not v23 then
        return game:GetService("AssetImportService");
    else
        local v24 = {};
        return {
            GetPreset = function(_, v26)
                return v24[v26] or {};
            end, 
            GetAllPresets = function(_)
                return v24;
            end, 
            SavePreset = function(_, v29)
                v24[v29] = {};
                return true;
            end, 
            RemovePreset = function(_, v31)
                v24[v31] = nil;
            end, 
            _clearPresets = function()
                v24 = {};
            end
        };
    end;
end;
v17.mock = function(v32)
    return v17.new({
        SetSetting = function(_, _)
        end
    }, v32, {
        getText = function(_, _, v37, _)
            return v37;
        end
    }, true);
end;
v17.destroy = function(v39)
    if v39.mock then
        v39._assetImportServiceWrapper:_clearPresets();
    end;
    v39.defaultName = "";
end;
v17._filter = function(_, v41)
    v41.Material = nil;
    for _, v43 in v41, nil, nil do
        v43.ImportName = nil;
        v43.ShouldImport = nil;
    end;
end;
v17.save = function(v44, v45)
    if not v44:isStudioDefault(v45) and not v44:isLastImport(v45) then
        local l_PresetFromData_0 = v44._store:getState().Preview.assetImportSession:CreatePresetFromData(v44._store:getState().Preview.selectedImportItem);
        v44:_filter(l_PresetFromData_0);
        local v47 = l_join_0(v44._assetImportServiceWrapper:GetPreset(v45), l_PresetFromData_0);
        v44._store:dispatch(v9(false));
        if not v16() then
            v44._store:dispatch(v8(v45));
        else
            local v48 = v14.update(v44._store:getState().Preview.activeQueueItem, {
                currentPreset = v45
            });
            v44._store:dispatch(v11(v48));
            v44._store:dispatch(v7(v48));
        end;
        return v44._assetImportServiceWrapper:SavePreset(v45, v47);
    else
        return false;
    end;
end;
v17.createPresetFromLastImport = function(v49, v50)
    local l_PresetFromData_1 = v49._store:getState().Preview.assetImportSession:CreatePresetFromData(v50);
    v49:_filter(l_PresetFromData_1);
    v49._assetImportServiceWrapper:SavePreset("Last Imported", l_PresetFromData_1);
end;
v17._updateQueueItems = function(v52, v53, v54)
    local v55 = v52._store:getState();
    local l_sessionQueue_0 = v55.Sessions.sessionQueue;
    local v57 = {};
    for v58, v59 in l_sessionQueue_0, nil, nil do
        if v59.currentPreset == v54 then
            v57[v58] = v14.update(v59, {
                currentPreset = v53
            });
        else
            v57[v58] = v59;
        end;
    end;
    v52._store:dispatch(v10(v57));
    if v55.Dialogs.showPreview then
        v52._store:dispatch(v7(v57[v55.Preview.activeQueueItem.filepath]));
    end;
end;
v17.rename = function(v60, v61, v62)
    local l__assetImportServiceWrapper_0 = v60._assetImportServiceWrapper;
    local l_l__assetImportServiceWrapper_0_Preset_0 = l__assetImportServiceWrapper_0:GetPreset(v62);
    l__assetImportServiceWrapper_0:RemovePreset(v62);
    l__assetImportServiceWrapper_0:SavePreset(v61, l_l__assetImportServiceWrapper_0_Preset_0);
    if v60.defaultName == v62 then
        v60._plugin:SetSetting("AssetImporter_DefaultPreset", v61);
        v60.defaultName = v61;
    end;
    v60:_updateQueueItems(v61, v62);
end;
v17.DEPRECATED_rename = function(v65, v66)
    local l_currentPreset_0 = v65._store:getState().Preview.currentPreset;
    local l__assetImportServiceWrapper_1 = v65._assetImportServiceWrapper;
    local l_l__assetImportServiceWrapper_1_Preset_0 = l__assetImportServiceWrapper_1:GetPreset(l_currentPreset_0);
    l__assetImportServiceWrapper_1:RemovePreset(l_currentPreset_0);
    l__assetImportServiceWrapper_1:SavePreset(v66, l_l__assetImportServiceWrapper_1_Preset_0);
    if v65.defaultName == l_currentPreset_0 then
        v65._plugin:SetSetting("AssetImporter_DefaultPreset", v66);
        v65.defaultName = v66;
    end;
    v65._store:dispatch(v8(v66));
end;
v17.delete = function(v70, v71)
    v70._assetImportServiceWrapper:RemovePreset(v71);
    if not v16() then
        v70._store:dispatch(v8(v70.studioDefaultName));
    else
        if v71 == v70.defaultName then
            v70.defaultName = v70.studioDefaultName;
        end;
        v70:_updateQueueItems(v70.defaultName, v71);
    end;
    v70._store:dispatch(v9(true));
end;
v17.setDefault = function(v72, v73)
    v72._plugin:SetSetting("AssetImporter_DefaultPreset", v73);
    v72.defaultName = v73;
end;
v17.hasCustomDefault = function(v74)
    local v75 = false;
    if v74.defaultName ~= "" then
        v75 = v74.defaultName ~= v74.studioDefaultName;
    end;
    return v75;
end;
v17.applyImportDataToSession = function(v76, v77)
    if not v16() or v76._store:getState().Dialogs.showPreview then
        local l_v77_PresetFromData_0 = v77:CreatePresetFromData();
        for _, v80 in l_v77_PresetFromData_0, nil, nil do
            v80.ImportName = nil;
        end;
        if not v16() then
            v76._store:getState().Preview.assetImportSession:ApplyPreset(l_v77_PresetFromData_0);
            return ;
        else
            local l_activeQueueItem_0 = v76._store:getState().Preview.activeQueueItem;
            l_activeQueueItem_0.session:ApplyPreset(l_v77_PresetFromData_0);
            v76._store:dispatch(v11(l_activeQueueItem_0));
            return ;
        end;
    else
        return ;
    end;
end;
v17.isDefault = function(v82, v83)
    return v82.defaultName == v83;
end;
v17.isLastImport = function(v84, v85)
    local v86 = true;
    if v84.lastImportName ~= v85 then
        v86 = v85 == "Last Imported";
    end;
    return v86;
end;
v17.isStudioDefault = function(v87, v88)
    local v89 = true;
    if v87.studioDefaultName ~= v88 then
        v89 = v88 == "Studio Default";
    end;
    return v89;
end;
v17.resolvePreset = function(v90, v91, v92)
    local l_session_0 = v92.session;
    if l_session_0 and l_session_0:GetImportTree() then
        l_session_0:Reset();
        l_session_0:ApplyPreset(if not v90:isLastImport(v91) then v90._assetImportServiceWrapper:GetPreset(v91) else v90._assetImportServiceWrapper:GetPreset(v90.lastImportName));
        local v94 = v14.update(v92, {
            currentPreset = v91
        });
        if v90._store:getState().Dialogs.showPreview then
            local v95 = {};
            for v96, _ in v90._store:getState().Preview.importDataChecked, nil, nil do
                v95[v96] = v96.ShouldImport;
            end;
            v90._store:dispatch(v12(v95));
            local l_selectedImportItem_0 = v90._store:getState().Preview.selectedImportItem;
            if l_selectedImportItem_0 then
                v90._store:dispatch(v13((l_selectedImportItem_0:GetPreview())));
            end;
            v90._store:dispatch(v9(false));
            v90._store:dispatch(v7(v94));
        end;
        v90._store:dispatch(v11(v94));
        return ;
    else
        return ;
    end;
end;
v17.DEPRECATED_resolvePreset = function(v99, v100)
    assert(not v16());
    local l_assetImportSession_0 = v99._store:getState().Preview.assetImportSession;
    if l_assetImportSession_0 and (not v16() or l_assetImportSession_0:GetImportTree()) then
        assert(l_assetImportSession_0, "Session does not exist");
        l_assetImportSession_0:Reset();
        v99._store:dispatch(v8(v100));
        local _ = nil;
        l_assetImportSession_0:ApplyPreset(if not v99:isLastImport(v100) then v99._assetImportServiceWrapper:GetPreset(v100) else v99._assetImportServiceWrapper:GetPreset(v99.lastImportName));
        local v103 = {};
        for v104, _ in v99._store:getState().Preview.importDataChecked, nil, nil do
            v103[v104] = v104.ShouldImport;
        end;
        v99._store:dispatch(v12(v103));
        local l_selectedImportItem_1 = v99._store:getState().Preview.selectedImportItem;
        if l_selectedImportItem_1 then
            v99._store:dispatch(v13((l_selectedImportItem_1:GetPreview())));
        end;
        v99._store:dispatch(v9(false));
        return ;
    else
        return ;
    end;
end;
v17.getNameList = function(v107, v108)
    local v109 = l_keys_0(v107:getAllPresets());
    local l_settingsChanged_0 = v107._store:getState().Preview.settingsChanged;
    local v112 = l_findIndex_0(v109, function(v111)
        return v111 == v108;
    end);
    if not (not v112 or not l_settingsChanged_0) then
        v109[v112] = v108 .. "*";
    end;
    return v109;
end;
v17.getAllPresets = function(v113)
    local l_AllPresets_0 = v113._assetImportServiceWrapper:GetAllPresets();
    if l_AllPresets_0["Last Imported"] then
        local v115 = l_AllPresets_0["Last Imported"];
        l_AllPresets_0["Last Imported"] = nil;
        l_AllPresets_0[v113.lastImportName] = v115;
    end;
    l_AllPresets_0[v113.studioDefaultName] = {};
    return l_AllPresets_0;
end;
v17.initializePresets = function(v116, v117)
    if not v16() then
        local v118 = v116:getNameList();
        local v119 = nil;
        for v120, v121 in v118, nil, nil do
            if v121 == v116.defaultName then
                v119 = v120;
                break;
            end;
        end;
        if not v119 then
            v116._store:dispatch(v8(v116.studioDefaultName));
            return ;
        else
            v116._store:dispatch(v8(v116.defaultName));
            v116:DEPRECATED_resolvePreset(v116.defaultName);
            return ;
        end;
    else
        local l_sessionQueue_1 = v116._store:getState().Sessions.sessionQueue;
        local v123 = table.clone(l_sessionQueue_1);
        for _, v125 in v117, nil, nil do
            local v126 = v14.update(l_sessionQueue_1[v125], {
                currentPreset = v116.defaultName
            });
            if not (not v116:hasCustomDefault() or not v126.validSession) then
                v116:resolvePreset(v116.defaultName, v126);
            end;
            v123[v125] = v126;
        end;
        v116._store:dispatch(v10(v123));
        return ;
    end;
end;
v17.getNumPresetsRemaining = function(v127)
    local v128 = v127:getAllPresets();
    return (v15() - #l_keys_0(v128)) + (not v128[v127.lastImportName] and 0 or 1);
end;
return v17;
