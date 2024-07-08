local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = v2.ContextServices.Localization;
local v5 = require(l_script_FirstAncestor_0.Src.Components.GenerationCard);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedMeshParts);
local l_UI_0 = v2.UI;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Pane_0 = l_UI_0.Pane;
local v10 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v11 = require(l_script_FirstAncestor_0.Src.Util.createHashFromMeshParts);
local v12 = require(l_script_FirstAncestor_0.Src.Util.GenerationsContext);
local v13 = require(l_script_FirstAncestor_0.Src.Util.sort);
local function v26(v14, v15, v16)
    local l_generations_0 = v14.generations;
    local v18 = {};
    local v22 = v13(v1.keys(l_generations_0), function(v19)
        local v20 = l_generations_0[v19];
        local l_layoutOrder_0 = l_generations_0[v19].layoutOrder;
        if v20.status == v10.STATUS.PENDING then
            return 1;
        elseif v20.status == v10.STATUS.FAILED then
            return 2;
        else
            return l_layoutOrder_0;
        end;
    end);
    for v23, v24 in l_generations_0, nil, nil do
        if not (not (not (v24.status == v10.STATUS.COMPLETED) or not v15) and (not (not v14.modelToGenerations[v15] or table.find(v14.modelToGenerations[v15], v23)) or next(v16) ~= nil and not v14.modelToGenerations[v15])) then
            local v25 = table.find(v22, v23);
            assert(v25 ~= nil, "Can't find generation id in sorted list");
            v18[v23] = v3.createElement(v5, {
                Generation = v24, 
                LayoutOrder = v25
            });
        end;
    end;
    return v18;
end;
return function(v27)
    local v28 = l_Localization_0:use();
    local v29 = v6();
    local v30 = v11(v29);
    local v31 = v3.useContext(v12);
    local v32 = v26(v31, v30, v29);
    local v33 = if next(v29) == nil then v28:getText("Generations", "TitleAll") else v28:getText("Generations", "TitleSelected");
    v3.useEffect(function()
        if next(v29) == nil then
            v31.setSelected(nil);
        end;
    end, {
        v29, 
        v31.setSelected
    });
    return v3.createElement(l_ExpandablePane_0, {
        AlwaysExpanded = true, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = v27.LayoutOrder, 
        Style = "Section", 
        Text = v33, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        GenerationsPane = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = UDim.new(0, 4), 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, v32)
    });
end;
