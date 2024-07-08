local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_R15MigDocumentChanges_0 = game:GetFastFlag("R15MigDocumentChanges");
local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local l_PluginDebugService_0 = game:GetService("PluginDebugService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v6 = require(l_Parent_0.Packages.Roact);
local v7 = require(l_Parent_0.Packages.Rodux);
local v8 = require(l_Parent_0.Packages.Framework);
local l_DockWidget_0 = v8.UI.DockWidget;
local l_ContextServices_0 = v8.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local l_CrossPluginCommunication_0 = v8.Util.CrossPluginCommunication;
local v15 = require(l_Parent_0.Src.Actions.SetScriptAnalyticsSent);
local v16 = require(l_Parent_0.Src.Components.MainView);
local v17 = require(l_Parent_0.Src.Components.LoadingScreen);
local v18 = require(l_Parent_0.Src.Components.InitialFlow);
local l_Contexts_0 = l_Parent_0.Src.Contexts;
local v20 = require(l_Contexts_0.ScriptConversionContext);
local v21 = require(l_Contexts_0.NetworkInterface);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v23 = require(l_Thunks_0.OnDiagnosticsUpdated);
local v24 = require(l_Thunks_0.UpdateDiagnosticsRanges);
local v25 = require(l_Thunks_0.ScanAllAnimations);
local v26 = require(l_Thunks_0.ResetAll);
local v27 = require(l_Thunks_0.CheckAvatarType);
local v28 = require(l_Parent_0.Src.Actions.SuccessfullyPublished);
local v29 = require(l_Parent_0.Src.Actions.SetExperienceData);
local v30 = require(l_Parent_0.Src.Actions.SetAllTabsData);
local v31 = require(l_Parent_0.Src.Actions.SetSelectedTab);
local v32 = require(l_Parent_0.Src.Util.ScriptAnalysis.ScriptScanner);
local v33 = require(l_Parent_0.Src.Util.ScriptAnalysis.Constants);
local v34 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local v35 = require(l_Parent_0.Src.Util.PluginSettings);
local v36 = require(l_Parent_0.Src.Util.SaveInterface);
local v37 = require(l_Parent_0.Src.Util.TabsData);
local v38 = require(l_Parent_0.Src.Util.getExperienceData);
local v39 = require(l_Parent_0.Src.Util.getLocalDateTime);
local v40 = require(l_Parent_0.Src.Resources.Constants);
local v41 = require(l_Parent_0.Src.Reducers.MainReducer);
local v42 = require(l_Parent_0.Src.Resources.MakeTheme);
local v43 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v46 = v6.PureComponent:extend("MainPlugin");
v46.initToolbarAndButton = function(v47, v48)
    v47.toolbar = v48.PluginLoaderContext.toolbar;
    v47.mainButton = v48.PluginLoaderContext.mainButton;
    v47.mainButton:SetActive(v47.state.enabled);
    v48.PluginLoaderContext.mainButtonClickedSignal:Connect(v47.toggleEnabled);
end;
v46.init = function(v49, v50)
    v49.state = {
        enabled = false, 
        scanComplete = false, 
        isRescan = false
    };
    v49.setScriptDocumentChangedEnabled = function(v51)
        if not v51 or v49.textDocumentDidChangeConnection then
            if not (v51 or not v49.textDocumentDidChangeConnection) then
                v49.textDocumentDidChangeConnection:Disconnect();
                v49.textDocumentDidChangeConnection = nil;
            end;
            return ;
        else
            v49.textDocumentDidChangeConnection = l_ScriptEditorService_0.TextDocumentDidChange:Connect(v49.onScriptChangedCallback);
            return ;
        end;
    end;
    v49.setScriptAnalysisEnabled = function(v52)
        local v53 = true;
        local v54 = nil;
        if not v52 then
            if l_ScriptEditorService_0:IsScriptAnalysisCallbackRegistered("R15Migrator") then
                local l_status_0, l_result_0 = pcall(function()
                    l_ScriptEditorService_0:DeregisterScriptAnalysisCallback("R15Migrator");
                end);
                v53 = l_status_0;
                v54 = l_result_0;
            end;
        elseif not l_ScriptEditorService_0:IsScriptAnalysisCallbackRegistered("R15Migrator") then
            local l_status_1, l_result_1 = pcall(function()
                l_ScriptEditorService_0:RegisterScriptAnalysisCallback("R15Migrator", 1, v49.onScriptAnalysisCallback);
            end);
            v53 = l_status_1;
            v54 = l_result_1;
        end;
        if not v53 then
            warn(v54);
        end;
    end;
    v49.startScan = function()
        v49.store:dispatch(v25(v49.analytics, v49.networkInterface, function()
            if v49.state.isRescan then
                v49.setScriptAnalysisEnabled(false);
            end;
            v49.setScriptAnalysisEnabled(true);
            v49:setState({
                scanComplete = true
            });
            v49.store:dispatch(v15(false));
            game:GetService("Workspace"):SetAvatarUnificationMode(Enum.AvatarUnificationMode.Enabled);
        end));
    end;
    v49.resetPlugin = function()
        v49:setState({
            isRescan = true, 
            scanComplete = false
        });
        v49.store:dispatch(v26());
    end;
    v49.toggleEnabled = function()
        v49:setState(function(v59)
            return {
                enabled = not v59.enabled
            };
        end);
        if v49.state.enabled then
            v34.StartTime = os.time();
            if l_R15MigDocumentChanges_0 then
                v49.setScriptDocumentChangedEnabled(true);
            end;
        end;
        if not (not v49.state.scanComplete and v49.state.enabled) then
            v49.setScriptAnalysisEnabled(v49.state.enabled);
        end;
    end;
    v49.onClose = function()
        v49:setState({
            enabled = false
        });
        v49.setScriptAnalysisEnabled(false);
        if l_R15MigDocumentChanges_0 then
            v49.setScriptDocumentChangedEnabled(false);
        end;
        v49.analytics:getHandler("onPluginClosed")();
    end;
    v49.onRestore = function(v60)
        v49:setState({
            enabled = v60
        });
        if not (not v49.state.scanComplete and v49.state.enabled) then
            v49.setScriptAnalysisEnabled(v49.state.enabled);
        end;
    end;
    v49.includeScript = function(v61)
        return ((v61 and not v61:IsDescendantOf(l_PluginDebugService_0)) and not v36.isDescendantOfSaveFolder(v61)) and not v61:GetAttribute(v33.AttributeUnificationScriptName);
    end;
    v49.onScriptChangedCallback = function(v62, v63)
        local l_v62_Script_0 = v62:GetScript();
        if v49.includeScript(l_v62_Script_0) then
            v49.store:dispatch(v24(v49.scriptConversionContext, l_v62_Script_0, v63));
        end;
    end;
    v49.onScriptAnalysisCallback = function(v65)
        if not l_R15MigDocumentChanges_0 then
            if not v65.script:IsDescendantOf(l_PluginDebugService_0) and not v36.isDescendantOfSaveFolder(v65.script) then
                if v65.script:GetAttribute(v33.AttributeUnificationScriptName) then
                    return {
                        diagnostics = {}
                    };
                end;
            else
                return {
                    diagnostics = {}
                };
            end;
        elseif not v49.includeScript(v65.script) then
            return {
                diagnostics = {}
            };
        end;
        local v66 = v32:ScanScript(v65.script, v49.localization);
        v49.store:dispatch(v23(v49.scriptConversionContext, v65.script, v66));
        if v66:GetSize() > 0 then
            return {
                diagnostics = v66:GetDataForLinter()
            };
        else
            return {
                diagnostics = {}
            };
        end;
    end;
    v49.onScriptDestroyingCallback = function(v67)
        v49.store:dispatch(v23(v49.scriptConversionContext, v67));
    end;
    v49.onWidgetEnabledChanged = function(v68)
        v49:setState({
            enabled = v68.Enabled
        });
        if not (not v49.state.scanComplete and v49.state.enabled) then
            v49.setScriptAnalysisEnabled(v49.state.enabled);
        end;
    end;
    v49.store = v7.Store.new(v41, nil, {
        v7.thunkMiddleware
    }, nil);
    v49.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "R15Migrator"
    });
    v49.analytics = l_ContextServices_0.Analytics.new(v43);
    v49.scriptConversionContext = v20.new(v49.onScriptDestroyingCallback);
    v49.networkInterface = v21.new();
    v49.api = l_ContextServices_0.API.new();
    v49.communication = l_CrossPluginCommunication_0.new(v40.CrossPluginCommunicationName);
    v49.communication:Connect(v40.CrossPluginCommunicationInstructions.Open, function()
        if not v49.state.enabled then
            v49.toggleEnabled();
        end;
    end);
    local function v73()
        local v69 = v36.getPublishTime();
        local v70 = v69 ~= nil;
        assert(not v70 or v49.isR15ConvertedExperience);
        v49.store:dispatch(v28(v70));
        v49.store:dispatch(v30((v37.getAllTabsData(v49.localization, function(v71)
            if not v70 then
                return true;
            else
                return v71 == v37.Summary;
            end;
        end))));
        v49.store:dispatch(v31(v37.Summary));
        if v70 then
            v38(game.GameId, v49.api:get(), function(v72)
                if v72 then
                    v72.publishedDateTime = v39(v69);
                end;
                v49.store:dispatch(v29(v72));
            end);
            return ;
        else
            return ;
        end;
    end;
    v49.isR15ConvertedExperience = v35.IsR15ConvertedExperience:getBooleanSetting(v50.Plugin, game.GameId);
    v73();
    v49.communication:Connect(v40.CrossPluginCommunicationInstructions.Published, function()
        v36.setPublishTime(DateTime.now());
        v73();
    end);
    v50.Plugin.Unloading:Connect(function()
        if v49.state.enabled then
            v49.setScriptAnalysisEnabled(false);
            if l_R15MigDocumentChanges_0 then
                v49.setScriptDocumentChangedEnabled(false);
            end;
            v49.analytics:getHandler("onPluginClosed")();
        end;
        v49.communication:cleanup();
    end);
    v49:initToolbarAndButton(v50);
    v49.store:dispatch(v27(v49.networkInterface));
end;
v46.renderMain = function(v74)
    local l_scanComplete_0 = v74.state.scanComplete;
    if not v74.isR15ConvertedExperience then
        return {
            InitialFlow = v6.createElement(v18, {})
        };
    else
        return {
            MainView = if not l_scanComplete_0 then nil else v6.createElement(v16, {
                OnResetPlugin = v74.resetPlugin
            }), 
            LoadingScreen = if l_scanComplete_0 then nil else v6.createElement(v17, {
                StartScan = v74.startScan
            })
        };
    end;
end;
v46.render = function(v76)
    local l_props_0 = v76.props;
    local l_state_0 = v76.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v76.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v42(), 
        v76.localization, 
        v76.analytics, 
        v76.scriptConversionContext, 
        v76.networkInterface, 
        v76.api
    }, {
        MainWidget = v6.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "R15Migrator", 
            Enabled = l_state_0.enabled, 
            Title = v76.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            OnClose = v76.onClose, 
            ShouldRestore = true, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetRestored = v76.onRestore, 
            Size = Vector2.new(508, 640), 
            InitialDockState = Enum.InitialDockState.Left, 
            MinSize = Vector2.new(508, 640), 
            [v6.Change.Enabled] = v76.onWidgetEnabledChanged
        }, v76:renderMain())
    });
end;
v46.didUpdate = function(v80)
    v80.mainButton:SetActive(v80.state.enabled);
end;
return v46;
