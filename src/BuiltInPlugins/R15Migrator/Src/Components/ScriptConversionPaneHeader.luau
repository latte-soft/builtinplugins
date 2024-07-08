local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetFilter);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Button_0 = l_UI_0.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Util_0 = v1.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v15 = v2.PureComponent:extend("ScriptConversionPaneHeader");
v15.buildItems = function(v16)
    local l_props_0 = v16.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_diagnostics_0 = l_props_0.diagnostics;
    local v20 = {};
    for _, v22 in l_diagnostics_0, nil, nil do
        for _, v24 in v22:Get() do
            v20[v24.instanceName] = true;
        end;
    end;
    local v25 = v3.Dictionary.keys(v20);
    table.sort(v25);
    return v3.List.join({
        l_Localization_0:getText("ScriptConversion", "FilterNone")
    }, v25);
end;
v15.getFilterIndex = function(v26, v27, v28)
    if not v28 then
        v28 = v26.state.items;
    end;
    for v29, v30 in v28, nil, nil do
        if v30 == v27 then
            return v29;
        end;
    end;
    return nil;
end;
v15.init = function(v31)
    v31.state = {
        items = {}
    };
    v31.onFilterSelected = function(v32)
        v31.props.SetFilter(v32);
    end;
    v31.onRenderItem = function(v33, v34, v35, v36)
        local l_Stylizer_0 = v31.props.Stylizer;
        return v2.createElement(l_Button_0, {
            LayoutOrder = v34, 
            OnClick = v35, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.ItemHeight), 
            StyleModifier = if not v36 then nil else l_StyleModifier_0.Hover
        }, {
            Label = v2.createElement(l_TextLabel_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = v33, 
                TextSize = l_Stylizer_0.ListItemTextSize, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_Stylizer_0.ListItemPadding)
                })
            })
        });
    end;
end;
v15.didMount = function(v38)
    v38:setState({
        items = v38:buildItems()
    });
end;
v15.didUpdate = function(v39, v40, _)
    local l_props_1 = v39.props;
    local l_filter_0 = l_props_1.filter;
    local l_Localization_1 = l_props_1.Localization;
    if l_props_1.diagnostics ~= v40.diagnostics then
        local v45 = v39:buildItems();
        v39:setState({
            items = v45
        });
        if not v39:getFilterIndex(l_filter_0, v45) then
            v39.props.SetFilter(l_Localization_1:getText("ScriptConversion", "FilterNone"));
        end;
    end;
end;
v15.render = function(v46)
    local l_props_2 = v46.props;
    local l_items_0 = v46.state.items;
    local l_Localization_2 = l_props_2.Localization;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Stylizer_1 = l_props_2.Stylizer;
    local l_Size_0 = l_props_2.Size;
    local l_filter_1 = l_props_2.filter;
    local v54 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = l_Stylizer_1.Padding, 
        Spacing = l_Stylizer_1.Spacing
    }, {
        FilterContainer = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_1.FilterHeight), 
            LayoutOrder = v54:getNextOrder()
        }, {
            FilterLabel = v2.createElement(l_TextLabel_0, {
                Text = l_Localization_2:getText("ScriptConversion", "Filter"), 
                Position = UDim2.fromScale(0, 0.5), 
                AnchorPoint = Vector2.new(0, 0.5), 
                AutomaticSize = Enum.AutomaticSize.XY
            }), 
            Filter = v2.createElement(l_SelectInput_0, {
                AnchorPoint = Vector2.new(1, 0), 
                PlaceholderText = l_Localization_2:getText("ScriptConversion", "Filter"), 
                SelectedIndex = v46:getFilterIndex(l_filter_1), 
                Items = l_items_0, 
                OnItemActivated = v46.onFilterSelected, 
                OnRenderItem = v46.onRenderItem, 
                Size = UDim2.fromOffset(l_Stylizer_1.FilterWidth, l_Stylizer_1.FilterHeight), 
                Position = UDim2.fromScale(1, 0), 
                LayoutOrder = v54:getNextOrder()
            })
        })
    });
end;
return v4.connect(function(v55, _)
    return {
        diagnostics = v55.ScriptConversion.diagnostics, 
        filter = v55.ScriptConversion.filter
    };
end, function(v57)
    return {
        SetFilter = function(v58)
            v57(v6(v58));
        end
    };
end)((l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v15)));
