local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Separator_0 = v2.UI.Separator;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v7 = require(l_Parent_0.Src.Components.MainSwitchSection);
local v8 = require(l_Parent_0.Src.Components.CustomPolicySwitchSection);
local v9 = require(l_Parent_0.Src.Components.LanguageSection);
local v10 = require(l_Parent_0.Src.Components.PseudolocalizationSection);
local v11 = require(l_Parent_0.Src.Components.CountryRegionSection);
local v12 = require(l_Parent_0.Src.Components.PolicySection);
local l_EnablePseudolocalizationInPlayerEmulator_0 = game:GetFastFlag("EnablePseudolocalizationInPlayerEmulator");
local v14 = v1.PureComponent:extend("MainView");
v14.render = function(v15)
    local v16 = l_LayoutOrderIterator_0.new();
    local l_Stylizer_0 = v15.props.Stylizer;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
        Position = UDim2.new(0, 0, 0, 0)
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = l_Stylizer_0.MAINVIEW_PADDING_TOP, 
            PaddingLeft = l_Stylizer_0.MAINVIEW_PADDING_LEFT, 
            PaddingRight = l_Stylizer_0.MAINVIEW_PADDING_LEFT
        }), 
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = l_Stylizer_0.HORIZONTAL_LISTLAYOUT_PADDING
        }), 
        MainSwitchSection = v1.createElement(v7, {
            LayoutOrder = v16:getNextOrder()
        }), 
        Separator = v1.createElement(l_Separator_0, {
            LayoutOrder = v16:getNextOrder()
        }), 
        LanguageSection = v1.createElement(v9, {
            LayoutOrder = v16:getNextOrder()
        }), 
        PseudolocalizationSection = if not l_EnablePseudolocalizationInPlayerEmulator_0 then nil else v1.createElement(v10, {
            LayoutOrder = v16:getNextOrder()
        }), 
        CountryRegionSection = v1.createElement(v11, {
            LayoutOrder = v16:getNextOrder()
        }), 
        CustomPolicySwitchSection = v1.createElement(v8, {
            LayoutOrder = v16:getNextOrder()
        }), 
        PolicySection = v1.createElement(v12, {
            LayoutOrder = v16:getNextOrder()
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v14));
