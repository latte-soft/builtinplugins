local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v7 = require(script.Parent.Parent.Constants);
local v8 = require(script.Parent.ControlsHeaderRow);
local v9 = require(script.Parent.GroupCollisionMatrix);
local v10 = require(script.Parent.GroupLabelColumn);
local v11 = require(script.Parent.GroupListView);
local v12 = require(script.Parent.ListHeader);
local v13 = require(script.Parent.TableHeader);
local v14 = require(script.Parent.GroupRenameDialog);
local v15 = v1.Component:extend("MainView");
hover = function(v16, v17)
    return {
        Key = v16, 
        Gui = v17
    };
end;
v15.init = function(v18)
    v18.rowHover = hover("", nil);
    v18.colHover = hover("", nil);
    v18.rowHoverForced = function(v19)
        v18:setState({
            RowHovered = v19
        });
    end;
    v18.onRowHovered = function(v20, v21, v22)
        if not v22 then
            if v18.rowHover.Gui == v20 then
                v18:setState({
                    RowHovered = ""
                });
            end;
            return ;
        else
            v18:setState({
                RowHovered = v21
            });
            v18.rowHover.Gui = v20;
            return ;
        end;
    end;
    v18.onColHovered = function(v23, v24, v25)
        if not v25 then
            if v18.colHover.Gui == v23 then
                v18:setState({
                    ColHovered = ""
                });
            end;
            return ;
        else
            v18:setState({
                ColHovered = v24
            });
            v18.colHover.Gui = v23;
            return ;
        end;
    end;
    v18.onScrolled = function(v26)
        v18:setState({
            ScrollPositionX = v26.X, 
            ScrollPositionY = v26.Y
        });
    end;
    v18.onViewModeToggled = function()
        v18:setState(function(v27)
            return {
                ToggleListView = not v27.ToggleListView
            };
        end);
    end;
    v18.state = {
        ScrollPositionX = 0, 
        ScrollPositionY = 0, 
        RowHovered = "", 
        ColHovered = "", 
        ToggleListView = true
    };
end;
v15.render = function(v28)
    local l_props_0 = v28.props;
    local l_MainView_0 = l_props_0.Stylizer.MainView;
    return v1.createElement(l_Pane_0, {
        Style = "Box", 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        ControlsHeaderRow = v1.createElement(v8, {
            OnGroupAdded = l_props_0.OnGroupAdded, 
            OnGroupDeleted = l_props_0.OnGroupDeleted, 
            OnGroupRenamed = l_props_0.OnGroupRenamed, 
            UISelectedId = l_props_0.UISelectedId, 
            OnViewModeToggled = v28.onViewModeToggled, 
            ToggleListView = v28.state.ToggleListView, 
            LayoutOrder = 1, 
            Groups = l_props_0.Groups, 
            Window = l_props_0.Window
        }), 
        Header = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, v7.GroupRowHeight), 
            LayoutOrder = 2, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            TableHeader = v1.createElement(v13, {
                LayoutOrder = not v28.state.ToggleListView and 1 or 2, 
                Groups = l_props_0.Groups, 
                ColHovered = v28.state.ColHovered, 
                OnColHovered = v28.onColHovered, 
                ScrollPositionX = v28.state.ScrollPositionX
            }), 
            ListHeader = v1.createElement(v12, {
                LayoutOrder = not v28.state.ToggleListView and 2 or 1, 
                SelectedGroupName = if v11.getSelectedGroup(l_props_0.Groups) ~= "" then v11.getSelectedGroup(l_props_0.Groups).Name else "", 
                GroupCount = #l_props_0.Groups
            })
        }), 
        Middle = v1.createElement(l_Pane_0, {
            Size = l_MainView_0.MiddlePaneSize, 
            LayoutOrder = 3, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            GroupLabelColumn = v1.createElement(v10, {
                LayoutOrder = 1, 
                Groups = l_props_0.Groups, 
                Window = l_props_0.Window, 
                RowHovered = v28.state.RowHovered, 
                OnRowHovered = v28.onRowHovered, 
                ScrollPositionY = v28.state.ScrollPositionY, 
                ToggleListView = v28.state.ToggleListView
            }), 
            GridFrame = v1.createElement(l_ScrollingFrame_0, {
                Size = l_MainView_0.GridFrameSize, 
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                ScrollingDirection = Enum.ScrollingDirection.XY, 
                LayoutOrder = not v28.state.ToggleListView and 2 or 3, 
                OnScrollUpdate = v28.onScrolled, 
                Layout = Enum.FillDirection.Horizontal, 
                Padding = 0
            }, {
                GroupCollisionMatrix = not v28.state.ToggleListView and v1.createElement(v9, {
                    Groups = l_props_0.Groups, 
                    RowHovered = v28.state.RowHovered, 
                    OnColHovered = v28.onColHovered, 
                    OnRowHovered = v28.onRowHovered
                })
            }), 
            ListFrame = v28.state.ToggleListView and v1.createElement(l_ScrollingFrame_0, {
                Size = l_MainView_0.ListFrameSize, 
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                LayoutOrder = not v28.state.ToggleListView and 3 or 2, 
                Layout = Enum.FillDirection.Horizontal, 
                ScrollingDirection = Enum.ScrollingDirection.Y
            }, {
                GroupListView = v1.createElement(v11, {
                    Groups = l_props_0.Groups, 
                    UISelectedId = l_props_0.UISelectedId, 
                    RowHovered = v28.state.RowHovered, 
                    OnColHovered = v28.onColHovered, 
                    OnRowHovered = v28.onRowHovered
                })
            })
        }), 
        GroupRenameDialog = v1.createElement(v14, {
            Enabled = l_props_0.GroupRenameDialogOpen, 
            OnClose = l_props_0.OnGroupRenameDialogClosed
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v15));
