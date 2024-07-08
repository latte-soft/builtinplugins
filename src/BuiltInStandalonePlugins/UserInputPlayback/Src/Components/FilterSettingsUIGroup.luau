local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local v8 = require(l_Parent_0.Src.Components.LabeledToggleButton);
local v9 = require(l_Parent_0.Src.Actions.EventTypeEnabled.SetGamepadEnabled);
local v10 = require(l_Parent_0.Src.Actions.EventTypeEnabled.SetKeyboardEnabled);
local v11 = require(l_Parent_0.Src.Actions.EventTypeEnabled.SetMouseClickEnabled);
local v12 = require(l_Parent_0.Src.Actions.EventTypeEnabled.SetMouseMoveEnabled);
local v13 = require(l_Parent_0.Src.Actions.EventTypeEnabled.SetTouchEnabled);
local v14 = v1.PureComponent:extend("FilterSettingsUIGroup");
v14.init = function(v15, v16)
    assert(v16.RoduxStoreContext);
    v15.toggleMouseMove = function()
        local l_props_0 = v15.props;
        l_props_0.SetMouseMoveEnabled(not l_props_0.EnabledMouseMove, l_props_0.RoduxStoreContext);
    end;
    v15.toggleMouseClick = function()
        local l_props_1 = v15.props;
        l_props_1.SetMouseClickEnabled(not l_props_1.EnabledMouseClick, l_props_1.RoduxStoreContext);
    end;
    v15.toggleKeyboard = function()
        local l_props_2 = v15.props;
        l_props_2.SetKeyboardEnabled(not l_props_2.EnabledKeyboard, l_props_2.RoduxStoreContext);
    end;
    v15.toggleGamepad = function()
        local l_props_3 = v15.props;
        l_props_3.SetGamepadEnabled(not l_props_3.EnabledGamepad, l_props_3.RoduxStoreContext);
    end;
    v15.toggleTouch = function()
        local l_props_4 = v15.props;
        l_props_4.SetTouchEnabled(not l_props_4.EnabledTouch, l_props_4.RoduxStoreContext);
    end;
end;
v14.render = function(v22)
    local l_props_5 = v22.props;
    local l_Localization_0 = l_props_5.Localization;
    local l_Stylizer_0 = l_props_5.Stylizer;
    local l_Disabled_0 = v22.props.Disabled;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_5.LayoutOrder, 
        Style = "CornerBox", 
        Size = UDim2.fromOffset(l_Stylizer_0.UIGroupWidthPx, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = UDim.new(0, l_Stylizer_0.PaddingPx), 
        Padding = l_Stylizer_0.PaddingPx, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            Text = l_Localization_0:getText("PlaybackTabView", "FilterEventsLabel"), 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        }), 
        GridLayoutArea = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.GridAreaHeightPx), 
            LayoutOrder = 1
        }, {
            Layout = v1.createElement("UIGridLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                CellPadding = UDim2.fromOffset(l_Stylizer_0.PaddingPx, l_Stylizer_0.GridCellPaddingYPx), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                CellSize = l_Stylizer_0.GridLayoutCellSize
            }), 
            MouseMoveEnabled = v1.createElement(v8, {
                Selected = l_props_5.EnabledMouseMove, 
                OnClick = v22.toggleMouseMove, 
                Text = l_Localization_0:getText("RecordTabView", "FilterNameMouseMove"), 
                Disabled = l_Disabled_0
            }), 
            MouseClickEnabled = v1.createElement(v8, {
                Selected = l_props_5.EnabledMouseClick, 
                OnClick = v22.toggleMouseClick, 
                Text = l_Localization_0:getText("RecordTabView", "FilterNameMouseClick"), 
                Disabled = l_Disabled_0
            }), 
            KeyboardEnabled = v1.createElement(v8, {
                Selected = l_props_5.EnabledKeyboard, 
                OnClick = v22.toggleKeyboard, 
                Text = l_Localization_0:getText("RecordTabView", "FilterNameKeyboard"), 
                Disabled = l_Disabled_0
            }), 
            GamepadEnabled = v1.createElement(v8, {
                Selected = l_props_5.EnabledGamepad, 
                OnClick = v22.toggleGamepad, 
                Text = l_Localization_0:getText("RecordTabView", "FilterNameGamepad"), 
                Disabled = l_Disabled_0
            }), 
            TouchEnabled = v1.createElement(v8, {
                Selected = l_props_5.EnabledTouch, 
                OnClick = v22.toggleTouch, 
                Text = l_Localization_0:getText("RecordTabView", "FilterNameTouch"), 
                Disabled = l_Disabled_0
            })
        })
    });
end;
return v2.connect(function(v27, v28)
    local v29 = v27[v28.RoduxStoreContext];
    return {
        EnabledMouseMove = v29.mouseMove, 
        EnabledMouseClick = v29.mouseClick, 
        EnabledKeyboard = v29.keyboard, 
        EnabledGamepad = v29.gamepad, 
        EnabledTouch = v29.touch
    };
end, function(v30)
    return {
        SetMouseMoveEnabled = function(v31, v32)
            v30(v12(v31, v32));
        end, 
        SetMouseClickEnabled = function(v33, v34)
            v30(v11(v33, v34));
        end, 
        SetKeyboardEnabled = function(v35, v36)
            v30(v10(v35, v36));
        end, 
        SetGamepadEnabled = function(v37, v38)
            v30(v9(v37, v38));
        end, 
        SetTouchEnabled = function(v39, v40)
            v30(v13(v39, v40));
        end
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v14)));
