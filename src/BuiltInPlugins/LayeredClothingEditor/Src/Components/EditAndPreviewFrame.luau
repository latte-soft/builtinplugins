local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_FlowScreenLayout_0 = require(l_Parent_0.Packages.AvatarToolsShared).Components.FlowScreenLayout;
local v7 = v1.PureComponent:extend("EditAndPreviewFrame");
v3.Util.Typecheck.wrap(v7, script);
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_InBounds_0 = l_props_0.InBounds;
    local l_PromptText_0 = l_props_0.PromptText;
    local l_GoToNext_0 = l_props_0.GoToNext;
    local l_GoToPrevious_0 = l_props_0.GoToPrevious;
    local l_Localization_0 = l_props_0.Localization;
    return v1.createElement(l_FlowScreenLayout_0, {
        Title = l_Localization_0:getText("Editor", "EditAndPreview"), 
        PromptText = l_PromptText_0, 
        NextButtonText = l_Localization_0:getText("Flow", "Next"), 
        BackButtonText = l_Localization_0:getText("Flow", "Back"), 
        NextButtonEnabled = l_InBounds_0, 
        BackButtonEnabled = true, 
        HasBackButton = true, 
        GoToNext = l_GoToNext_0, 
        GoToPrevious = l_GoToPrevious_0
    });
end;
return v2.connect(function(v15, _)
    return {
        InBounds = v15.selectItem.inBounds
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v7)));
