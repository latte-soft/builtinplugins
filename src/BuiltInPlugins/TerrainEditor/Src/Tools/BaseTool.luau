local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Storage_0 = require(l_script_FirstAncestor_0.Src.Types).Storage;
local v3 = require(l_script_FirstAncestor_0.Src.Util.SettingsHelper);
local l_Signal_0 = v1.Util.Signal;
local v5 = require(l_script_FirstAncestor_0.Src.Schemas.Settings);
local v6 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsHelper);
local v8 = require(l_script_FirstAncestor_0.Src.Util.deepJoinWithExceptions);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorBrushPerformanceEnhancements);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorCompactMode);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorDoNotSetSetting);
local v14 = {};
v14.__index = v14;
v14.new = function(v15, v16, v17, v18, v19)
    local v20 = {
        _name = v16, 
        _category = v17, 
        _configuration = v18, 
        _gizmos = v19
    };
    setmetatable(v20, v15);
    v15.__index = v15;
    return v20;
end;
v14.init = function(v21, v22, v23)
    local l_Analytics_0 = v22.Analytics;
    local l_Localization_0 = v22.Localization;
    local l_PluginController_0 = v22.PluginController;
    local l_ShortcutController_0 = v22.ShortcutController;
    local l_Stylizer_0 = v22.Stylizer;
    local l_ToolController_0 = v22.ToolController;
    local v30, v31 = v21:registerSettings(l_PluginController_0);
    l_PluginController_0:setSetting(v21._name, v30);
    v21._analytics = l_Analytics_0;
    v21._localization = l_Localization_0;
    v21._pluginController = l_PluginController_0;
    v21._shortcutController = l_ShortcutController_0;
    v21._stylizer = l_Stylizer_0;
    v21._toolController = l_ToolController_0;
    v21._services = v23;
    v21._tile = {
        icon = {
            Image = ("%*.png"):format("rbxasset://studio_svg_textures/Lua/TerrainEditor/%s/Large/" .. v21._name)
        }, 
        name = l_Localization_0:getText("BaseTool", v21._name)
    };
    v21._persistentUserSettings = v30;
    v21._sessionUserSettings = v31;
    v21._overrides = {};
    v21._errors = {};
    v21._isRunning = false;
    v21._validateFunctions = {};
    v21.OnFormChanged = l_Signal_0.new();
    v21.OnGizmoChanged = l_Signal_0.new();
    v21.OnInternalsChanged = l_Signal_0.new();
    v21.OnNoteChanged = l_Signal_0.new();
    v21.OnShortcutChanged = l_Signal_0.new();
    v21.OnOperationChanged = l_Signal_0.new();
    v21._shortcutConnections = {};
    v21._shortcuts = {};
    v21:registerShortcuts();
    return v21;
end;
v14.registerSettings = function(v32, v33)
    local v34 = if not v6.IsDebuggingSavedSettings then v33:getSetting(v32._name) else nil or {};
    local v35 = {};
    for _, v37 in v32._configuration, nil, nil do
        if v34[v37.Id] then
            for v38, _ in v34[v37.Id], nil, nil do
                if not v37.Defaults[v38] then
                    v34[v37.Id][v38] = nil;
                end;
            end;
        else
            v34[v37.Id] = v37.Defaults;
        end;
        local l_Storage_1 = v5[v37.Id].Storage;
        v35[v37.Id] = {};
        for v41, v42 in v37.Defaults, nil, nil do
            if l_Storage_1[v41] == l_Storage_0.LocalSession then
                v35[v37.Id][v41] = v42;
            elseif not v34[v37.Id][v41] or typeof(v34[v37.Id][v41]) ~= typeof(v42) then
                v34[v37.Id][v41] = v42;
            end;
        end;
    end;
    return v34, v35;
end;
v14.registerShortcuts = function(v43)
    for v44, v45 in (v43:getPayload()), nil, nil do
        for v46, _ in v45, nil, nil do
            if v43._shortcutController:supportsShortcut(v46) then
                if not v43._shortcuts[v44] then
                    v43._shortcuts[v44] = {};
                end;
                table.insert(v43._shortcuts[v44], v46);
            end;
        end;
    end;
end;
v14.empty = function()
    return (setmetatable({
        _configuration = {}, 
        _name = "Empty"
    }, v14));
end;
v14.getPayload = function(v48)
    local v49 = {};
    for _, v51 in v48._configuration, nil, nil do
        v49[v51.Id] = v3.Get(v51.Id, v48._pluginController, v48._persistentUserSettings[v51.Id], v48._sessionUserSettings[v51.Id]);
    end;
    return v49;
end;
v14.setPayload = function(v52, v53)
    local v54 = false;
    for v55, v56 in v53, nil, nil do
        if v5[v55] then
            local v57, v58 = v3.Set(v55, v52._pluginController, v56);
            v52._persistentUserSettings[v55] = if not v52._persistentUserSettings[v55] then v57 else v8(v52._persistentUserSettings[v55], v57);
            v52._sessionUserSettings[v55] = if not v52._sessionUserSettings[v55] then v58 else v8(v52._sessionUserSettings[v55], v58);
            v54 = v54 or next(v57) ~= nil;
        end;
    end;
    if not v11() or not v54 then
        if not v13() then
            v52._pluginController:setSetting(v52._name, v52._persistentUserSettings);
        end;
        return ;
    else
        if v52._saveSettingsTask then
            task.cancel(v52._saveSettingsTask);
            v52._saveSettingsTask = nil;
        end;
        v52._saveSettingsTask = task.delay(1, function()
            v52._pluginController:setSetting(v52._name, v52._persistentUserSettings);
            v52._saveSettingsTask = nil;
        end);
        return ;
    end;
end;
v14.getShouldBeCompact = function(v59)
    return v59._pluginController:getShouldBeCompact();
end;
v14.form = function(v60)
    return ((function(v61)
        local v62 = {};
        for _, v64 in v61, nil, nil do
            local l_Id_0 = v64.Id;
            table.insert(v62, {
                Id = l_Id_0, 
                Label = v60._localization:getText("Category", v64.Id), 
                Children = v5[l_Id_0].Generator({
                    Localization = v60._localization, 
                    Stylizer = v60._stylizer, 
                    Tool = if not v10() then nil else v60
                }, v3.Get(v64.Id, v60._pluginController, v60._persistentUserSettings[v64.Id], v60._sessionUserSettings[v64.Id]), v60._name, v60._overrides[v64.Id] or {})
            });
        end;
        return v62;
    end)(v60._configuration));
end;
v14.gizmos = function(v66)
    local v67 = {};
    local v68 = v66:getPayload();
    for _, v70 in v66._gizmos, nil, nil do
        table.insert(v67, {
            Id = v70.Id, 
            Schema = v70.Schema, 
            Value = v68
        });
    end;
    return v67;
end;
v14.saveForm = function(v71, v72)
    v71:setPayload(v72);
    if v10() then
        v71:setDisabledState();
    end;
    task.spawn(function()
        v71.OnFormChanged:Fire();
    end);
end;
v14.saveGizmos = function(v73, v74)
    v73:setPayload(v74);
    if v10() then
        v73:setDisabledState();
    end;
    task.spawn(function()
        v73.OnGizmoChanged:Fire();
    end);
end;
v14.checkDisabledState = function(v75)
    for _, v77 in (v75:form()), nil, nil do
        for _, v79 in v77.Children, nil, nil do
            if not (not v79.Validate or not v79.Value) then
                v79.Validate(v79.Value);
            end;
        end;
    end;
end;
v14.getCategory = function(v80)
    return v80._category;
end;
v14.getTile = function(v81)
    return v81._tile;
end;
v14.activateShortcuts = function(v82)
    local v83 = v82:getPayload();
    for v84, v85 in v82._shortcuts, nil, nil do
        for _, v87 in v85, nil, nil do
            table.insert(v82._shortcutConnections, v82._shortcutController:registerShortcut(v87, v83[v84][v87], function(v88)
                v82:setPayload({
                    [v84] = {
                        [v87] = v88
                    }
                });
                task.spawn(function()
                    v82.OnShortcutChanged:Fire();
                end);
            end));
        end;
    end;
    v82._refreshShortcuts = v82.OnFormChanged:Connect(function()
        v82:deactivateShortcuts();
        v82:activateShortcuts();
    end);
end;
v14.deactivateShortcuts = function(v89)
    for _, v91 in v89._shortcutConnections, nil, nil do
        for _, v93 in v91, nil, nil do
            v93:Disconnect();
        end;
    end;
    if v89._refreshShortcuts then
        v89._refreshShortcuts:Disconnect();
    end;
end;
v14.activate = function(v94)
    v94:activateShortcuts();
    if v10() then
        v94:setDisabledState();
        v94:checkDisabledState();
    end;
    v94._compactConnection = if not v12() then nil else v94._pluginController.Compact:Connect(function()
        task.spawn(function()
            v94.OnInternalsChanged:Fire();
        end);
    end);
end;
v14.reportAnalytics = function(_)
end;
v14.deactivate = function(v96)
    v96:deactivateShortcuts();
    v96:reportAnalytics();
    if v96._compactConnection then
        v96._compactConnection:Disconnect();
    end;
end;
v14.startOperation = function(v97, _)
    if v10() then
        v97._isRunning = true;
        v97:setDisabledState();
    end;
end;
v14.operation = function(_)
end;
if v10() then
    v14.reportError = function(v100, v101, v102, _)
        if not v100._errors[v101] then
            v100._errors[v101] = {};
        end;
        v100._errors[v101][v102] = true;
        v100:setDisabledState();
    end;
    v14.clearError = function(v104, v105, v106)
        if v104._errors[v105] then
            v104._errors[v105][v106] = nil;
            if next(v104._errors[v105]) == nil then
                v104._errors[v105] = nil;
            end;
            v104:setDisabledState();
            return ;
        else
            return ;
        end;
    end;
    v14.hasError = function(v107)
        local v108 = true;
        if next(v107._errors) == nil then
            v108 = v107._isRunning;
        end;
        return v108;
    end;
    v14.setValidateFunction = function(v109, v110, v111, v112)
        if not v109._validateFunctions[v110] then
            v109._validateFunctions[v110] = {};
        end;
        v109._validateFunctions[v110][v111] = v112;
    end;
    v14.getValidateFunction = function(v113, v114, v115)
        if v113._validateFunctions[v114] then
            return v113._validateFunctions[v114][v115];
        else
            return ;
        end;
    end;
    v14.setDisabledState = function(_)
    end;
end;
if v9() then
    v14.finishOperation = function(v117)
        if v10() then
            v117._isRunning = false;
        end;
        if not v117._operation:wasCanceled() then
            v117._analytics:report("RegionProperties", v7.getRegionPayload(v117:getPayload(), v117._operation:getTimeTaken(), v117._name));
            v117._analytics:report("Usage", v117._name, 1);
            local v118 = v117._operation:getTimeStatistic();
            if v118 then
                v117._analytics:report("Performance", v117._name, v118);
            end;
            if v117._operationFinishedConnection then
                v117._operationFinishedConnection:Disconnect();
                v117._operationFinishedConnection = nil;
            end;
        end;
        if v10() then
            v117:setDisabledState();
        end;
    end;
end;
v14.note = function(_)
end;
return v14;
