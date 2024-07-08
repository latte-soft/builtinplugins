local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local v8 = require(script.Parent.AddGroup);
local v9 = require(script.Parent.Parent.Constants);
local v10 = require(script.Parent.GroupButton);
local v11 = v1.Component:extend("ControlsHeaderRow");
local l_CGECanRenameStudioSelectable_0 = game:GetFastFlag("CGECanRenameStudioSelectable");
v11.init = function(v13)
    v13.textButtonPaneRef = v1.createRef();
    v13.state = {
        editing = false, 
        buttonSize = v9.ControlsHeaderButtonWidth
    };
    v13.onEditingChanged = function(v14)
        v13:setState({
            editing = v14
        });
    end;
    v13.updateButtonFlexSize = function()
        v13:setState(function(_)
            local l_X_0 = v13.textButtonPaneRef:getValue().AbsoluteSize.X;
            if l_X_0 < v9.ControlsHeaderButtonWidth * 2 then
                return {
                    buttonSize = l_X_0 - v9.ControlsHeaderButtonWidth
                };
            else
                return {
                    buttonSize = v9.ControlsHeaderButtonWidth
                };
            end;
        end);
    end;
end;
v11.render = function(v17)
    local l_props_0 = v17.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_ControlsHeaderRow_0 = l_props_0.Stylizer.ControlsHeaderRow;
    local v21 = true;
    local v22 = true;
    for _, v24 in l_props_0.Groups, nil, nil do
        if v24.UISelected then
            if v24.Name == v9.CursorGroupName then
                v22 = false;
                v21 = not l_CGECanRenameStudioSelectable_0;
                break;
            elseif v24.Name == "Default" then
                v21 = false;
                v22 = false;
                break;
            else
                break;
            end;
        end;
    end;
    return v1.createElement(l_Pane_0, {
        Size = l_ControlsHeaderRow_0.Size, 
        Padding = l_ControlsHeaderRow_0.Padding, 
        Spacing = l_ControlsHeaderRow_0.Spacing, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal
    }, {
        TextButtonPane = v1.createElement("Frame", {
            Size = l_ControlsHeaderRow_0.TextButtonPane.Size, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            [v1.Change.AbsoluteSize] = v17.updateButtonFlexSize, 
            [v1.Ref] = v17.textButtonPaneRef
        }, {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            ToggleViewButton = v1.createElement(l_Pane_0, {
                Size = UDim2.new(0, v17.state.buttonSize, 1, 0), 
                LayoutOrder = 1, 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }, {
                Button = v1.createElement(l_Button_0, {
                    Style = "Round", 
                    Text = if not l_props_0.ToggleListView then l_Localization_1:getText("Actions", "ListView") else l_Localization_1:getText("Actions", "TableView"), 
                    Size = UDim2.fromOffset(v17.state.buttonSize, l_ControlsHeaderRow_0.ButtonHeight), 
                    OnClick = l_props_0.OnViewModeToggled
                })
            }), 
            AddGroupButton = v1.createElement(l_Pane_0, {
                Size = UDim2.new(1, -v17.state.buttonSize, 1, 0), 
                LayoutOrder = 2, 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }, {
                Button = v1.createElement(v8, {
                    Groups = l_props_0.Groups, 
                    OnGroupAdded = l_props_0.OnGroupAdded, 
                    OnEditingChanged = v17.onEditingChanged
                })
            })
        }), 
        GroupButtonsPane = v1.createElement(l_Pane_0, {
            Size = l_ControlsHeaderRow_0.GroupButtonsPaneSize, 
            LayoutOrder = 2, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        }, {
            RenameButton = if not v21 then nil else v1.createElement(v10, {
                Style = "Rename", 
                OnClick = l_props_0.OnGroupRenamed, 
                TooltipMessage = l_props_0.Localization:getText("Tooltip", "Rename"), 
                LayoutOrder = 1
            }), 
            DeleteButton = if not v22 then nil else v1.createElement(v10, {
                Style = "Delete", 
                OnClick = l_props_0.OnGroupDeleted, 
                TooltipMessage = l_props_0.Localization:getText("Tooltip", "Delete"), 
                LayoutOrder = 2
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_Localization_0
})(v11));
