local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_status_0, l_result_0 = pcall(function()
    return game:GetService("TutorialService");
end);
local v5 = if not l_status_0 then nil else l_result_0;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v7 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseExtensibilityApi)();
local v8 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v8.join;
local l_collect_0 = v8.collect;
local v11 = require(l_Parent_0.Packages.Framework);
local l_Dialog_0 = v11.UI.Dialog;
local l_CrossPluginCommunication_0 = v11.Util.CrossPluginCommunication;
local l_ContextServices_0 = v11.ContextServices;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v17 = require(l_Parent_0.Src.Util.Telemetry.TelemetryProtocol);
local v18 = require(l_Parent_0.Src.Util.Telemetry.SkipStep);
local v19 = require(l_Parent_0.Src.Util.Telemetry.StartStep);
local v20 = require(l_Parent_0.Src.Util.Telemetry.CompleteStep);
local v21 = require(l_Parent_0.Src.Util.Telemetry.IntermediateStep);
local v22 = require(l_Parent_0.Src.Util.Telemetry.ExtraAction);
local _ = require(l_Parent_0.Src.Util.Telemetry.TelemetryProtocolTypes);
local v24 = Vector2.new(460, 300);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v27 = require(l_Parent_0.Src.Reducers.MainReducer);
local v28 = require(l_Parent_0.Src.Resources.MakeTheme);
local v29 = require(l_Parent_0.Src.Util.Tutorial);
local l_Components_0 = l_Parent_0.Src.Components;
local v31 = require(l_Components_0.CompletedTutorialDialog);
local v32 = require(l_Components_0.HintBar);
local v33 = require(l_Components_0.TourWidget);
local v34 = v1.PureComponent:extend("AssetRoot");
v34.init = function(v35, v36)
    v35.state = {
        tutorialData = nil, 
        tutorialDialogEnabled = true, 
        completed = false, 
        completedDialogEnabled = false, 
        pressedKeys = {}, 
        widget = nil
    };
    v35.store = v2.Store.new(v27, nil, {
        v2.thunkMiddleware
    }, nil);
    v35.telemetry = v17.new();
    v35.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "Tutorials", 
        libraries = {
            [v11.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v11.Resources.SourceStrings, 
                translationResourceTable = v11.Resources.LocalizedStrings
            }
        }
    });
    v35.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    v35.log = function(v37, v38)
        v35.telemetry:logRobloxTelemetryEvent(v37, nil, l_join_0({
            tutorialId = v35.tutorial.data.id, 
            currentStep = v35.tutorial.currentStep, 
            stepId = v35.tutorial:getCurrentStep().data.id, 
            studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
            clientId = l_RbxAnalyticsService_0:GetClientId(), 
            mainViewSessionId = v5:GetMainViewSessionId()
        }, v38));
    end;
    v35.toolboxConnection = l_CrossPluginCommunication_0.new("Toolbox");
    local l_FirstChild_0 = l_Parent_0.Src.Tutorials:FindFirstChild((v5:GetTutorialIDToLaunch()));
    if not (not l_FirstChild_0 or not l_FirstChild_0:IsA("ModuleScript")) then
        v35.tutorial = v29.new(game, require(l_FirstChild_0), v35.localization, v35.toolboxConnection, if not v7 then nil else v36.Plugin);
        v35:loadTutorial(v35.tutorial);
    end;
    v35.onBack = function()
        v35.tutorial:back();
    end;
    v35.onNext = function()
        v35.tutorial:increment(not v35.state.tutorialData.showNext);
    end;
    v35.onQuit = function()
        v5:PromptClosePlace();
    end;
    v35.onSelectTopic = function(v40)
        v35.tutorial:selectTopic(v40);
    end;
end;
v34.didMount = function(v41)
    if not (not (v41.tutorial.data.id ~= "StudioTour") or v41.state.widget) then
        local v42 = v41:createWidget();
        v41:setState({
            widget = v42
        });
        v41.tutorial:setWidget(v42);
    end;
    local l_Plugin_0 = v41.props.Plugin;
    v41.connection = l_Plugin_0:OnInvoke("GetPlayStep", function()
        l_Plugin_0:Invoke("SendPlayStep", v41.state.tutorialData);
    end);
end;
v34.createWidget = function(v44)
    local l_QWidgetPluginGui_0 = v44.props.Plugin:CreateQWidgetPluginGui("TourWidget", {
        Callout = true, 
        MinSize = Vector2.new(275, 350), 
        Modal = false, 
        InitialEnabled = true, 
        Size = Vector2.new(275, 350), 
        Title = "TourWidget"
    });
    l_QWidgetPluginGui_0.Name = "TourWidget";
    return l_QWidgetPluginGui_0;
end;
v34.willUnmount = function(v46)
    if v46.connection then
        v46.connection:Disconnect();
    end;
end;
v34.loadTutorial = function(v47, v48)
    local l_props_0 = v47.props;
    v48.onCompleted = function()
        v47:setState({
            completed = true, 
            completedDialogEnabled = true
        });
    end;
    v48.onStepChanged = function(v50)
        local l_None_0 = v1.None;
        if v50.step.kind == "Focus" then
            l_None_0 = {
                {
                    key = "F", 
                    index = 1, 
                    pressed = false
                }
            };
        elseif v50.step.keys then
            l_None_0 = l_collect_0(v50.step.keys, function(v52, v53)
                return v53.Name, {
                    key = v53.Name, 
                    index = v52, 
                    pressed = false
                };
            end);
        end;
        v47:setState({
            tutorialData = v50, 
            pressedKeys = l_None_0
        });
        if v50.step.kind == "Skipped" then
            v47.log(v18);
        elseif v50.step.kind == "Completed" then
            v47.log(v20);
        else
            v47.log(v19);
        end;
        v47.props.Plugin:Invoke("SendPlayStep", v50);
    end;
    v48.onKeyPressed = function(v54)
        v47.log(v21, {
            action = "KeyPress", 
            actionKeyCode = v54.Name
        });
        v47:setState(function(v55)
            local v56 = v55.pressedKeys or {};
            return {
                pressedKeys = l_join_0(v56, {
                    [v54.Name] = if not v56[v54.Name] then nil else l_join_0(v56[v54.Name], {
                        pressed = true
                    })
                })
            };
        end);
    end;
    local l_FocusedDataModelSession_0 = l_props_0.Plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
    v47.connection = l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(function()
        if not (l_FocusedDataModelSession_0.CurrentDataModelType == Enum.StudioDataModelType.PlayClient) or not v48.startPlaying then
            if not (not (l_FocusedDataModelSession_0.CurrentDataModelType == Enum.StudioDataModelType.Edit) or not v48.stopPlaying) then
                v48.stopPlaying();
                v47.log(v22, {
                    action = "StopPlaytest"
                });
            end;
            return ;
        else
            v48.startPlaying();
            v47.log(v22, {
                action = "StartPlaytest"
            });
            return ;
        end;
    end);
    l_props_0.Plugin.Unloading:Connect(function()
        for v58 in pairs(v48.callouts) do
            v58:Destroy();
        end;
    end);
    v48:start();
    v47.tutorial.dataModel:GetService("Workspace").ChildAdded:Connect(function(v59)
        v47.log(v22, {
            action = "InsertObject", 
            actionKeyCode = v59.ClassName
        });
        v59.Changed:Connect(function(v60)
            if not (v60 ~= "Color") or v60 == "Material" then
                v47.log(v22, {
                    action = "ChangeProperty", 
                    actionKeyCode = v60
                });
            end;
        end);
    end);
end;
v34.render = function(v61)
    local l_props_1 = v61.props;
    local l_state_0 = v61.state;
    local l_Plugin_1 = l_props_1.Plugin;
    local l_completed_0 = l_state_0.completed;
    local l_completedDialogEnabled_0 = l_state_0.completedDialogEnabled;
    local v67 = v61.localization:getText(v61.tutorial.data.id, "Title");
    return l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(l_Plugin_1), 
        l_Store_0.new(v61.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v28(), 
        v61.localization, 
        v61.analytics
    }, {
        View = if not l_completedDialogEnabled_0 then if l_completed_0 then nil else if v61.tutorial.data.id ~= "StudioTour" then if l_state_0.widget then v1.createElement(v33, {
            OnBack = v61.onBack, 
            OnNext = v61.onNext, 
            OnQuit = v61.onQuit, 
            OnSelectTopic = v61.onSelectTopic, 
            Plugin = if not v7 then nil else l_Plugin_1, 
            PressedKeys = l_state_0.pressedKeys, 
            StepData = l_state_0.tutorialData, 
            Widget = l_state_0.widget
        }) else nil else v1.createElement(v32, {
            PressedKeys = l_state_0.pressedKeys, 
            TutorialData = l_state_0.tutorialData, 
            Title = v67, 
            OnNext = function()
                v61.tutorial:increment();
            end, 
            OnSkip = function()
                v61.tutorial:increment(true);
            end
        }) else v1.createElement(l_Dialog_0, {
            Title = v61.localization:getText("Completed", "Title"):format(v67), 
            Enabled = l_completedDialogEnabled_0, 
            Modal = true, 
            Size = v24, 
            OnClose = function()
                v61:setState({
                    completedDialogEnabled = false
                });
            end
        }, {
            Content = v1.createElement(v31, {
                Name = v67, 
                OnClose = function()
                    v61:setState({
                        completedDialogEnabled = false
                    });
                end, 
                OnReturn = function()
                    v61:setState({
                        completedDialogEnabled = false
                    });
                    v5:PromptClosePlace();
                end
            })
        })
    });
end;
return v34;
