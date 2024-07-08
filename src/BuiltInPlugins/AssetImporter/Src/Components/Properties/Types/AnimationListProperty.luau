local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local v6 = require(l_script_FirstAncestor_0.Src.Utility.getAnimations);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextWrapAnimationSettings);
local function v13(v8, v9, v10)
    for v11, v12 in v10, nil, nil do
        if tostring(v8) == v12 then
            return table.find(v9, v11);
        end;
    end;
    return 1;
end;
return function(v14)
    local v15 = v6(v14.Instance);
    local v16 = {};
    local v17 = {};
    for _, v19 in pairs(v15) do
        v16[v19.ImportName] = v19.Id;
        table.insert(v17, v19.ImportName);
    end;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = v14.LayoutOrder, 
        Size = v14.Size
    }, {
        WrapperContents = v2.createElement(l_SelectInput_0, {
            OnItemActivated = function(_, v21)
                v14.OnSetItem(v16[v17[v21]]);
            end, 
            Items = v17, 
            SelectedIndex = v13(v14.Value, v17, v16), 
            Focus = v14.Value, 
            TextWrapped = not not v7() or nil, 
            Size = UDim2.fromScale(1, 1)
        })
    });
end;
