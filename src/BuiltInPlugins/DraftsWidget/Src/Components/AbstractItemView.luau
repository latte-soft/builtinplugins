local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_showContextMenu_0 = v3.UI.showContextMenu;
local v7 = v1.PureComponent:extend("AbstractItemView");
v7.init = function(v8)
    v8:setState({
        selection = {}, 
        selectionAnchorTop = nil, 
        selectionAnchorBottom = nil
    });
    v8.lastItemClicked = nil;
    v8.lastClickTime = 0;
    v8.getPressedModifiers = function(v9)
        return {
            Toggle = v9:IsModifierKeyDown(Enum.ModifierKey.Ctrl), 
            Expand = v9:IsModifierKeyDown(Enum.ModifierKey.Shift)
        };
    end;
    v8.itemRightClicked = function(v10)
        if v8.props.MakeMenuActions then
            if not v8.state.selection[v10] then
                v8.setSelection(v10);
            end;
            local v11 = v8.props.Plugin:get();
            local v12 = v8.makeMenuActions();
            task.spawn(function()
                l_showContextMenu_0(v11, v12);
            end);
            return ;
        else
            return ;
        end;
    end;
    v8.itemClicked = function(v13, v14)
        local v15 = v8.getPressedModifiers(v14);
        if not v15.Expand then
            if not v15.Toggle then
                v8.setSelection(v13);
            else
                v8.toggleSelected(v13);
            end;
        else
            v8.expandSelection(v13);
        end;
        if v8.lastItemClicked == v13 then
            if tick() - v8.lastClickTime < 0.5 then
                v8.itemDoubleClicked(v13);
                v8.lastItemClicked = nil;
            end;
        else
            v8.lastItemClicked = v13;
        end;
        v8.lastClickTime = tick();
    end;
    v8.itemDoubleClicked = function(v16)
        if v8.props.OnDoubleClicked then
            v8.props.OnDoubleClicked(v16);
        end;
    end;
    v8.selectionChanged = function(v17)
        if v8.props.OnSelectionChanged then
            v8.props.OnSelectionChanged(v17);
        end;
    end;
    v8.setSelection = function(v18)
        v8:setState({
            selection = {
                [v18] = true
            }, 
            selectionAnchorTop = v18, 
            selectionAnchorBottom = v18
        });
        v8.selectionChanged(v8.state.selection);
    end;
    v8.toggleSelected = function(v19)
        local l_Items_0 = v8.props.Items;
        local v21 = v2.Dictionary.join(v8.state.selection, {
            [v19] = (not not not (v8.state.selection[v19] ~= nil) or v2.None) or true
        });
        local v22 = nil;
        local v23 = nil;
        for _, v25 in ipairs(l_Items_0) do
            if v21[v25] then
                v22 = v22 or v25;
                v23 = v25;
            end;
        end;
        v8:setState({
            selection = v21, 
            selectionAnchorTop = v22, 
            selectionAnchorBottom = v23
        });
        v8.selectionChanged(v8.state.selection);
    end;
    v8.expandSelection = function(v26)
        local l_Items_1 = v8.props.Items;
        local v28 = nil;
        local v29 = nil;
        local v30 = nil;
        for v31, v32 in ipairs(l_Items_1) do
            if v32 == v8.state.selectionAnchorTop then
                v28 = v31;
            end;
            if v32 == v8.state.selectionAnchorBottom then
                v29 = v31;
            end;
            if v32 == v26 then
                v30 = v31;
            end;
        end;
        v28 = v28 or v30;
        v29 = v29 or v30;
        local v33 = {};
        for v34 = math.min(v28, v30), math.max(v29, v30) do
            v33[l_Items_1[v34]] = true;
        end;
        v8:setState({
            selection = v33
        });
        v8.selectionChanged(v8.state.selection);
    end;
    v8.makeMenuActions = function()
        local l_Items_2 = v8.props.Items;
        local l_MakeMenuActions_0 = v8.props.MakeMenuActions;
        local v37 = {};
        for _, v39 in ipairs(l_Items_2) do
            if v8.state.selection[v39] then
                table.insert(v37, v39);
            end;
        end;
        return l_MakeMenuActions_0(v37);
    end;
    v8.getSelectedIds = function()
        local v40 = {};
        for _, v42 in ipairs(v8.props.Items) do
            if v8.state.selection[v42] then
                table.insert(v40, v42);
            end;
        end;
        return v40;
    end;
    if v8.props.GetCurrentSelection then
        v8.props.GetCurrentSelection.OnInvoke = v8.getSelectedIds;
    end;
end;
v7.didUpdate = function(v43, v44, _)
    if v44.GetCurrentSelection ~= v43.props.GetCurrentSelection then
        if v44.GetCurrentSelection then
            v44.GetCurrentSelection.OnInvoke = nil;
        end;
        if v43.props.GetCurrentSelection then
            v43.props.GetCurrentSelection.OnInvoke = v43.getSelectedIds;
        end;
    end;
end;
v7.render = function(v46)
    local l_Items_3 = v46.props.Items;
    local l_RenderItem_0 = v46.props.RenderItem;
    local l_RenderContents_0 = v46.props.RenderContents;
    local v50 = {};
    local v51 = {};
    for v52, v53 in ipairs(l_Items_3) do
        local v54 = v46.state.selection[v53] == true;
        v50[v53] = true;
        v51[v53] = {
            Button = l_RenderItem_0(v53, {
                Selected = v54, 
                OnPress = function(_, _, v57)
                    v46.itemClicked(v53, v57);
                end, 
                OnSecondaryPress = function()
                    v46.itemRightClicked(v53);
                end
            }), 
            Index = v52
        };
    end;
    local v58 = false;
    for v59, _ in pairs(v46.state.selection) do
        if not v50[v59] then
            v46.state.selection[v59] = nil;
            v58 = true;
        end;
    end;
    if v58 then
        v46.selectionChanged(v46.state.selection);
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Contents = l_RenderContents_0(v51)
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin
})(v7));
