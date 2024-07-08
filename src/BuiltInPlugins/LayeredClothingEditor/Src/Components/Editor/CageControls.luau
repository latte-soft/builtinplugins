local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_Signals_0 = v3.Contexts.Signals;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_DropdownMenuButton_0 = v3.Components.DropdownMenuButton;
local l_SplitToggleButton_0 = v3.Components.SplitToggleButton;
local _ = v3.Util.AccessoryAndBodyToolShared.AvatarUtil;
local l_WrapUtil_0 = v3.Util.AccessoryAndBodyToolShared.WrapUtil;
local v10 = require(l_Parent_0.Src.Thunks.SelectEditingCage);
local v11 = require(l_Parent_0.Src.Actions.SetToolMode);
local v12 = require(l_Parent_0.Src.Components.Editor.FalloffSlider);
local v13 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v13.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_StyleModifier_0 = v13.Util.StyleModifier;
local l_UI_0 = v13.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local _ = l_UI_0.IconButton;
local l_Image_0 = l_UI_0.Image;
local v22 = require(l_Parent_0.Src.Util.Constants);
local v23 = v1.PureComponent:extend("CageControls");
local l_LayoutOrderIterator_0 = v13.Util.LayoutOrderIterator;
v23.init = function(v25)
    v25.state = {
        isAutoSkinBehaviorOverride = false
    };
    v25.autoSkinButtonClicked = function()
        local l_props_0 = v25.props;
        local v27 = l_props_0.EditingItemContext:getItem();
        local v28 = l_WrapUtil_0:getAutoSkinningBehavior(v27);
        local l_EnabledOverride_0 = Enum.WrapLayerAutoSkin.EnabledOverride;
        if v28 == l_EnabledOverride_0 then
            l_EnabledOverride_0 = Enum.WrapLayerAutoSkin.EnabledPreserve;
        end;
        l_WrapUtil_0:setAutoSkinningBehavior(v27, l_EnabledOverride_0);
        v25:setState({
            isAutoSkinBehaviorOverride = v25.isAutoSkinBehaviorOverride(l_EnabledOverride_0)
        });
        l_props_0.Analytics:getHandler("AutoSkinningToggled")(v25.isAutoSkinBehaviorOverride(l_EnabledOverride_0));
    end;
    v25.isAutoSkinBehaviorOverride = function(v30)
        return v30 == Enum.WrapLayerAutoSkin.EnabledOverride;
    end;
    v25.cageEditingButtonClicked = function()
        if v25.props.ToolMode == v22.TOOL_MODE.Point then
            v25.props.SetToolMode(v22.TOOL_MODE.None);
            return ;
        else
            v25.props.SetToolMode(v22.TOOL_MODE.Point);
            return ;
        end;
    end;
    v25.outerCageButtonClicked = function()
        if v25.props.EditingCage ~= Enum.CageType.Outer then
            v25.props.SelectEditingCage(Enum.CageType.Outer);
            v25.props.Signals:get(v22.SIGNAL_KEYS.SelectionChanged):Fire();
        end;
    end;
    v25.innerCageButtonClicked = function()
        if v25.props.EditingCage ~= Enum.CageType.Inner then
            v25.props.SelectEditingCage(Enum.CageType.Inner);
            v25.props.Signals:get(v22.SIGNAL_KEYS.SelectionChanged):Fire();
        end;
    end;
    v25.isCageEditingActive = function()
        return v25.props.ToolMode == v22.TOOL_MODE.Point;
    end;
end;
v23.renderButton = function(v31, v32, v33, v34, v35, v36)
    local l_Stylizer_0 = v31.props.Stylizer;
    local l_ButtonSize_0 = l_Stylizer_0.ButtonSize;
    return v1.createElement(l_Button_0, {
        Style = l_Stylizer_0.ButtonStyle, 
        StyleModifier = v32, 
        Size = UDim2.fromOffset(l_ButtonSize_0, l_ButtonSize_0), 
        LayoutOrder = v33, 
        OnClick = v35, 
        Tooltip = v36
    }, {
        Settings = v1.createElement(l_Image_0, {
            Image = v34
        })
    });
end;
v23.didMount = function(v39)
    local v40 = v39.props.EditingItemContext:getItem();
    if v40 then
        local v41 = l_WrapUtil_0:getAutoSkinningBehavior(v40);
        if v41 == Enum.WrapLayerAutoSkin.Disabled then
            v41 = Enum.WrapLayerAutoSkin.EnabledOverride;
        end;
        l_WrapUtil_0:setAutoSkinningBehavior(v40, v41);
        v39:setState({
            isAutoSkinBehaviorOverride = v39.isAutoSkinBehaviorOverride(v41)
        });
        return ;
    else
        return ;
    end;
end;
v23.render = function(v42)
    local l_props_1 = v42.props;
    local l_state_0 = v42.state;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Localization_0 = l_props_1.Localization;
    local l_EditingCage_0 = l_props_1.EditingCage;
    local l_ShowMinimal_0 = l_props_1.ShowMinimal;
    local l_MenuOptions_0 = l_props_1.MenuOptions;
    local l_OnMenuOptionClicked_0 = l_props_1.OnMenuOptionClicked;
    local l_ShowOptionsButton_0 = l_props_1.ShowOptionsButton;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_Padding_0 = l_Stylizer_1.Padding;
    local l_ButtonSize_1 = l_Stylizer_1.ButtonSize;
    local v55 = 2 * l_Padding_0 + l_ButtonSize_1;
    local v56 = v42.isCageEditingActive();
    local l_isAutoSkinBehaviorOverride_0 = l_state_0.isAutoSkinBehaviorOverride;
    local v58 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(0, 0, 0, v55), 
        AutomaticSize = Enum.AutomaticSize.X, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_LayoutOrder_0, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = l_Padding_0, 
        Padding = l_Padding_0
    }, {
        CageEditingButton = v42:renderButton(if not v56 then nil else l_StyleModifier_0.Pressed, v58:getNextOrder(), l_Stylizer_1.CageModeIcon, v42.cageEditingButtonClicked, l_Localization_0:getText("EditingMode", "Text")), 
        CageTypeToggle = v56 and v1.createElement(l_SplitToggleButton_0, {
            ButtonSize = l_Stylizer_1.ButtonSize, 
            LayoutOrder = v58:getNextOrder(), 
            LeftIcon = l_Stylizer_1.OuterCageIcon, 
            RightIcon = l_Stylizer_1.InnerCageIcon, 
            LeftTooltipText = l_Localization_0:getText("EditingMode", "OuterCage"), 
            RightTooltipText = l_Localization_0:getText("EditingMode", "InnerCage"), 
            OnLeftSideClick = v42.outerCageButtonClicked, 
            OnRightSideClick = v42.innerCageButtonClicked, 
            IsOn = l_EditingCage_0 == Enum.CageType.Inner
        }), 
        FalloffSlider = v56 and v1.createElement(v12, {
            LayoutOrder = v58:getNextOrder(), 
            ShowMinimal = l_ShowMinimal_0
        }), 
        AutoSkinButton = v42:renderButton(if not l_isAutoSkinBehaviorOverride_0 then nil else l_StyleModifier_0.Pressed, v58:getNextOrder(), l_Stylizer_1.AutoWeightIcon, v42.autoSkinButtonClicked, if not l_isAutoSkinBehaviorOverride_0 then l_Localization_0:getText("EditingMode", "AutoWeightPreserve") else l_Localization_0:getText("EditingMode", "AutoWeightOverride")), 
        OptionsDropdownButton = l_ShowOptionsButton_0 and v1.createElement(l_DropdownMenuButton_0, {
            ButtonSize = l_ButtonSize_1, 
            Icon = l_Stylizer_1.OptionsIcon, 
            Items = l_MenuOptions_0, 
            OnItemActivated = l_OnMenuOptionClicked_0, 
            LayoutOrder = v58:getNextOrder()
        })
    });
end;
return v2.connect(nil, function(v59)
    return {
        SelectEditingCage = function(v60)
            v59(v10(v60));
        end, 
        SetToolMode = function(v61)
            v59(v11(v61));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Signals = l_Signals_0, 
    Localization = l_ContextServices_0.Localization, 
    EditingItemContext = l_EditingItemContext_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v23)));
