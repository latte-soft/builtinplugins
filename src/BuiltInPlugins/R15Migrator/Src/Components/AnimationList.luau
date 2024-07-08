local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_List_0 = l_UI_0.List;
local l_Pane_0 = l_UI_0.Pane;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local l_deepCopy_0 = v1.Util.deepCopy;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v11 = require(l_Components_0.AnimationListRow);
local v12 = require(l_Components_0.SelectAllRow);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetSelection);
local v14 = require(l_script_FirstAncestor_0.Src.Actions.SetPreviewSelection);
local v15 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v16 = v2.PureComponent:extend("AnimationList");
v16.init = function(v17)
    v17.areAllSelected = function()
        local l_props_0 = v17.props;
        local l_Items_0 = l_props_0.Items;
        local l_selection_0 = l_props_0.selection;
        for v21 in l_Items_0, nil, nil do
            if not l_selection_0[v21] then
                return false;
            end;
        end;
        return true;
    end;
    v17.onAllSelectedChecked = function()
        if not v17:areAllSelected() then
            v17:selectAll();
            return ;
        else
            v17:resetSelected();
            return ;
        end;
    end;
    v17.getRowProps = function(v22, v23, v24, v25)
        return {
            Key = v23, 
            Position = v24, 
            Row = v22, 
            Size = v25
        };
    end;
    v17._selection = {};
    v17._ctrlDown = false;
    v17._shiftDown = false;
    v17._anchor = nil;
    v17._focus = nil;
    v17.onKeyPressed = function(v26)
        if not v15:isShift(v26.KeyCode) then
            if v15:isControl(v26.KeyCode) then
                v17._ctrlDown = true;
            end;
        else
            v17._shiftDown = true;
        end;
        if not ((not v17._ctrlDown or not v17._shiftDown) or not v15:isLetterA(v26.KeyCode)) then
            v17:selectAll();
        end;
    end;
    v17.onKeyReleased = function(v27)
        if not v15:isShift(v27.KeyCode) then
            if v15:isControl(v27.KeyCode) then
                v17._ctrlDown = false;
            end;
            return ;
        else
            v17._shiftDown = false;
            return ;
        end;
    end;
end;
v16.selectAll = function(v28)
    local l_props_1 = v28.props;
    local l_Items_1 = l_props_1.Items;
    local v31 = l_deepCopy_0(l_props_1.selection);
    for v32, _ in l_Items_1, nil, nil do
        v31[v32] = true;
    end;
    l_props_1.setSelection(v31);
    v28._focus = nil;
    v28._anchor = nil;
end;
v16.resetSelected = function(v34)
    v34.props.setSelection({});
    v34._anchor = nil;
    v34._focus = nil;
end;
v16.shiftClick = function(v35, _, v37, v38, _, v40, v41)
    local l_props_2 = v35.props;
    local v43 = l_deepCopy_0(l_props_2.selection);
    if v35._anchor then
        if v35._focus then
            local v44 = v35._anchor < v35._focus and 1 or -1;
            for v45 = v35._anchor, v35._focus, v44 do
                v43[v41[v40[v45]]] = nil;
            end;
        end;
        local v46 = v35._anchor < v38 and 1 or -1;
        for v47 = v35._anchor, v38, v46 do
            v43[v41[v40[v47]]] = true;
        end;
        v35._focus = v38;
        l_props_2.setSelection(v43);
        return ;
    else
        v35._anchor = v38;
        l_props_2.setSelection({
            [v37] = true
        });
        return ;
    end;
end;
v16.click = function(v48, _, v50, v51)
    local l_props_3 = v48.props;
    local l_selection_1 = l_props_3.selection;
    local v54 = l_deepCopy_0(l_selection_1);
    if not l_selection_1[v50] then
        v54[v50] = true;
    else
        v54[v50] = nil;
    end;
    l_props_3.setSelection(v54);
    v48._anchor = v51;
    v48._focus = nil;
end;
v16.rowClick = function(v55, v56)
    v55.props.setPreviewSelection(v56);
end;
v16.render = function(v57)
    local l_props_4 = v57.props;
    local l_Items_2 = l_props_4.Items;
    local l_Tags_0 = l_props_4.Tags;
    local l_Size_0 = l_props_4.Size;
    local l_selection_2 = l_props_4.selection;
    local l_previewSelection_0 = l_props_4.previewSelection;
    local l_Stylizer_0 = l_props_4.Stylizer;
    local l_SelectAllRow_0 = l_Stylizer_0.SelectAllRow;
    local l_LayoutOrder_0 = l_props_4.LayoutOrder;
    local v67 = {};
    local v68 = {};
    for _, v70 in l_Items_2, nil, nil do
        table.insert(v68, v70.index);
    end;
    table.sort(v68);
    local v71 = {};
    for v72, v73 in l_Items_2, nil, nil do
        v71[v73.index] = v72;
    end;
    for v74, v75 in ipairs(v68) do
        local v76 = v71[v75];
        local v77 = l_Items_2[v76];
        table.insert(v67, {
            name = v77.name, 
            tag = l_Tags_0[v76], 
            selected = l_selection_2[v76] ~= nil, 
            previewSelected = v76 == l_previewSelection_0, 
            OnCheckboxClick = function()
                if not v57._shiftDown then
                    v57:click(v77, v76, v74);
                    return ;
                else
                    v57:shiftClick(v77, v76, v74, l_Items_2, v68, v71);
                    return ;
                end;
            end, 
            OnRowClick = function()
                v57:rowClick(if v76 == l_previewSelection_0 then nil else v76);
            end, 
            index = v77.index, 
            status = v77.status, 
            errCode = v77.errCode
        });
    end;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Vertical, 
        Size = l_Size_0
    }, {
        SelectAllRow = v2.createElement(v12, {
            IsChecked = v57:areAllSelected(), 
            OnCheckboxClick = v57.onAllSelectedChecked, 
            RowHeight = l_SelectAllRow_0.RowHeight, 
            Padding = l_SelectAllRow_0.Padding, 
            OnResetPlugin = l_props_4.OnResetPlugin
        }), 
        ListContianer = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, -l_SelectAllRow_0.RowHeight), 
            Padding = l_Stylizer_0.Padding
        }, {
            List = v2.createElement(l_List_0, {
                Rows = v67, 
                GetRowProps = v57.getRowProps, 
                RowComponent = v11
            })
        }), 
        KeyboardListener = v2.createElement(l_KeyboardListener_0, {
            OnKeyPressed = v57.onKeyPressed, 
            OnKeyReleased = v57.onKeyReleased
        })
    });
end;
return v3.connect(function(v78)
    return {
        selection = v78.AnimationConversion.selection, 
        previewSelection = v78.AnimationConversion.previewSelection
    };
end, function(v79)
    return {
        setSelection = function(v80)
            v79(v13(v80));
        end, 
        setPreviewSelection = function(v81)
            v79(v14(v81));
        end
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v16)));
