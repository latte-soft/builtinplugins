local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local v9 = require(script.Parent.Parent.Constants);
local v10 = require(script.Parent.GroupRenameTextBox);
local v11 = require(script.Parent.GroupButton);
local v12 = v1.PureComponent:extend("GroupLabel");
v12.init = function(v13)
    v13.state = {
        pressed = false
    };
    v13.onClick = function()
        v13:setState({
            pressed = false
        });
        local l_Name_0 = v13.props.Group.Name;
        if (v13.props.Group.UISelected and l_Name_0 ~= "Default") and l_Name_0 ~= v9.CursorGroupName then
            v13.props.Group.OnRenamed();
            return ;
        else
            v13.props.Group.OnSelected();
            return ;
        end;
    end;
    v13.onPress = function()
        v13:setState({
            pressed = true
        });
    end;
    v13.onMouseEnter = function(v15, _)
        v13.props.OnRowHovered(v15, v13.props.Group.Name, true);
    end;
    v13.onMouseLeave = function(v17, _)
        v13.props.OnRowHovered(v17, v13.props.Group.Name, false);
        v13:setState({
            pressed = false
        });
    end;
end;
v12.render = function(v19)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_Renaming_0 = l_props_0.Group.Renaming;
    local v24 = nil;
    if not v19.state.pressed then
        if not l_props_0.Group.UISelected or l_Renaming_0 then
            if l_props_0.Hovered then
                v24 = l_StyleModifier_0.Hover;
            end;
        else
            v24 = l_StyleModifier_0.Selected;
        end;
    else
        v24 = l_StyleModifier_0.Pressed;
    end;
    local l_Name_1 = l_props_0.Group.Name;
    local v26 = l_Name_1 == v9.CursorGroupName;
    return v1.createElement(l_Pane_0, {
        Style = "GroupLabel", 
        StyleModifier = v24, 
        Size = v9.GroupLabelFixedSize, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        OnClick = v19.onClick, 
        OnPress = v19.onPress, 
        [v1.Event.MouseEnter] = v19.onMouseEnter, 
        [v1.Event.MouseLeave] = v19.onMouseLeave
    }, {
        SetMembershipButton = if v26 then nil else v1.createElement(v11, {
            Style = "SetMembership", 
            TooltipMessage = l_Localization_0:getText("Tooltip", "Add"), 
            OnClick = l_props_0.Group.OnMembershipSet, 
            LayoutOrder = 1
        }), 
        GroupRenameTextBox = l_Renaming_0 and v1.createElement(v10, {
            Size = l_Stylizer_0.GroupLabelStyle.GroupNameLabelSize, 
            Group = l_props_0.Group, 
            LayoutOrder = 2
        }), 
        Text = not l_Renaming_0 and v1.createElement(l_TextLabel_0, {
            Size = if not v26 then l_Stylizer_0.GroupLabelStyle.GroupNameLabelSize else l_Stylizer_0.GroupLabelStyle.CursorGroupNameLabelSize, 
            Style = "GroupLabel", 
            LayoutOrder = 3, 
            Text = l_Name_1, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            StyleModifier = v24
        }, {
            HoverArea = v1.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v12));
