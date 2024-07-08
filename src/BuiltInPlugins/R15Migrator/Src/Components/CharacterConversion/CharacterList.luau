local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.Src.Util.ItemState);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v7 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetCharacterSelection);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v10 = require(l_Components_0.SelectAllRow);
local v11 = require(l_Components_0.CharacterConversion.SplitView);
local v12 = require(l_Components_0.CharacterConversion.ExpandableCharacterListItem);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.CreateWorldModels);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local l_deepCopy_0 = v2.Util.deepCopy;
local v20 = v3.PureComponent:extend("CharacterConversionList");
v20.init = function(v21)
    v21.state = {
        expandedNestedItem = {
            [v5.InProgress] = true
        }, 
        expanded = nil
    };
    v21.onKeyPressed = function(v22)
        if not v6:isShift(v22.KeyCode) then
            if v6:isControl(v22.KeyCode) then
                v21._ctrlDown = true;
            end;
        else
            v21._shiftDown = true;
        end;
        if not ((not v21._shiftDown or not v21._ctrlDown) or not v6:isLetterA(v22.KeyCode)) then
            v21.selectAll();
        end;
    end;
    v21.onKeyReleased = function(v23)
        if not v6:isShift(v23.KeyCode) then
            if v6:isControl(v23.KeyCode) then
                v21._ctrlDown = false;
            end;
            return ;
        else
            v21._shiftDown = false;
            return ;
        end;
    end;
    v21.plainSelect = function(v24)
        v21.props.SetCharacterSelection({
            v24.key
        });
    end;
    v21.plainToggleSelect = function(v25)
        local v26 = l_deepCopy_0(v21.props.selection);
        local v27 = table.find(v26, v25.key);
        if not v27 then
            table.insert(v26, v25.key);
        else
            table.remove(v26, v27);
        end;
        v21.props.SetCharacterSelection(v26);
    end;
    v21.selectAll = function()
        local l_props_0 = v21.props;
        local l_Items_0 = l_props_0.Items;
        local v30 = {};
        local l_expandedNestedItem_0 = v21.state.expandedNestedItem;
        local v32 = {};
        for _, v34 in l_Items_0, nil, nil do
            if l_expandedNestedItem_0[v34.key] then
                for _, v36 in v34.children, nil, nil do
                    if not v32[v36.key] then
                        v32[v36.key] = true;
                        table.insert(v30, v36.key);
                    end;
                end;
            end;
        end;
        l_props_0.SetCharacterSelection(v30);
    end;
    v21.selectInRange = function(v37, v38, v39, v40, v41, v42)
        local v43 = {};
        for _, v45 in v38, nil, nil do
            v43[v45] = true;
        end;
        local v46 = v37[v39];
        local v47 = v37[v41];
        if v39 == v41 then
            for v48 = v40, v42 do
                local l_key_0 = v46.children[v48].key;
                if not v43[l_key_0] then
                    table.insert(v38, l_key_0);
                    v43[l_key_0] = true;
                end;
            end;
            return ;
        else
            for v50 = v40, #v46.children do
                local l_key_1 = v46.children[v50].key;
                if not v43[l_key_1] then
                    table.insert(v38, v46.children[v50].key);
                    v43[l_key_1] = true;
                end;
            end;
            for v52 = 1, v42 do
                local l_key_2 = v47.children[v52].key;
                if not v43[l_key_2] then
                    table.insert(v38, v47.children[v52].key);
                    v43[l_key_2] = true;
                end;
            end;
            return ;
        end;
    end;
    v21.areAllChildrenSelected = function(v54)
        local l_props_1 = v21.props;
        local v56 = {};
        for _, v58 in l_props_1.selection, nil, nil do
            v56[v58] = true;
        end;
        for _, v60 in v54.children, nil, nil do
            if not (v60.children or v56[v60.key]) then
                return false;
            end;
        end;
        return true;
    end;
    v21.toggleSelectAllChildren = function(v61)
        local l_props_2 = v21.props;
        local v63 = {};
        if v21.areAllChildrenSelected(v61) then
            local v64 = {};
            for _, v66 in l_props_2.selection, nil, nil do
                v64[v66] = true;
            end;
            for _, v68 in v61.children, nil, nil do
                v64[v68.key] = nil;
            end;
            for v69 in v64, nil, nil do
                table.insert(v63, v69);
            end;
        else
            v63 = l_deepCopy_0(l_props_2.selection);
            local v70 = {};
            for _, v72 in v63, nil, nil do
                v70[v72] = true;
            end;
            for _, v74 in v61.children, nil, nil do
                if not (v70[v74.key] or v74.children) then
                    v70[v74.key] = true;
                    table.insert(v63, v74.key);
                end;
            end;
        end;
        l_props_2.SetCharacterSelection(v63);
    end;
    v21.getSelectionRangeData = function(v75, v76, v77)
        local v78 = v76[#v76];
        local v79 = nil;
        local v80 = nil;
        local v81 = nil;
        local v82 = nil;
        for v83, v84 in v75, nil, nil do
            for v85, v86 in v84.children, nil, nil do
                if v78 == v86.key then
                    v79 = v83;
                    v80 = v85;
                end;
                if v77.key == v86.key then
                    v81 = v83;
                    v82 = v85;
                end;
            end;
        end;
        return v79, v80, v81, v82;
    end;
    v21.shiftSelect = function(v87)
        if not v87.children then
            local l_props_3 = v21.props;
            local l_Items_1 = l_props_3.Items;
            local v90 = l_deepCopy_0(l_props_3.selection);
            local v91, v92, v93, v94 = v21.getSelectionRangeData(l_Items_1, v90, v87);
            if not (v91 ~= nil) or v92 == nil then
                v21.plainSelect(v87);
                return ;
            else
                if v91 < v93 then
                    v21.selectInRange(l_Items_1, v90, v91, v92, v93, v94);
                elseif v93 < v91 then
                    v21.selectInRange(l_Items_1, v90, v93, v94, v91, v92);
                else
                    v21.selectInRange(l_Items_1, v90, v93, math.min(v94, v92), v93, (math.max(v94, v92)));
                end;
                v21.props.SetCharacterSelection(v90);
                return ;
            end;
        else
            return ;
        end;
    end;
    v21.isItemSelected = function(v95)
        for _, v97 in v21.props.selection, nil, nil do
            if v97 == v95.key then
                return true;
            end;
        end;
        return false;
    end;
end;
v20.getCharacterStatusKey = function(v98, v99)
    local l_convertedCharacters_0 = v98.props.convertedCharacters;
    if v99.characterInfo then
        local l_model_0 = v99.characterInfo.model;
        if l_model_0 then
            if not v7.GetNpcHasWarnings(l_model_0) then
                if not l_convertedCharacters_0[v99.characterInfo.key] then
                    return nil;
                else
                    return "Success";
                end;
            else
                return "Warning";
            end;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v20.renderItem = function(v102, v103, v104, v105)
    local l_props_4 = v102.props;
    local l_Stylizer_0 = l_props_4.Stylizer;
    local l_worldModels_0 = l_props_4.worldModels;
    v104[v103.key] = v3.createElement(v12, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Selected = v102.isItemSelected(v103), 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.RowHeight), 
        LayoutOrder = v105, 
        Text = v103.text, 
        Expanded = v102.state.expanded == v103.key and (l_worldModels_0[v103.key] and true or false), 
        StatusKey = v102:getCharacterStatusKey(v103), 
        RenderContent = function()
            return v3.createElement(v11, {
                previewModel = l_worldModels_0[v103.key].previewModel, 
                convertedModel = l_worldModels_0[v103.key].convertedModel
            });
        end, 
        OnExpandedChanged = function()
            coroutine.wrap(function()
                l_props_4.CreateWorldModels(v103.key, v103.characterInfo.model);
                v102:setState({
                    expanded = if v102.state.expanded == v103.key then v3.None else v103.key
                });
            end)();
        end, 
        OnClick = function()
            if not v102._shiftDown then
                v102.plainToggleSelect(v103);
                return ;
            else
                v102.shiftSelect(v103);
                return ;
            end;
        end
    });
end;
v20.renderNestedItem = function(v109, v110, v111, v112)
    local l_props_5 = v109.props;
    local l_Stylizer_1 = l_props_5.Stylizer;
    local v115 = {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_Stylizer_1.Spacing)
        })
    };
    local v116 = 0;
    for _, v118 in v110.children, nil, nil do
        if not v118.children then
            if not v115.SelectAllRow then
                v115.SelectAllRow = v3.createElement(v10, {
                    IsChecked = v109.areAllChildrenSelected(v110), 
                    OnCheckboxClick = function()
                        v109.toggleSelectAllChildren(v110);
                    end, 
                    OnResetPlugin = l_props_5.OnResetPlugin
                });
            end;
            v109:renderItem(v118, v115, v116);
        else
            v109:renderNestedItem(v118, v115, v116);
        end;
        v116 = v116 + 1;
    end;
    v111[v110.key] = v3.createElement(l_ExpandablePane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Style = "Section", 
        ContentPadding = 0, 
        ContentSpacing = 0, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_1.RowHeight), 
        LayoutOrder = v112, 
        Text = v110.text, 
        Expanded = v109.state.expandedNestedItem[v110.key] or false, 
        OnExpandedChanged = function()
            v109:setState({
                expandedNestedItem = v1.Dictionary.join(v109.state.expandedNestedItem, {
                    [v110.key] = not (v109.state.expandedNestedItem[v110.key] or false)
                })
            });
        end
    }, v115);
end;
v20.render = function(v119)
    local l_props_6 = v119.props;
    local l_Size_0 = l_props_6.Size;
    local l_LayoutOrder_0 = l_props_6.LayoutOrder;
    local l_Items_2 = l_props_6.Items;
    local v124 = {};
    local v125 = 0;
    for _, v127 in l_Items_2, nil, nil do
        if not v127.children then
            v119:renderItem(v127, v124, v125);
        else
            v119:renderNestedItem(v127, v124, v125);
        end;
        v125 = v125 + 1;
    end;
    return v3.createFragment({
        ScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
            Layout = Enum.FillDirection.Vertical, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            LayoutOrder = l_LayoutOrder_0, 
            Size = l_Size_0
        }, v124), 
        KeyboardListener = v3.createElement(l_KeyboardListener_0, {
            OnKeyPressed = v119.onKeyPressed, 
            OnKeyReleased = v119.onKeyReleased
        })
    });
end;
return v4.connect(function(v128, _)
    return {
        selection = v128.CharacterConversion.selection, 
        convertedCharacters = v128.CharacterConversion.convertedCharacters, 
        worldModels = v128.CharacterConversion.worldModels
    };
end, function(v130)
    return {
        SetCharacterSelection = function(v131)
            v130(v8(v131));
        end, 
        CreateWorldModels = function(v132, v133)
            v130(v13(v132, v133));
        end
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v20)));
