local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v3.Util.AccessoryAndBodyToolShared;
local l_Constants_0 = l_AccessoryAndBodyToolShared_0.Constants;
local l_PreviewConstantsInterface_0 = l_AccessoryAndBodyToolShared_0.PreviewConstantsInterface;
local l_getActivePreviewTabs_0 = l_AccessoryAndBodyToolShared_0.getActivePreviewTabs;
local v8 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v8.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_UI_0 = v8.UI;
local l_Tabs_0 = l_UI_0.Tabs;
local l_Pane_0 = l_UI_0.Pane;
local l_Typecheck_0 = v8.Util.Typecheck;
local v16 = require(l_Parent_0.Src.Actions.SelectPreviewTab);
local v17 = v1.PureComponent:extend("PreviewTabsRibbon");
l_Typecheck_0.wrap(v17, script);
local function _(v18, v19)
    return l_getActivePreviewTabs_0(v19)[v18] ~= nil;
end;
v17.init = function(v21)
    v21.onClick = function(v22)
        local l_props_0 = v21.props;
        local l_Key_0 = v22.Key;
        local l_SelectedTab_0 = l_props_0.SelectedTab;
        local v26 = l_props_0.EditingItemContext:getItem();
        if (not l_Key_0 or l_Key_0 ~= l_SelectedTab_0) and l_getActivePreviewTabs_0(v26)[l_Key_0] ~= nil then
            v21.props.SelectPreviewTab(l_Key_0);
            return ;
        else
            return ;
        end;
    end;
end;
v17.render = function(v27)
    local l_props_1 = v27.props;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Localization_0 = l_props_1.Localization;
    local l_SelectedTab_1 = l_props_1.SelectedTab;
    local v32 = l_props_1.EditingItemContext:getItem();
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v34 = {};
    for v35, v36 in pairs((l_PreviewConstantsInterface_0.getTabs())) do
        v34[v36.LayoutOrder] = {
            Key = v35, 
            Label = l_Localization_0:getText(l_Constants_0.LOCALIZATION_KEYS.Preview, v36.LocalizationKey), 
            Disabled = not (l_getActivePreviewTabs_0(v32)[v35] ~= nil)
        };
    end;
    local v37 = nil;
    for _, v39 in ipairs(v34) do
        if v39.Key == l_SelectedTab_1 then
            v37 = v39;
        end;
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.TabHeight), 
        LayoutOrder = l_LayoutOrder_0
    }, {
        BottomLine = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.BorderSize), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor = l_Stylizer_0.BorderColor, 
            ZIndex = 0
        }), 
        Tabs = v1.createElement(l_Tabs_0, {
            Tabs = v34, 
            OnTabSelected = v27.onClick, 
            SelectedTab = v37
        })
    });
end;
return v2.connect(function(v40, _)
    return {
        SelectedTab = v40.previewStatus.selectedTab
    };
end, function(v42)
    return {
        SelectPreviewTab = function(v43)
            v42(v16(v43));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    EditingItemContext = l_EditingItemContext_0
})(v17)));
