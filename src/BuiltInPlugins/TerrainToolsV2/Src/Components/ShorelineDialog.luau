local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Components.ProgressDialog);
local v6 = require(l_Parent_0.Src.Components.SuggestionDialog);
local v7 = require(l_Parent_0.Src.Util.ShorelineController);
local l_ShorelinesRemoveDialog_0 = game:GetFastFlag("ShorelinesRemoveDialog");
local v9 = v2.PureComponent:extend("ShorelineDialog");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_ShorelineController_0 = l_props_0.ShorelineController;
    local l_ShorelinesUpgradePercent_0 = l_props_0.ShorelinesUpgradePercent;
    local l_ShorelinesUpgradeSuggestion_0 = l_props_0.ShorelinesUpgradeSuggestion;
    local v16 = false;
    if l_ShorelinesUpgradePercent_0 >= 0 then
        v16 = l_ShorelinesUpgradePercent_0 < 1;
    end;
    return v2.createFragment({
        ShoresUpdater = if not l_ShorelinesRemoveDialog_0 and l_ShorelinesUpgradeSuggestion_0 then v2.createElement(v6, {
            Title = l_Localization_0:getText("UpgradeShorelines", "SuggestionTitle"), 
            SubText = l_Localization_0:getText("UpgradeShorelines", "SuggestionDescription"), 
            ActionText = l_Localization_0:getText("UpgradeShorelines", "ActionButton"), 
            OnActionButtonClicked = function()
                l_ShorelineController_0:start("Suggestion");
            end, 
            OnDismissButtonClicked = function(v17)
                l_ShorelineController_0:dismiss(v17);
            end
        }) else nil, 
        ProgressDialog = if not v16 then nil else v2.createElement(v5, {
            Title = l_Localization_0:getText("UpgradeShorelines", "Title"), 
            SubText = l_Localization_0:getText("Replace", "Replacing"), 
            Progress = l_ShorelinesUpgradePercent_0, 
            OnCancelButtonClicked = function()
                l_ShorelineController_0:cancel();
            end
        })
    });
end;
return v1.connect(function(v18)
    return {
        ShorelinesUpgradePercent = v18.Tools.ShorelinesUpgradePercent, 
        ShorelinesUpgradeSuggestion = v18.Tools.ShorelinesUpgradeSuggestion
    };
end, function()
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    ShorelineController = v7
})(v9)));
