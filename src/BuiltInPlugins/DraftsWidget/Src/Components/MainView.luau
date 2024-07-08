local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Components.DraftListView);
local v7 = require(l_Parent_0.Src.Components.FeatureDisabledPage);
local l_LoadingIndicator_0 = v3.UI.LoadingIndicator;
local v9 = v1.Component:extend("MainView");
v9.render = function(v10)
    local l_Stylizer_0 = v10.props.Stylizer;
    local l_DraftsServiceEnabled_0 = v10.props.DraftsServiceEnabled;
    local l_DraftsServiceError_0 = v10.props.DraftsServiceError;
    local v14 = l_DraftsServiceEnabled_0 == nil;
    local _ = nil;
    return v1.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        Size = UDim2.new(1, 0, 1, 0)
    }, if not v14 then if l_DraftsServiceEnabled_0 then {
        ScriptList = v1.createElement(v6)
    } else {
        FeatureDisabledPage = v1.createElement(v7, {
            Text = l_DraftsServiceError_0
        })
    } else {
        LoadingIndicator = v1.createElement(l_LoadingIndicator_0, {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        })
    });
end;
return v2.connect(function(v16, _)
    local l_DraftsServiceStatus_0 = v16.DraftsServiceStatus;
    return {
        DraftsServiceEnabled = l_DraftsServiceStatus_0.Enabled, 
        DraftsServiceError = l_DraftsServiceStatus_0.Error
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9)));
