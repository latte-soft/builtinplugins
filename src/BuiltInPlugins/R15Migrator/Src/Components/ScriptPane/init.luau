local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Src.Contexts.ScriptConversionContext);
local v7 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_join_0 = v7.join;
local l_keys_0 = v7.keys;
local _ = v7.map;
local l_None_0 = v7.None;
local l_UI_0 = v3.UI;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local _ = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = l_UI_0.TreeTable;
local _ = l_script_FirstAncestor_0.Src.Actions;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v21 = require(l_Components_0.ScriptFilterButton);
local v22 = require(l_Components_0.ScriptPaneTreeTable);
local v23 = require(l_Components_0.TagsBar);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v25 = require(l_Util_0.ScriptAnalysis.R6Info);
local _ = require(l_Util_0.ScriptAnalysis.Constants);
local _ = require(l_Util_0.findAllInServices);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v29 = v1.PureComponent:extend("ScriptPane");
v29.init = function(v30)
    v30.state = {
        expanded = true, 
        searchFilters = {
            scriptName = nil, 
            rigFilters = {
                R6 = {}, 
                R15 = {}
            }
        }, 
        expandedTreeView = false, 
        _Ref = {
            diagnostics = nil
        }
    };
    v30.expandedChanged = function()
        v30:setState({
            expanded = not v30.state.expanded
        });
    end;
    v30.onSearchRequested = function(v31)
        v30:setState({
            searchFilters = l_join_0(v30.state.searchFilters, {
                scriptName = if v31 ~= "" then v31 else l_None_0
            })
        });
    end;
    v30.onFilterSelected = function(v32)
        local l_RigType_0 = v32.Data.RigType;
        local l_InstanceName_0 = v32.Data.InstanceName;
        v30:setState({
            searchFilters = l_join_0(v30.state.searchFilters, {
                rigFilters = l_join_0(v30.state.searchFilters.rigFilters, {
                    [l_RigType_0] = l_join_0(v30.state.searchFilters.rigFilters[l_RigType_0], {
                        [l_InstanceName_0] = not v30.state.searchFilters.rigFilters[l_RigType_0][l_InstanceName_0] or l_None_0
                    })
                })
            })
        });
    end;
    v30.ExpandTreeView = Instance.new("BindableEvent");
end;
local function v42(v35)
    local v36 = {};
    for _, v38 in v35, nil, nil do
        for _, v40 in v38._list, nil, nil do
            if v40.issueType ~= v25.AnimationKey then
                v36[v40.instanceName] = true;
            end;
        end;
    end;
    local v41 = l_keys_0(v36);
    table.sort(v41);
    return v41;
end;
v29.getDerivedStateFromProps = function(v43, v44)
    if v43.diagnostics ~= v44._Ref.diagnostics then
        return {
            instanceNames = v42(v43.diagnostics), 
            _Ref = l_join_0(v44._Ref, {
                diagnostics = v43.diagnostics
            })
        };
    else
        return ;
    end;
end;
v29.render = function(v45)
    local l_state_0 = v45.state;
    local _ = v45.props;
    local l_Localization_0 = v45.props.Localization;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1)
    }, {
        ExpandablePane = v1.createElement(l_ExpandablePane_0, {
            Expanded = v45.state.expanded, 
            HeaderComponent = l_TextLabel_0, 
            HeaderComponentProps = {
                Text = "Scripts", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }, 
            OnExpandedChanged = v45.expandedChanged
        }), 
        Contents = v1.createElement(l_Pane_0, {
            Position = UDim2.new(0, 0, 0, 32), 
            Size = UDim2.new(1, 0, 1, -80), 
            Visible = v45.state.expanded, 
            Layout = Enum.FillDirection.Vertical, 
            Padding = {
                Left = 5, 
                Right = 5
            }, 
            Spacing = 5
        }, {
            Search = v1.createElement(l_Pane_0, {
                LayoutOrder = 0, 
                Size = UDim2.new(1, 0, 0, 32), 
                Layout = Enum.FillDirection.Horizontal, 
                Padding = 5
            }, {
                Search = v1.createElement(l_SearchBar_0, {
                    LayoutOrder = 0, 
                    PlaceholderText = l_Localization_0:getText("ScriptPane", "SearchScripts"), 
                    ShowSearchIcon = true, 
                    ShowSearchButton = false, 
                    OnSearchRequested = v45.onSearchRequested, 
                    IncrementalTextSearch = true, 
                    IncrementalTextSearchDelay = 100, 
                    Size = UDim2.new(1, -32, 0, 32)
                }), 
                FilterMenuButton = v1.createElement(v21, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(32, 32), 
                    InstanceNames = l_state_0.instanceNames, 
                    Filters = l_state_0.searchFilters.rigFilters, 
                    OnFilterSelected = v45.onFilterSelected
                })
            }), 
            Toolbar = v1.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 24), 
                Layout = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                TagsBar = v1.createElement(v23, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromScale(0.7, 1), 
                    Filters = l_state_0.searchFilters, 
                    OnFilterClosed = v45.onFilterSelected, 
                    ClipsDescendants = true
                }), 
                ExpandCollapse = v1.createElement(l_Pane_0, {
                    LayoutOrder = 2, 
                    Size = UDim2.fromScale(0.3, 1), 
                    OnClick = function()
                        local v49 = not v45.state.expandedTreeView;
                        v45.ExpandTreeView:Fire(v49);
                        v45:setState({
                            expandedTreeView = v49
                        });
                    end, 
                    Layout = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                }, {
                    TextLabel = v1.createElement(l_TextLabel_0, {
                        Text = l_Localization_0:getText("ScriptPane", not v45.state.expandedTreeView and "ExpandAll" or "CollapseAll"), 
                        TextXAlignment = Enum.TextXAlignment.Right
                    })
                })
            }), 
            ScriptTree = v1.createElement(v22, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, -56), 
                SearchFilters = l_state_0.searchFilters, 
                ExpandTreeView = v45.ExpandTreeView
            })
        }), 
        Footer = v1.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor = Color3.new(0, 0, 0.5), 
            Size = UDim2.new(1, 0, 0, 48), 
            Position = UDim2.fromScale(0, 1)
        }, {
            TextLabel = v1.createElement(l_TextLabel_0, {
                Text = "Footer"
            })
        })
    });
end;
return (v2.connect(function(v50, _)
    return {
        diagnostics = v50.ScriptConversion.diagnostics
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v29))));
