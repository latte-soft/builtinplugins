local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_EditingItemContext_0 = v2.Contexts.EditingItemContext;
local l_AvatarUtil_0 = v2.Util.AccessoryAndBodyToolShared.AvatarUtil;
local l_DropdownMenuButton_0 = v2.Components.DropdownMenuButton;
local v6 = require(l_Parent_0.Src.Components.Editor.EditTransparencyView);
local v7 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v7.Util.StyleModifier;
local l_UI_0 = v7.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local _ = l_UI_0.IconButton;
local l_Image_0 = l_UI_0.Image;
local v16 = require(l_Parent_0.Src.Util.Constants);
local v17 = v1.PureComponent:extend("VisibilityControls");
local l_LayoutOrderIterator_0 = v7.Util.LayoutOrderIterator;
v17.defaultProps = {
    Offset = 0
};
v17.init = function(v19)
    v19.state = {
        isCageSlider = false
    };
    v19.isCageEditingActive = function()
        return v19.props.ToolMode == v16.TOOL_MODE.Point;
    end;
    v19.getMenuIcons = function()
        local l_props_0 = v19.props;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local l_Localization_0 = l_props_0.Localization;
        local v23 = {};
        table.insert(v23, {
            icon = l_Stylizer_0.MeshPartVisibilityIcon, 
            tooltip = l_Localization_0:getText("Opacity", "Mesh")
        });
        if v19.isCageEditingActive() then
            table.insert(v23, {
                icon = l_Stylizer_0.CageVisibilityIcon, 
                tooltip = l_Localization_0:getText("Opacity", "Cage")
            });
        end;
        return v23;
    end;
    v19.onMenuOptionClicked = function(_, v25)
        local l_props_1 = v19.props;
        local l_state_0 = v19.state;
        local l_Stylizer_1 = l_props_1.Stylizer;
        local l_icons_0 = l_state_0.icons;
        v19:setState({
            isCageSlider = not not l_icons_0[v25] and l_icons_0[v25].icon == l_Stylizer_1.CageVisibilityIcon
        });
    end;
    v19.onFocusMannequinClicked = function()
        local l_props_2 = v19.props;
        local v31 = l_props_2.EditingItemContext:getItem();
        if not (not v31 or not v31.Parent) then
            l_AvatarUtil_0:focusCameraOnAvatar(v31.Parent);
            l_props_2.Analytics:getHandler("ZoomToAvatar")();
        end;
    end;
end;
v17.didMount = function(v32, _)
    v32:setState({
        icons = v32:getMenuIcons()
    });
end;
v17.didUpdate = function(v34, v35)
    if v35.ToolMode ~= v34.props.ToolMode then
        v34:setState({
            icons = v34:getMenuIcons(), 
            isCageSlider = not not v34.isCageEditingActive() and v34.state.isCageSlider
        });
    end;
end;
v17.render = function(v36)
    local l_props_3 = v36.props;
    local l_state_1 = v36.state;
    local l_AnchorPoint_0 = l_props_3.AnchorPoint;
    local l_ToolMode_0 = l_props_3.ToolMode;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_Localization_1 = l_props_3.Localization;
    local l_Offset_0 = l_props_3.Offset;
    local l_Stylizer_2 = l_props_3.Stylizer;
    local l_MenuOptions_0 = l_props_3.MenuOptions;
    local l_OnMenuOptionClicked_0 = l_props_3.OnMenuOptionClicked;
    local l_ShowOptionsButton_0 = l_props_3.ShowOptionsButton;
    local l_Padding_0 = l_Stylizer_2.Padding;
    local l_PaddingSmall_0 = l_Stylizer_2.PaddingSmall;
    local l_ButtonSize_0 = l_Stylizer_2.ButtonSize;
    local l_icons_1 = l_state_1.icons;
    local v52 = 2 * l_Padding_0 + l_ButtonSize_0;
    local v53 = l_ToolMode_0 == v16.TOOL_MODE.Point;
    local v54 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        AnchorPoint = l_AnchorPoint_0, 
        Position = UDim2.new(1, -l_Offset_0, 0, 0), 
        Size = UDim2.new(0, 0, 0, v52), 
        AutomaticSize = Enum.AutomaticSize.X, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_LayoutOrder_0, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        Spacing = l_Padding_0, 
        Padding = l_Padding_0
    }, {
        OptionsDropdownButton = l_ShowOptionsButton_0 and v1.createElement(l_DropdownMenuButton_0, {
            ButtonSize = l_ButtonSize_0, 
            Icon = l_Stylizer_2.OptionsIcon, 
            Items = l_MenuOptions_0, 
            OnItemActivated = l_OnMenuOptionClicked_0, 
            LayoutOrder = v54:getNextOrder()
        }), 
        TransparencySettingsContainer = v53 and v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_PaddingSmall_0, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            Style = "RoundBox", 
            LayoutOrder = v54:getNextOrder()
        }, {
            TransparencyDropdownButton = v1.createElement(l_DropdownMenuButton_0, {
                ButtonSize = l_ButtonSize_0, 
                Items = l_icons_1, 
                IsIconList = true, 
                OnItemActivated = v36.onMenuOptionClicked, 
                LayoutOrder = v54:getNextOrder()
            }), 
            EditTransparencyView = v1.createElement(v6, {
                IsCageSlider = v36.isCageEditingActive() and v36.state.isCageSlider, 
                LayoutOrder = v54:getNextOrder()
            })
        }), 
        FocusMannequinButton = v1.createElement(l_Button_0, {
            Style = "Round", 
            Size = UDim2.fromOffset(l_ButtonSize_0, l_ButtonSize_0), 
            LayoutOrder = v54:getNextOrder(), 
            OnClick = v36.onFocusMannequinClicked, 
            Tooltip = l_Localization_1:getText("Preview", "FocusCamera")
        }, {
            Settings = v1.createElement(l_Image_0, {
                Image = l_Stylizer_2.FocusMannequinIcon
            })
        })
    });
end;
return (l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    EditingItemContext = l_EditingItemContext_0, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v17));
