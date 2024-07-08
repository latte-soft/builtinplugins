local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local v10 = require(l_Parent_0.Src.TagManager);
local l_UI_0 = v4.UI;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v17 = v2.PureComponent:extend("TagListUnknownRow");
v17.init = function(v18)
    v18.onRegister = function()
        local l_props_0 = v18.props;
        local v20 = false;
        if l_props_0.assigningGroup ~= nil then
            v20 = l_props_0.assigningGroup ~= "";
        end;
        v10.Get():AddTag(l_props_0.TagName);
        if v20 then
            v10.Get():SetGroup(l_props_0.TagName, l_props_0.assigningGroup);
        end;
    end;
end;
v17.render = function(v21)
    local l_props_1 = v21.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_TagListUnknownRow_0 = l_props_1.Stylizer.TagListUnknownRow;
    local v25 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_props_1.LayoutOrder, 
        Size = l_TagListUnknownRow_0.Size, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = l_TagListUnknownRow_0.Spacing, 
        Padding = l_TagListUnknownRow_0.PaddingIndented
    }, {
        CheckboxPane = v2.createElement(l_Pane_0, {
            LayoutOrder = v25:getNextOrder(), 
            Size = l_TagListUnknownRow_0.CheckboxSize
        }, {
            RegisterGroupButton = v2.createElement(l_IconButton_0, {
                BackgroundStyle = "None", 
                LeftIcon = l_TagListUnknownRow_0.AssignIcon, 
                OnClick = v21.onRegister, 
                IconColor = l_TagListUnknownRow_0.AssignIconColor, 
                TooltipText = l_Localization_1:getText("Tooltip", "RegisterTag")
            }), 
            HoverArea = v2.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        }), 
        NameText = v2.createElement(l_TextLabel_0, {
            LayoutOrder = v25:getNextOrder(), 
            Text = l_props_1.TagName, 
            Size = l_TagListUnknownRow_0.TextSize, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
return v3.connect(function(v26, _)
    return {
        assigningGroup = v26.AssigningGroup
    };
end, function(_)
    return {};
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v17)));
