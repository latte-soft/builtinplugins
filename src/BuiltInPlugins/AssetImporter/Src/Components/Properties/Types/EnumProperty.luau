local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_filter_0 = v1.Dash.filter;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local v7 = require(l_script_FirstAncestor_0.Src.Utility.DependencyHandler);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextWrapAnimationSettings);
local function _(v9)
    local l_EnumItems_0 = v9.EnumType:GetEnumItems();
    for v11, v12 in ipairs(l_EnumItems_0) do
        l_EnumItems_0[v11] = v12.Name;
    end;
    return l_EnumItems_0;
end;
local function _(v14, v15)
    for v16, v17 in ipairs(v15) do
        if v17 == v14.Name then
            return v16;
        end;
    end;
    return nil;
end;
return function(v19)
    local l_EnumItems_1 = v19.Value.EnumType:GetEnumItems();
    for v21, v22 in ipairs(l_EnumItems_1) do
        l_EnumItems_1[v21] = v22.Name;
    end;
    local l_l_EnumItems_1_0 = l_EnumItems_1;
    local v24 = v7(v19.Name, v19.DependentValues, v19.AssetImportSession);
    l_l_EnumItems_1_0 = l_filter_0(l_l_EnumItems_1_0, function(v25)
        if not v24 or not v24[v25] then
            return true;
        else
            return false;
        end;
    end);
    l_EnumItems_1 = {};
    for v26, v27 in ipairs(l_l_EnumItems_1_0) do
        l_EnumItems_1[v26] = v19.Localization:getText("EnumItem", v27);
    end;
    local l_createElement_0 = v2.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v30 = {
        LayoutOrder = v19.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = v19.Size
    };
    local v31 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_SelectInput_0_0 = l_SelectInput_0;
    local v36 = {
        OnItemActivated = function(_, v35)
            v19.OnSelectItem(l_l_EnumItems_1_0[v35]);
        end, 
        Items = l_EnumItems_1
    };
    local l_Value_0 = v19.Value;
    local v38;
    for v39, v40 in ipairs(l_l_EnumItems_1_0) do
        if v40 == l_Value_0.Name then
            v38 = v39;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v38 = nil;
    ::label0::;
    v36.SelectedIndex = v38;
    v36.Focus = v19.Value.Name;
    v36.Size = UDim2.fromScale(1, 1);
    v36.TextWrapped = not not v8() or nil;
    v31.WrapperContents = l_createElement_1(l_l_SelectInput_0_0, v36);
    return l_createElement_0(l_l_Pane_0_0, v30, v31);
end;
