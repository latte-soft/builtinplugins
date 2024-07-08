local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Components.ProgressDialog);
local v6 = require(l_Parent_0.Src.Components.SuggestionDialog);
local v7 = require(l_Parent_0.Src.Util.SmoothVoxelsController);
local v8 = v2.PureComponent:extend("SmoothVoxelsDialog");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_SmoothVoxelsController_0 = l_props_0.SmoothVoxelsController;
    local l_SmoothVoxelsUpgradePercent_0 = l_props_0.SmoothVoxelsUpgradePercent;
    local l_SmoothVoxelsUpgradeSuggestion_0 = l_props_0.SmoothVoxelsUpgradeSuggestion;
    local v15 = false;
    if l_SmoothVoxelsUpgradePercent_0 >= 0 then
        v15 = l_SmoothVoxelsUpgradePercent_0 < 1;
    end;
    return v2.createFragment({
        SmoothVoxelsUpdater = if not l_SmoothVoxelsUpgradeSuggestion_0 then nil else v2.createElement(v6, {
            Title = l_Localization_0:getText("UpgradeSmoothVoxels", "SuggestionTitle"), 
            SubText = l_Localization_0:getText("UpgradeSmoothVoxels", "SuggestionDescription"), 
            ActionText = l_Localization_0:getText("UpgradeSmoothVoxels", "ActionButton"), 
            OnActionButtonClicked = function()
                l_SmoothVoxelsController_0:start("Suggestion");
            end, 
            OnDismissButtonClicked = function(v16)
                l_SmoothVoxelsController_0:dismiss(v16);
            end
        }), 
        ProgressDialog = if not v15 then nil else v2.createElement(v5, {
            Title = l_Localization_0:getText("UpgradeSmoothVoxels", "Title"), 
            SubText = l_Localization_0:getText("Replace", "Replacing"), 
            Progress = l_SmoothVoxelsUpgradePercent_0, 
            OnCancelButtonClicked = function()
                l_SmoothVoxelsController_0:cancel();
            end
        })
    });
end;
return v1.connect(function(v17)
    return {
        SmoothVoxelsUpgradePercent = v17.Tools.SmoothVoxelsUpgradePercent, 
        SmoothVoxelsUpgradeSuggestion = v17.Tools.SmoothVoxelsUpgradeSuggestion
    };
end, function()
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    SmoothVoxelsController = v7
})(v8)));
