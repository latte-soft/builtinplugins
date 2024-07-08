local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.InspectorContext);
local v5 = require(l_Parent_0.Src.Components.RoactProfilerEventsTable);
local v6 = require(l_Parent_0.Src.Components.RoactProfilerComponentsTable);
local l_RoactInspectorApi_0 = v3.DeveloperTools.RoactInspectorApi;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v9 = require(l_Actions_0.RoactInspector.ClearProfileData);
local v10 = require(l_Actions_0.RoactInspector.SetProfileSearchTerm);
local v11 = require(l_Actions_0.RoactInspector.SetProfileFilter);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_SearchBar_0 = l_UI_0.SearchBar;
local v21 = v1.PureComponent:extend("RoactProfilerView");
v21.init = function(v22)
    v22.onSearchTable = function(v23)
        v22.props.setProfileSearchTerm(v23);
        local v24 = v22.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v24) then
            v24:setProfileSearchTerm(v23);
            v24:getProfileData();
        end;
    end;
    v22.onViewComponent = function()
        local v25 = v22.props.Inspector:get():getTargetApi();
        local v26 = v22:getSelectedPath();
        if not (not l_RoactInspectorApi_0.isInstance(v25) or not v26) then
            v25:openPath(v26);
        end;
    end;
    v22.onClearTable = function()
        local v27 = v22.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v27) then
            v27:clearProfileData();
        end;
        v22.props.clearTable();
    end;
    v22.onToggleFilter = function()
        local v28 = #v22.props.Filter > 0 and {} or {
            "Consumer", 
            "Provider", 
            "RoduxConnection"
        };
        v22.props.setProfileFilter(v28);
        local v29 = v22.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v29) then
            v29:setProfileFilter(v28);
            v29:getProfileData();
        end;
    end;
end;
v21.getSelectedPath = function(v30)
    local l_TableData_0 = v30.props.TableData;
    if l_TableData_0.selectedRow then
        local v32 = l_TableData_0.pageRows[l_TableData_0.selectedRow - (l_TableData_0.pageIndex - 1) * l_TableData_0.pageSize];
        return not not v32 and v32.path or nil;
    else
        return nil;
    end;
end;
v21.render = function(v33)
    local l_Stylizer_0 = v33.props.Stylizer;
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal
    }, {
        Left = v1.createElement(l_Pane_0, {
            Size = UDim2.fromScale(0.5, 1), 
            LayoutOrder = 1, 
            Layout = Enum.FillDirection.Vertical
        }, {
            Tools = v1.createElement(l_Pane_0, {
                Padding = l_Stylizer_0.Padding, 
                LayoutOrder = 1, 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Size = UDim2.new(1, 0, 0, 32)
            }, {
                Search = v1.createElement(l_SearchBar_0, {
                    LayoutOrder = 1, 
                    ShowSearchIcon = true, 
                    ShowSearchButton = false, 
                    OnTextChanged = v33.onSearchTable, 
                    Width = 300
                }), 
                Filter = v1.createElement(l_Button_0, {
                    Style = #v33.props.Filter > 0 and "RoundPrimary" or "RoundSubtle", 
                    Size = UDim2.new(0, l_Stylizer_0.ButtonSize, 1, 0), 
                    LayoutOrder = 2, 
                    OnClick = v33.onToggleFilter
                }, {
                    Tooltip = v1.createElement(l_Tooltip_0, {
                        Text = "Exclude higher-order components"
                    }), 
                    Icon = v1.createElement(l_Image_0, {
                        Size = UDim2.fromOffset(l_Stylizer_0.IconSize, l_Stylizer_0.IconSize), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = "rbxasset://textures/DeveloperInspector/Filter.png"
                    })
                }), 
                Clear = v1.createElement(l_Button_0, {
                    Style = "RoundSubtle", 
                    Size = UDim2.new(0, l_Stylizer_0.ButtonSize, 1, 0), 
                    LayoutOrder = 3, 
                    OnClick = v33.onClearTable
                }, {
                    Tooltip = v1.createElement(l_Tooltip_0, {
                        Text = "Clear the table"
                    }), 
                    Icon = v1.createElement(l_Image_0, {
                        Size = UDim2.fromOffset(l_Stylizer_0.IconSize, l_Stylizer_0.IconSize), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = "rbxasset://textures/DeveloperInspector/Bin.png"
                    })
                })
            }), 
            Table = v1.createElement(l_Pane_0, {
                Padding = l_Stylizer_0.Padding, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, -32)
            }, {
                Child = v1.createElement(v6)
            })
        }), 
        Right = v1.createElement(l_Pane_0, {
            Size = UDim2.fromScale(0.5, 1), 
            LayoutOrder = 2, 
            Layout = Enum.FillDirection.Vertical
        }, {
            Tools = v1.createElement(l_Pane_0, {
                Padding = l_Stylizer_0.Padding, 
                LayoutOrder = 1, 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                Size = UDim2.new(1, 0, 0, 32)
            }, {
                View = v1.createElement(l_Button_0, {
                    Style = "Round", 
                    Text = "View Component", 
                    Size = UDim2.new(0, 130, 1, 0), 
                    OnClick = v33.onViewComponent, 
                    StyleModifier = v33:getSelectedPath() == nil and l_StyleModifier_0.Disabled or nil
                })
            }), 
            Table = v1.createElement(l_Pane_0, {
                Padding = l_Stylizer_0.Padding, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, -32)
            }, {
                Child = v1.createElement(v5)
            })
        })
    });
end;
return v2.connect(function(v35)
    return {
        Tabs = v35.Targets.tabs, 
        TableData = v35.RoactInspector.profileComponents, 
        SearchTerm = v35.RoactInspector.profileSearchTerm, 
        Filter = v35.RoactInspector.profileFilter
    };
end, function(v36)
    return {
        clearTable = function()
            v36(v9());
        end, 
        setProfileSearchTerm = function(v37)
            v36(v10(v37));
        end, 
        setProfileFilter = function(v38)
            v36(v11(v38));
        end
    };
end)((l_withContext_0({
    Inspector = v4, 
    Stylizer = l_ContextServices_0.Stylizer
})(v21)));
