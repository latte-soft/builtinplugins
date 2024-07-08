local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_Pane_0 = v3.UI.Pane;
local v10 = require(script.Parent.DisplayTable);
local v11 = require(script.Parent.ControlledTabs);
local v12 = require(script.Parent.ScopeDropdownField);
local v13 = require(script.Parent.VariablesDropdownField);
local v14 = require(script.Parent.MyWatchesDropdownField);
local v15 = require(script.Parent.SearchBarField);
local l_Src_0 = l_Parent_0.Src;
local l_Models_0 = l_Src_0.Models;
local v18 = require(l_Models_0.Watch.TableTab);
local v19 = require(l_Models_0.StepStateBundle);
local v20 = require(l_Src_0.Util.Constants);
local v21 = require(l_Src_0.Actions.Watch.AddExpression);
local v22 = require(l_Src_0.Actions.Watch.SetTab);
local v23 = require(l_Src_0.Thunks.Watch.ExecuteExpressionForAllFrames);
local v24 = require(l_Src_0.Resources.AnalyticsEventNames);
local v25 = v1.PureComponent:extend("WatchComponent");
v25.didMount = function(v26)
    v26.calculateVisibleComponents();
end;
v25.didUpdate = function(v27)
    v27.calculateVisibleComponents();
end;
v25.init = function(v28)
    game:GetService("DebuggerUIService").ExpressionAdded:Connect(function(v29)
        v28.props.Analytics:report(v24.WatchAdded, "WatchWindow");
        v28.props.OnAddExpression(v29);
        v28.props.OnSetTab("Watches");
        local l_CurrentStepStateBundle_0 = v28.props.CurrentStepStateBundle;
        if l_CurrentStepStateBundle_0 ~= nil then
            local l_debuggerStateToken_0 = l_CurrentStepStateBundle_0.debuggerStateToken;
            if l_debuggerStateToken_0 ~= nil then
                local l_ConnectionById_0 = game:GetService("DebuggerConnectionManager"):GetConnectionById(l_debuggerStateToken_0.debuggerConnectionId);
                if l_ConnectionById_0 ~= nil then
                    v28.props.OnExecuteExpressionForAllFrames(v29, l_ConnectionById_0, l_debuggerStateToken_0, l_CurrentStepStateBundle_0.threadId);
                end;
            end;
        end;
    end);
    v28.componentRef = v1.createRef();
    v28.state = {
        shouldShowDropdown = true, 
        shouldShowDropdownIcon = false, 
        shouldShowSearchBar = true
    };
    v28.calculateVisibleComponents = function()
        local l_current_0 = v28.componentRef.current;
        local l_x_0 = l_current_0.AbsoluteSize.x;
        if l_current_0 == nil then
            return ;
        else
            local l_shouldShowDropdown_0 = v28.state.shouldShowDropdown;
            local l_shouldShowDropdownIcon_0 = v28.state.shouldShowDropdownIcon;
            local l_shouldShowSearchBar_0 = v28.state.shouldShowSearchBar;
            if l_x_0 < 420 then
                if not (not (not l_shouldShowDropdownIcon_0 or l_shouldShowDropdown_0) and not l_shouldShowSearchBar_0) then
                    v28:setState(function(_)
                        return {
                            shouldShowDropdown = false, 
                            shouldShowDropdownIcon = true, 
                            shouldShowSearchBar = false
                        };
                    end);
                    return ;
                end;
            elseif l_x_0 < 527 then
                if not (not (l_shouldShowDropdown_0 or not l_shouldShowDropdownIcon_0) and l_shouldShowSearchBar_0) then
                    v28:setState(function(_)
                        return {
                            shouldShowDropdown = false, 
                            shouldShowDropdownIcon = true, 
                            shouldShowSearchBar = true
                        };
                    end);
                    return ;
                end;
            elseif not (not (not l_shouldShowDropdown_0 or l_shouldShowDropdownIcon_0) and l_shouldShowSearchBar_0) then
                v28:setState(function(_)
                    return {
                        shouldShowDropdown = true, 
                        shouldShowDropdownIcon = false, 
                        shouldShowSearchBar = true
                    };
                end);
            end;
            return ;
        end;
    end;
    v28.getTreeChildren = function(v41)
        return v41.children or {};
    end;
end;
v25.render = function(v42)
    local l_props_0 = v42.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local v46 = {
        Variables = l_Localization_1:getText("Watch", "VariablesTab"), 
        Watches = l_Localization_1:getText("Watch", "WatchesTab")
    };
    local v47 = {
        {
            Label = v46.Variables, 
            Key = "Variables"
        }, 
        {
            Label = v46.Watches, 
            Key = "Watches"
        }
    };
    local v48 = v20.HEADER_HEIGHT + v20.BUTTON_PADDING * 2;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        Style = "Box", 
        Layout = Enum.FillDirection.Vertical, 
        [v1.Ref] = v42.componentRef, 
        [v1.Change.AbsoluteSize] = v42.calculateVisibleComponents
    }, {
        HeaderView = v1.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, v48), 
            Style = "Box", 
            Spacing = v20.BUTTON_PADDING, 
            Padding = v20.BUTTON_PADDING
        }, {
            TabView = v1.createElement(v11, {
                LayoutOrder = 1, 
                Tabs = v47, 
                Size = UDim2.new(0.4, 0, 1, 0)
            }), 
            RightView = v1.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(0.6, 0, 1, 0), 
                LayoutOrder = 2, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                Layout = Enum.FillDirection.Horizontal, 
                Spacing = 10
            }, {
                ScopeDropdownView = (l_props_0.IsVariablesTab and (v42.state.shouldShowDropdown or v42.state.shouldShowDropdownIcon)) and v1.createElement(v12, {
                    LayoutOrder = 1, 
                    Size = UDim2.new(0.4, 0, 1, 0), 
                    ShouldShowDropdownIcon = v42.state.shouldShowDropdownIcon
                }), 
                SearchBarView = v42.state.shouldShowSearchBar and v1.createElement(v15, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(0.6, 0, 1, 0)
                }), 
                ColumnsDropdownView = if not l_props_0.IsVariablesTab then v1.createElement(v14, {
                    LayoutOrder = 3, 
                    AutomaticSize = Enum.AutomaticSize.X
                }) else v1.createElement(v13, {
                    LayoutOrder = 3, 
                    AutomaticSize = Enum.AutomaticSize.X
                })
            })
        }), 
        BodyView = v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, -v48), 
            Style = "Box"
        }, {
            DisplayTableView = v1.createElement(v10, {
                Stylizer = l_Stylizer_1
            })
        })
    });
end;
return (v2.connect(function(v49, _)
    local l_Common_0 = v49.Common;
    local v52 = l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId];
    local v53 = not not l_Common_0.debuggerConnectionIdToCurrentThreadId and l_Common_0.debuggerConnectionIdToCurrentThreadId[l_Common_0.currentDebuggerConnectionId] or nil;
    local v54 = (((not not v53 and l_Common_0.currentFrameMap) and l_Common_0.currentDebuggerConnectionId) and l_Common_0.currentFrameMap[l_Common_0.currentDebuggerConnectionId]) and l_Common_0.currentFrameMap[l_Common_0.currentDebuggerConnectionId][v53] or nil;
    local v55 = nil;
    if (v52 ~= nil and v53 ~= nil) and v54 ~= nil then
        v55 = v19.ctor(v52, v53, v54);
    end;
    return {
        IsVariablesTab = v49.Watch.currentTab == v18.Variables, 
        CurrentStepStateBundle = v55
    };
end, function(v56)
    return {
        OnAddExpression = function(v57)
            return v56(v21(v57));
        end, 
        OnSetTab = function(v58)
            return v56(v22(v58));
        end, 
        OnExecuteExpressionForAllFrames = function(v59, v60, v61, v62)
            return v56(v23(v59, v60, v61, v62));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v25))));
