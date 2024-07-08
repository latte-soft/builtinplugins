local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_DockWidget_0 = v2.UI.DockWidget;
local v8 = require(l_Parent_0.Src.Actions.SetToolEnabled);
local v9 = require(l_Parent_0.Src.Thunks.UpdateActiveInstanceHighlight);
local v10 = require(l_Parent_0.Src.Components.MainView);
local v11 = require(l_Parent_0.Src.Components.HoverPreviewEnabler);
local v12 = Vector2.new(300, 250);
local v13 = Vector2.new(175, 250);
local v14 = v3.PureComponent:extend("AlignmentToolPlugin");
v14.init = function(v15)
    v15._hasOpenedThisSession = false;
    v15.toggleState = function()
        v15.setToolEnabled(not v15.props.toolEnabled, true);
    end;
    v15.onClose = function()
        v15.setToolEnabled(false, true);
    end;
    v15.onRestore = function(v16)
        v15.setToolEnabled(v16, false);
    end;
    v15.onDockWidgetCreated = function()
        v15.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v15.toggleState);
    end;
    v15.onDockWidgetEnabledChanged = function(v17)
        v15.setToolEnabled(v17.Enabled, true);
    end;
    v15.setToolEnabled = function(v18, v19)
        local l_props_0 = v15.props;
        l_props_0.setToolEnabled(v18);
        if not v18 then
            if v19 then
                l_props_0.Analytics:report("alignToolClose");
            end;
        else
            if v19 then
                l_props_0.Analytics:report("alignToolOpen");
            end;
            if not v15._hasOpenedThisSession then
                l_props_0.Analytics:report("alignToolImpression");
                v15._hasOpenedThisSession = true;
                return ;
            end;
        end;
    end;
end;
v14._renderDockWidgetContents = function(_, v22)
    if not v22 then
        return nil;
    else
        return v3.createElement(v11, {}, {
            MainView = v3.createElement(v10)
        });
    end;
end;
v14.didUpdate = function(v23)
    v23.props.pluginLoaderContext.mainButton:SetActive(v23.props.toolEnabled);
end;
v14.render = function(v24)
    local l_props_1 = v24.props;
    local l_Localization_0 = l_props_1.Localization;
    local l_toolEnabled_0 = l_props_1.toolEnabled;
    return v3.createFragment({
        MainWidget = v3.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "AlignmentTool", 
            Enabled = l_toolEnabled_0, 
            Widget = l_props_1.pluginLoaderContext.mainDockWidget, 
            Title = l_Localization_0:getText("Plugin", "WindowTitle"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = v12, 
            MinSize = v13, 
            OnClose = v24.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v24.onRestore, 
            OnWidgetCreated = v24.onDockWidgetCreated, 
            [v3.Change.Enabled] = v24.onDockWidgetEnabledChanged
        }, {
            DockWidgetContent = v24:_renderDockWidgetContents(l_toolEnabled_0)
        })
    });
end;
return v4.connect(function(v28, _)
    return {
        toolEnabled = v28.toolEnabled
    };
end, function(v30)
    return {
        setToolEnabled = function(v31)
            v30(v8(v31));
            v30(v9());
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Analytics = l_ContextServices_0.Analytics
})(v14)));
