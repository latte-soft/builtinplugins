local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Parent_1 = script.Parent;
local v6 = require(l_Parent_1.LabeledToggle);
local v7 = require(l_Parent_1.Panel);
local v8 = v2.PureComponent:extend(script.Name);
v8.render = function(v9)
    local l_Localization_0 = v9.props.Localization;
    return v2.createElement(v7, {
        Title = l_Localization_0:getText("EditSettings", "EditSettings"), 
        Padding = UDim.new(0, 12), 
        LayoutOrder = v9.props.LayoutOrder
    }, {
        MergeEmptyToggle = v2.createElement(v6, {
            LayoutOrder = 1, 
            Text = l_Localization_0:getText("EditSettings", "MergeEmpty"), 
            IsOn = v9.props.mergeEmpty, 
            SetIsOn = v9.props.setMergeEmpty
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v8));
