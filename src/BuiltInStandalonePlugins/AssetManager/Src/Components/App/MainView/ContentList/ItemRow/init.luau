local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v7 = require(script.AssetThumbnail);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v9 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v10 = require(l_script_FirstAncestor_0.Src.Networking);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useColumns);
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useItems);
local v13 = require(l_script_FirstAncestor_0.Src.Hooks.useItemSelection);
local l_useState_0 = v1.useState;
local v15 = require(l_script_FirstAncestor_0.Src.Util.renderContextMenu);
local v16 = require(l_script_FirstAncestor_0.Src.Types);
local l_DoubleClickDetector_0 = v2.Util.DoubleClickDetector;
local v18 = require(script.styles);
local function v23(v19, v20, v21)
    local v22 = v19[v20];
    if v20 == v16.AssetInfoField.Owner then
        if v22.Name ~= "" then
            return v22.Name;
        else
            return v22.Id;
        end;
    elseif not (v20 ~= v16.AssetInfoField.Modified) or v20 == v16.AssetInfoField.Created then
        return v19.Modified:FormatLocalTime("lll", "en-us");
    elseif v20 == v16.AssetInfoField.AssetType then
        return v21:getText("AssetType", v22);
    else
        return (tostring(v22));
    end;
end;
local function v36(v24, v25, _, v27)
    local v28 = {};
    table.insert(v28, (v1.createElement(v7, {
        LayoutOrder = 1, 
        AssetInfo = v24
    })));
    local v29, v30 = v11(v25);
    for v31, v32 in v29, nil, nil do
        local l_Offset_0 = v30[v31].Offset;
        if v31 == 1 then
            l_Offset_0 = l_Offset_0 - v18:GetAttribute("ThumbnailSize");
        end;
        local v34 = v23(v24, v32, v27);
        local v35 = v31 + 1;
        v28[v35] = v1.createElement(l_TextLabel_0, {
            LayoutOrder = v35, 
            Text = v34, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = UDim2.new(0, l_Offset_0, 1, 0), 
            [v1.Tag] = "Left X-Pad"
        });
    end;
    return v28;
end;
return function(v37)
    local v38 = l_useState_0(l_DoubleClickDetector_0.new());
    local v39 = l_Localization_0.use();
    local v40 = v9.use();
    local v41 = v8.use();
    local v42 = v10:use();
    local l_AssetInfo_0 = v37.AssetInfo;
    local v44 = v13(v41);
    local v45 = v12(v41);
    local v46 = v37.Key % 2 == 0 and "ContrastRow" or "";
    if v44[l_AssetInfo_0.AssetId] then
        v46 = "SelectedRow";
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v37.Key, 
        Position = v37.Position, 
        OnClick = function()
            v41:handleClick(l_AssetInfo_0.AssetId, v45, v37.Key, v38:isDoubleClick());
        end, 
        OnRightClick = function()
            v15(l_AssetInfo_0.AssetId, v39, v40:getPlugin());
        end, 
        [v1.Tag] = ("ItemRow X-FitX X-Row X-Left X-Middle %*"):format(v46)
    }, {
        (v36(l_AssetInfo_0, v41, v42, v39))
    });
end;
