local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_AccessoryAndBodyToolShared_0 = v3.Util.AccessoryAndBodyToolShared;
local l_AccessoryUtil_0 = l_AccessoryAndBodyToolShared_0.AccessoryUtil;
local l_Constants_0 = l_AccessoryAndBodyToolShared_0.Constants;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v14 = require(l_Parent_0.Src.Util.findLocalizedStringKey);
local v15 = require(l_Parent_0.Src.Util.makeDropdownList);
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_Util_0 = v4.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v20 = v1.PureComponent:extend("ScaleTypeDropdown");
l_Typecheck_0.wrap(v20, script);
v20.initWithPreviousScaleTypeInfo = function(v21)
    local l_props_0 = v21.props;
    local v23 = l_AccessoryUtil_0:getScaleType((v21.props.EditingItemContext:getItem()));
    local v24 = nil;
    v24 = if not v23 then l_props_0.Localization:getText("ScaleType", l_Constants_0.SCALE_TYPES.Classic) else l_props_0.Localization:getText("ScaleType", v23);
    v21.onClickScaleType(v24, v2.List.find(v21.scaleTypeList, v24));
end;
v20.didMount = function(v25)
    local l_props_1 = v25.props;
    v25.scaleTypeList = v15(l_props_1.Localization, "ScaleType", l_Constants_0.SCALE_TYPES);
    v25:initWithPreviousScaleTypeInfo();
    v25.editingItemChangedHandle = v25.props.EditingItemContext:getEditingItemChangedSignal():Connect(function(v27)
        l_AccessoryUtil_0:setScaleType(v27, (v14(l_props_1.Localization, "ScaleType", v25.scaleTypeList[v25.state.selectedScaleTypeIndex], l_Constants_0.SCALE_TYPES)));
    end);
end;
v20.init = function(v28)
    v28.state = {
        selectedScaleTypeIndex = nil
    };
    v28.onClickScaleType = function(v29, v30)
        local l_props_2 = v28.props;
        l_AccessoryUtil_0:setScaleType(l_props_2.EditingItemContext:getItem(), (v14(l_props_2.Localization, "ScaleType", v29, l_Constants_0.SCALE_TYPES)));
        v28:setState({
            selectedScaleTypeIndex = v30
        });
    end;
end;
v20.render = function(v32)
    local l_props_3 = v32.props;
    local l_state_0 = v32.state;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_Localization_0 = l_props_3.Localization;
    local l_selectedScaleTypeIndex_0 = l_state_0.selectedScaleTypeIndex;
    local v39 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.DropdownHeight), 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = l_Stylizer_0.Spacing
    }, {
        SelectPartScalePrompt = v1.createElement(l_TextLabel_0, {
            Text = l_Localization_0:getText("ScaleType", "Select") .. ":", 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v39:getNextOrder()
        }), 
        AvatarPartScaleTypeDropdown = v1.createElement(l_SelectInput_0, {
            Size = UDim2.new(0, l_Stylizer_0.DropdownWidth, 1, 0), 
            Items = v32.scaleTypeList, 
            OnItemActivated = v32.onClickScaleType, 
            SelectedIndex = l_selectedScaleTypeIndex_0, 
            LayoutOrder = v39:getNextOrder()
        })
    });
end;
v20.willUnmount = function(v40)
    if v40.editingItemChangedHandle then
        v40.editingItemChangedHandle:Disconnect();
        v40.editingItemChangedHandle = nil;
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    EditingItemContext = l_EditingItemContext_0
})(v20));
