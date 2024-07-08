local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v7 = require(l_script_FirstAncestor_0.Src.Types);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
return function(v9)
    local v10 = l_Localization_0.use();
    local v11 = "";
    if v9.FilterType == v7.AssetInfoField.Owner then
        v11 = v9.Item;
    elseif v9.FilterType == v7.AssetInfoField.AssetType then
        v11 = v10:getText("AssetType", v9.Item);
    elseif v8() then
        warn("Creating item for unsupported filter type");
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v9.LayoutOrder, 
        OnClick = v9.Activated, 
        [v1.Tag] = "FilterItem Secondary"
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            Text = v11, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            [v1.Tag] = "X-Fill Left X-Pad"
        })
    });
end;
