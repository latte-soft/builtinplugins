local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local v8 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local l_Stylizer_0 = v3.Style.Stylizer;
local v10 = require(l_Parent_0.Src.Components.Common.DropdownField);
local v11 = require(l_Parent_0.Src.Actions.Watch.MyWatchesFilterChange);
local v12 = require(l_Parent_0.Src.Models.Watch.MyWatchesColumnEnum);
local v13 = require(l_Parent_0.Src.Util.flatListToString);
local v14 = v1.PureComponent:extend("MyWatchesDropdownField");
local _ = function(v15, v16)
    for _, v18 in pairs(v15) do
        if v18 == v16 then
            return true;
        end;
    end;
    return false;
end;
v14.init = function(v20)
    v20.keyColumns = {
        [1] = "AllColumns", 
        [2] = v12.Value, 
        [3] = v12.DataType
    };
    v20.clickCallback = function(v21)
        v20.props.onMyWatchesFilterChange(v21);
        v20.props.Analytics:report(v8.MyWatchesColumnsEdited, v13(v21));
    end;
end;
v14.render = function(v22)
    local l_props_0 = v22.props;
    return v1.createElement(v10, {
        KeyTexts = v22.keyColumns, 
        ClickCallback = v22.clickCallback, 
        KeyStates = l_props_0.ColumnStates, 
        Localization = l_props_0.Localization, 
        Style = l_props_0.Stylizer, 
        Widget = "Watch", 
        DropdownWidth = 200, 
        HamburgerMenu = true, 
        ShouldShowDropdownIcon = false, 
        LayoutOrder = l_props_0.LayoutOrder
    });
end;
return (v2.connect(function(v24, _)
    local l_listOfMyWatchesColumns_0 = v24.Watch.listOfMyWatchesColumns;
    local v27 = {};
    local l_Value_0 = v12.Value;
    local v29;
    for _, v31 in pairs(l_listOfMyWatchesColumns_0) do
        if v31 == l_Value_0 then
            v29 = true;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v29 = false;
    ::label0::;
    v27[2] = v29;
    l_Value_0 = v12.DataType;
    for _, v33 in pairs(l_listOfMyWatchesColumns_0) do
        if v33 == l_Value_0 then
            v29 = true;
            goto label1 --[[  true, false  ]];
        end;
    end;
    v29 = false;
    ::label1::;
    v27[3] = v29;
    return {
        ColumnStates = v27
    };
end, function(v34)
    return {
        onMyWatchesFilterChange = function(v35)
            return v34(v11(v35));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v14))));
