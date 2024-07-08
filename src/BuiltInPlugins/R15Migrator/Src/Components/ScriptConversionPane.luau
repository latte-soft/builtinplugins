local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v9 = require(l_script_FirstAncestor_0.Src.Components.ProgressBar);
local v10 = require(l_script_FirstAncestor_0.Src.Components.ReplacementRulesExpandablePane);
local v11 = require(l_script_FirstAncestor_0.Src.Components.ScriptConversionExpandablePane);
local v12 = require(l_script_FirstAncestor_0.Src.Util.findAllInServices);
local v13 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateScriptAnalytics);
local v15 = v2.PureComponent:extend("ScriptConversionPane");
v15.init = function(v16)
    v16.state = {
        paneSize = Vector2.new(0, 0), 
        replaceRulesPaneSize = Vector2.new(0, 0)
    };
    v16.ref = v2.createRef();
end;
v15.initConnections = function(v17)
    local v18 = v17.ref:getValue();
    if v18 then
        local l_ReplacementRulesExpandablePane_0 = v18.ReplacementRulesExpandablePane;
        v17.onPaneSizeChanged = v18:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            v17:setState({
                paneSize = v18.AbsoluteSize
            });
        end);
        v17.replaceRulesPaneSizeChanged = l_ReplacementRulesExpandablePane_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            v17:setState({
                replaceRulesPaneSize = l_ReplacementRulesExpandablePane_0.AbsoluteSize
            });
        end);
        return ;
    else
        return ;
    end;
end;
v15.didMount = function(v20)
    local l_props_0 = v20.props;
    l_props_0.updateScriptAnalytics(v12(function(v22)
        if v22:IsA("LuaSourceContainer") then
            if not v22:GetAttribute(v13.AttributeUnificationScriptName) then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    end), l_props_0.diagnostics, l_props_0.Analytics);
    v20:initConnections();
end;
v15.didUpdate = function(v23)
    if not ((not v23.ref.current or v23.onPaneSizeChanged) or v23.replaceRulesPaneSizeChanged) then
        v23:initConnections();
    end;
end;
v15.getScriptExpandablePaneSize = function(v24)
    local l_props_1 = v24.props;
    local l_state_0 = v24.state;
    return UDim2.fromOffset(l_state_0.paneSize.X, (l_state_0.paneSize.Y - l_state_0.replaceRulesPaneSize.Y) - l_props_1.Stylizer.ExpandablePaneHeaderSize.Y.Offset);
end;
v15.hasScripts = function(v27)
    local v28 = true;
    if next(v27.props.diagnostics) == nil then
        v28 = next(v27.props.completedScripts) ~= nil;
    end;
    return v28;
end;
v15.render = function(v29)
    local l_props_2 = v29.props;
    local l_progressBarMessageKey_0 = l_props_2.progressBarMessageKey;
    local l_replaceProgress_0 = l_props_2.replaceProgress;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Localization_0 = l_props_2.Localization;
    local v35 = l_LayoutOrderIterator_0.new();
    if v29:hasScripts() then
        return v2.createElement(l_Pane_0, {
            BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
            BorderSizePixel = 0, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            ForwardRef = v29.ref
        }, {
            ReplacementRulesExpandablePane = v2.createElement(v10, {
                LayoutOrder = v35:getNextOrder(), 
                HeaderSize = l_Stylizer_0.ExpandablePaneHeaderSize
            }), 
            ScriptConversionExpandablePane = v2.createElement(v11, {
                LayoutOrder = v35:getNextOrder(), 
                HeaderSize = l_Stylizer_0.ExpandablePaneHeaderSize, 
                ContentSize = v29:getScriptExpandablePaneSize(), 
                OnResetPlugin = l_props_2.OnResetPlugin
            }), 
            ReplaceProgressBar = if not l_replaceProgress_0 then nil else v2.createElement(v9, {
                Text = l_Localization_0:getText("ProgressBar", l_progressBarMessageKey_0), 
                Progress = l_replaceProgress_0
            })
        });
    else
        return v2.createElement(l_Pane_0, {}, {
            Label = v2.createElement(l_TextLabel_0, {
                Text = l_Localization_0:getText("ScriptConversion", "NoScripts")
            })
        });
    end;
end;
v15.willUnmount = function(v36)
    if v36.onPaneSizeChanged then
        v36.onPaneSizeChanged:Disconnect();
        v36.onPaneSizeChanged = nil;
    end;
    if v36.replaceRulesPaneSizeChanged then
        v36.replaceRulesPaneSizeChanged:Disconnect();
        v36.replaceRulesPaneSizeChanged = nil;
    end;
end;
return v3.connect(function(v37, _)
    return {
        diagnostics = v37.ScriptConversion.diagnostics, 
        completedScripts = v37.ScriptConversion.completedScripts, 
        replaceProgress = v37.ScriptConversion.replaceProgress, 
        progressBarMessageKey = v37.ScriptConversion.messageKey
    };
end, function(v39)
    return {
        updateScriptAnalytics = function(v40, v41, v42)
            v39(v14(v40, v41, v42));
        end
    };
end)((l_ContextServices_0.withContext({
    Analytics = l_ContextServices_0.Analytics, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v15)));
