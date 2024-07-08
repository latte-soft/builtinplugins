local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local l_Selection_0 = game:GetService("Selection");
local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Packages.React);
local v7 = require(l_Parent_0.Packages.RoactRodux);
local v8 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v8.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v8.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_joinTags_0 = v8.Styling.joinTags;
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v18 = require(l_Parent_0.Src.Actions.SessionStats.TrackButtonPress);
local v19 = require(l_Parent_0.Src.Enums.InstancesHaveVariant);
local v20 = require(l_Parent_0.Src.Util.mapDispatchToProps);
local v21 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v22 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v23 = require(l_Parent_0.Src.Components.SelectorPropertyTable);
local v24 = require(l_Parent_0.Src.Components.StyleRulePreview);
local v25 = require(l_Parent_0.Src.Resources.PluginStyles);
local l_v25_Attribute_0 = v25:GetAttribute("ButtonHeight");
local l_v25_Attribute_1 = v25:GetAttribute("PaddingSm");
local l_v25_Attribute_2 = v25:GetAttribute("Spacing");
local l_v25_Attribute_3 = v25:GetAttribute("TitleTextSize");
local v30 = v6.PureComponent:extend("StyleRuleView");
v30.init = function(v31)
    v31.state = {
        expanded = true, 
        scrollHeight = -200, 
        instance = nil, 
        selection = {}, 
        story = nil
    };
    v31.containerRef = v6.createRef();
    v31.expandedChanged = function()
        v31:setState(function(v32)
            local v33 = not v32.expanded;
            local v34 = if not v33 then v32.instance else v30.getPreview(v31.props.StyleRule);
            return {
                expanded = v33, 
                instance = v34, 
                scrollHeight = v30.estimateScrollHeight(v33, v34, v31.props.StyleRule)
            };
        end);
    end;
    v31.onSelectionChanged = function()
        local v35 = l_Selection_0:Get();
        v31:setState({
            selection = v35, 
            hasVariant = v22.instancesHaveVariant(v35, v31.props.StyleRule), 
            canApplyVariant = v22.canApplyVariant(v31.props.StyleRule, v35)
        });
    end;
    v31.removeTagConnections = function()
        if v31.tagConnections then
            for _, v37 in v31.tagConnections, nil, nil do
                for _, v39 in v37, nil, nil do
                    v39:Disconnect();
                end;
            end;
        end;
        v31.tagConnections = {};
    end;
    v31.createTagConnections = function()
        local v40 = v22.getSelectorChain(v31.props.StyleRule);
        if v40 then
            local function v41()
                l_RunService_0.RenderStepped:Wait();
                v31.onSelectionChanged();
            end;
            v31.tagConnections = {};
            for _, v43 in v40.Tags, nil, nil do
                v31.tagConnections[v43] = {
                    Added = l_CollectionService_0:GetInstanceAddedSignal(v43):Connect(v41), 
                    Removed = l_CollectionService_0:GetInstanceRemovedSignal(v43):Connect(v41)
                };
            end;
            return ;
        else
            return ;
        end;
    end;
    v31.onApplyStyle = function()
        local l_state_0 = v31.state;
        local l_props_0 = v31.props;
        l_props_0.dispatch(v18("StyleRuleView/ApplyTag"));
        if l_state_0.hasVariant == v19.Mixed then
            print("Error: Variant action cannot be performed on all selected instances");
            return ;
        elseif l_state_0.canApplyVariant then
            local l_StyleRule_0 = l_props_0.StyleRule;
            if l_StyleRule_0 then
                if #l_state_0.selection < 1 then
                    print("Error: No instance selected in Explorer");
                    return ;
                else
                    local v47 = v22.getSelectorChain(l_StyleRule_0);
                    v21({
                        Name = "StyleEditor.ApplyTags", 
                        DisplayName = "StyleEditor - Apply Tag(s)", 
                        DoChange = function()
                            for _, v49 in l_state_0.selection, nil, nil do
                                if v47.Class ~= "" and v49.ClassName ~= v47.Class then
                                    print("Error: Selector class does not match ClassName on", v49);
                                elseif l_state_0.hasVariant == v19.All then
                                    v22.removeVariant(l_StyleRule_0, v49);
                                else
                                    v22.addStyleLinkToRoot(v49, l_StyleRule_0);
                                    local l_status_0, l_result_0 = pcall(function()
                                        return l_StylingService_0:GetAppliedStyles(v49);
                                    end);
                                    if l_status_0 then
                                        if v47.Class ~= "" then
                                            for _, v53 in l_result_0, nil, nil do
                                                if #v53.PossibleClasses == 1 and v53.PossibleClasses[1] == v49.ClassName then
                                                    v22.removeVariant(v53.Instance, v49);
                                                end;
                                            end;
                                        end;
                                        v22.applyVariant(l_StyleRule_0, v49);
                                        local l_l_StyleRule_0_0 = l_StyleRule_0;
                                        while not (not l_l_StyleRule_0_0 or not l_l_StyleRule_0_0:IsA("StyleRule")) do
                                            for v55, v56 in l_l_StyleRule_0_0:GetProperties() do
                                                local l_status_1, l_result_1 = pcall(function()
                                                    if v49:IsPropertyModified(v55) then
                                                        v49:ResetPropertyToDefault(v55);
                                                    end;
                                                end);
                                                l_status_0 = l_status_1;
                                                v56 = l_result_1;
                                                if not l_status_0 then
                                                    warn((("Style Editor could not reset %* on %*"):format(v55, v49)));
                                                end;
                                            end;
                                            l_l_StyleRule_0_0 = l_l_StyleRule_0_0.Parent;
                                        end;
                                    end;
                                end;
                            end;
                            return Enum.FinishRecordingOperation.Commit;
                        end
                    });
                    v31:setState({
                        hasVariant = if l_state_0.hasVariant == v19.All then v19.None else v19.All
                    });
                    return ;
                end;
            else
                print("Error: No StyleRule to apply");
                return ;
            end;
        else
            print("Error: Variant cannot be applied to all selected instances");
            return ;
        end;
    end;
end;
v30.estimateScrollHeight = function(v59, v60, v61)
    local v62 = v22.ruleHasTags(v61);
    local v63 = v22.findFirstClassSelector(v61);
    local l_status_2, l_result_2 = pcall(function()
        local v64 = false;
        if v63 ~= "" then
            v64 = Instance.new(v63):IsA("GuiObject");
        end;
        return v64;
    end);
    local l_l_v25_Attribute_1_0 = l_v25_Attribute_1;
    if not l_status_2 or not l_result_2 then
        if v62 then
            l_l_v25_Attribute_1_0 = l_l_v25_Attribute_1_0 + l_v25_Attribute_0;
        end;
        return l_l_v25_Attribute_1_0;
    elseif not (not v59 or not v60) and v60 ~= v6.None then
        return l_l_v25_Attribute_1_0 + ((v24.getPredictedPreviewHeight(v60.Size, Vector2.new(math.huge, 300), Vector2.new(0, 0), Vector2.new(l_v25_Attribute_2, l_v25_Attribute_2)) + l_v25_Attribute_3) + 3 * l_v25_Attribute_2);
    else
        return l_l_v25_Attribute_1_0 + l_v25_Attribute_0;
    end;
end;
v30.createPreviewInstanceFromSelectorLink = function(v68)
    local v69 = if not not v68.Class and #v68.Class > 0 then v68.Class else "Frame";
    local l_status_3, l_result_3 = pcall(function()
        return Instance.new(v69);
    end);
    if l_status_3 then
        if v68.Name and #v68.Name > 0 then
            l_result_3.Name = v68.Name;
        end;
        for _, v73 in v68.Tags, nil, nil do
            l_result_3:AddTag(v73);
        end;
        return l_result_3;
    else
        return ;
    end;
end;
v30.isVisible = function(v74)
    if v74 and v74:IsA("StyleRule") then
        assert(v74 ~= nil, "expecting valid style rule");
        local l_status_4, l_result_4 = pcall(function()
            return l_StylingService_0:GetStyleInfo(v74);
        end);
        if l_status_4 then
            if not l_result_4.Properties.Visible then
                return v30.isVisible(v74.Parent);
            else
                return l_result_4.Properties.Visible.Value;
            end;
        else
            return true;
        end;
    else
        return true;
    end;
end;
v30.getPreview = function(v77)
    if not v77 or #v77.SelectorError > 0 then
        return v6.None;
    else
        local l_status_5, l_result_5 = pcall(function()
            return l_StylingService_0:GetStyleInfo(v77);
        end);
        if l_status_5 then
            local l_SelectorChains_0 = l_result_5.SelectorChains;
            local v81 = nil;
            local v82 = nil;
            local v83 = nil;
            local v84 = false;
            for v85, v86 in l_SelectorChains_0[#l_SelectorChains_0], nil, nil do
                v82 = v30.createPreviewInstanceFromSelectorLink(v86);
                if v82 then
                    local l_Class_0 = v86.Class;
                    if l_Class_0 then
                        l_Class_0 = false;
                        if #v86.Class > 0 then
                            l_Class_0 = v86.Combinator ~= "Pseudo";
                        end;
                    end;
                    if not v81 then
                        v83 = v82;
                    else
                        v82.Parent = v81;
                    end;
                    if not (not (v86.Combinator ~= "Pseudo") or not v82:IsA("GuiObject")) then
                        if v81 then
                            v82.Size = UDim2.fromScale(1, 1);
                        end;
                        v82.Position = UDim2.new();
                        v82.AnchorPoint = Vector2.new();
                        if v85 ~= #l_SelectorChains_0[#l_SelectorChains_0] then
                            v82.BackgroundTransparency = 1;
                            local _ = pcall(function()
                                v82.TextTransparency = 1;
                            end);
                        end;
                        v81 = v82;
                    end;
                    v84 = v84 or l_Class_0;
                end;
            end;
            if v83 then
                if (not v84 or not v82) or not v82:IsA("GuiObject") then
                    v83:Remove();
                else
                    local v89 = UDim2.fromOffset(200, 100);
                    if v30.isVisible(v77) then
                        if l_result_5.Properties.Size and typeof(l_result_5.Properties.Size.Value) == "UDim2" then
                            v89 = l_result_5.Properties.Size.Value;
                        end;
                    else
                        v89 = UDim2.new();
                    end;
                    v83.Size = v89;
                    return v83;
                end;
            end;
            return v6.None;
        else
            return v6.None;
        end;
    end;
end;
v30.getDerivedStateFromProps = function(v90, v91)
    if v90.StyleRule == v91.StyleRule and not v90.IsDirty then
        return v91;
    else
        local l_expanded_0 = v91.expanded;
        local v93 = v30.getPreview(v90.StyleRule) or v6.None;
        return {
            StyleRule = v90.StyleRule, 
            hasVariant = v22.instancesHaveVariant(v91.selection, v90.StyleRule), 
            canApplyVariant = v22.canApplyVariant(v90.StyleRule, v91.selection), 
            instance = v93, 
            scrollHeight = v30.estimateScrollHeight(l_expanded_0, v93, v90.StyleRule)
        };
    end;
end;
v30.didUpdate = function(v94, v95, _)
    if v95.StyleRule ~= v94.props.StyleRule then
        v94.removeTagConnections();
        v94.createTagConnections();
    end;
end;
v30.didMount = function(v97)
    v97.selectionChangedConnection = l_Selection_0.SelectionChanged:Connect(v97.onSelectionChanged);
    v97.onSelectionChanged();
end;
v30.willUnmount = function(v98)
    v98.removeTagConnections();
    if v98.selectionChangedConnection then
        v98.selectionChangedConnection:Disconnect();
        v98.selectionChangedConnection = nil;
    end;
end;
v30.render = function(v99)
    local l_props_1 = v99.props;
    local l_state_1 = v99.state;
    local v102 = l_state_1.hasVariant == v19.None and "Apply" or (l_state_1.hasVariant == v19.Mixed and "Mixed" or "Remove");
    local v103 = "ApplyBtn.Text" .. v102 .. "Tag";
    local v104 = "ApplyBtn.Tooltip" .. v102 .. "Tag";
    local v105 = true;
    if l_state_1.hasVariant ~= v19.Mixed then
        v105 = not l_state_1.canApplyVariant;
    end;
    local l_Localization_1 = l_props_1.Localization;
    return v6.createElement(l_Pane_0, {
        [v6.Tag] = "X-ColumnS X-FitY X-Right"
    }, {
        Container = v6.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            [v6.Tag] = "X-FitY"
        }, {
            ApplyStyleButton = if not v22.ruleHasTags(l_props_1.StyleRule) then nil else v6.createElement(l_IconButton_0, {
                OnClick = v99.onApplyStyle, 
                Text = l_Localization_1:getText("Control", v103), 
                TooltipText = l_Localization_1:getText("Control", v104), 
                [v6.Tag] = l_joinTags_0("PositionRight", not v105 and "" or "Disabled")
            }), 
            Preview = v6.createElement(v24, {
                Expanded = l_state_1.expanded, 
                MaxSize = Vector2.new(math.huge, 300), 
                OnExpandedChanged = v99.expandedChanged, 
                PreviewInstance = l_state_1.instance, 
                StyleRule = l_props_1.StyleRule
            })
        }), 
        ScrollingView = v6.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, -l_state_1.scrollHeight)
        }, {
            StyleRule = v6.createElement(v23, {
                RootInstance = l_state_1.StyleRule
            })
        })
    });
end;
v30 = l_withContext_0({
    Localization = l_Localization_0
})(v30);
return v7.connect(function(v107)
    return {
        IsDirty = v107.Window.IsDirty
    };
end, v20)(v30);
