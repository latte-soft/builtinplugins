local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_SplitPane_0 = l_UI_0.SplitPane;
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useColumns);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(script.Parent.styles);
local function v18(v12, v13, v14)
    local v15 = {};
    for v16, v17 in v12, nil, nil do
        v15[v16] = v1.createElement(l_Pane_0, {
            LayoutOrder = v16, 
            OnClick = function()
                v13:addSort(v17);
            end, 
            [v1.Tag] = "X-Row X-Left X-Middle X-PadS"
        }, {
            Text = v1.createElement(l_TextLabel_0, {
                Text = v14:getText("AssetProperty", v17), 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                [v1.Tag] = "X-Fit"
            })
        });
    end;
    return v15;
end;
return function(v19)
    local v20 = l_Localization_0.use();
    local v21 = v8.use();
    local v22, v23 = v9(v21);
    local v24 = v18(v22, v21, v20);
    local v25 = {};
    for v26, _ in v24, nil, nil do
        v25[v26] = v11:GetAttribute("ColumnMinSize");
    end;
    return v1.createElement(l_SplitPane_0, {
        LayoutOrder = v19.LayoutOrder, 
        UseScale = false, 
        ClampSize = false, 
        HideBars = true, 
        MinSizes = v25, 
        Sizes = v23, 
        OnSizesChange = function(v28)
            v21:setColumnWidths(v28);
        end, 
        [v1.Tag] = "HeaderRow Contrast X-Stroke"
    }, v24);
end;
