local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v8 = require(l_Parent_0.Src.Resources.MakeTheme);
local v9 = require(l_Parent_0.Src.Components.TourWidget);
local v10 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseExtensibilityApi)();
local v11 = {
    DataModel = "PlayClient", 
    PluginType = "Standalone", 
    PluginId = "Tutorials", 
    Category = "Panels", 
    ItemId = "PlaytestWidget"
};
local v12 = {
    PluginId = "MainWindow", 
    Category = "Widgets", 
    ItemId = "Main"
};
local v13 = v1.PureComponent:extend("PlayRoot");
v13.init = function(v14)
    v14.state = {
        stepData = nil, 
        widget = nil
    };
    v14.localization = l_Localization_0.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "Tutorials", 
        libraries = {
            [v2.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v2.Resources.SourceStrings, 
                translationResourceTable = v2.Resources.LocalizedStrings
            }
        }
    });
end;
v13.didMount = function(v15)
    local l_Plugin_0 = v15.props.Plugin;
    local l_l_Plugin_0_QWidgetPluginGui_0 = l_Plugin_0:CreateQWidgetPluginGui(if not v10 then l_Plugin_0.Name .. "_Avatar" else "PlaytestWidget", {
        Size = Vector2.new(275, 350), 
        MinSize = Vector2.new(275, 350), 
        Modal = false, 
        Callout = true, 
        InitialEnabled = true
    });
    local l_StudioWidgetsService_0 = game:GetService("StudioWidgetsService");
    local v19 = nil;
    local v20 = nil;
    if not v10 then
        v20 = l_StudioWidgetsService_0:GetWidgetFromLabel("ideDocDocumentPanel");
        v19 = Instance.new("StudioAttachment");
        v19.IsArrowVisible = false;
        v19.SourceAnchorPoint = Vector2.new(0, 0);
        v19.TargetAnchorPoint = Vector2.new(0, 0);
        v19.Offset = Vector2.new(20, 20);
    else
        l_l_Plugin_0_QWidgetPluginGui_0.Name = "PlaytestWidget";
    end;
    v15.connection = l_Plugin_0:OnInvoke("SendPlayStep", function(v21)
        v15:setState({
            stepData = v21
        });
        if not v10 then
            l_StudioWidgetsService_0:AttachPluginGui(v20, l_l_Plugin_0_QWidgetPluginGui_0, v19);
            return ;
        else
            l_Plugin_0:GetPluginComponent("Panels"):SetAttachment(v11, {
                TargetWidgetUri = v12, 
                SubjectAnchorPoint = Vector2.new(0, 0), 
                TargetAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(20, 20)
            });
            return ;
        end;
    end);
    v15:setState({
        widget = l_l_Plugin_0_QWidgetPluginGui_0
    });
    l_Plugin_0:Invoke("GetPlayStep");
end;
v13.willUnmount = function(v22)
    if v22.connection then
        v22.connection:Disconnect();
    end;
end;
v13.render = function(v23)
    local l_props_0 = v23.props;
    local l_state_0 = v23.state;
    local l_Plugin_1 = l_props_0.Plugin;
    if not v10 or l_state_0.widget then
        return l_ContextServices_0.provide({
            l_ContextServices_0.Plugin.new(l_Plugin_1), 
            l_Mouse_0.new(l_Plugin_1:getMouse()), 
            v8(), 
            v23.localization
        }, {
            Tour = v1.createElement(v9, {
                OnNext = function()
                end, 
                OnSkip = function()
                    l_Plugin_1:Invoke("SkipStep");
                end, 
                OnQuit = function()
                    game:GetService("TutorialService"):PromptClosePlace();
                end, 
                Plugin = if not v10 then nil else l_Plugin_1, 
                PressedKeys = {}, 
                StepData = l_state_0.stepData, 
                Widget = l_state_0.widget
            })
        });
    else
        return nil;
    end;
end;
return v13;
