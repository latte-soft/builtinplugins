local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_append_0 = v3.append;
local l_copy_0 = v3.copy;
local l_join_0 = v3.join;
local l_keys_0 = v3.keys;
local l_Signal_0 = v1.Util.Signal;
local v9 = require(l_script_FirstAncestor_0.Src.Util.getAssetInfosSlice);
local v10 = require(l_script_FirstAncestor_0.Src.Util.insertItems);
local v11 = require(l_script_FirstAncestor_0.Src.Types);
local l_AssetInfoField_0 = v11.AssetInfoField;
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
local v14 = UDim.new(0, 150);
local v15 = l_ContextItem_0:extend("ItemsController");
v15.new = function(v16, v17, v18)
    local v19 = {
        _isMock = v18, 
        _pluginController = v16, 
        _networking = v17, 
        _visibleProperties = {
            l_AssetInfoField_0.DisplayName, 
            l_AssetInfoField_0.AssetId, 
            l_AssetInfoField_0.AssetType, 
            l_AssetInfoField_0.Created, 
            l_AssetInfoField_0.Owner
        }, 
        _layout = {
            GridSize = 100, 
            ViewType = v11.ViewType.List
        }, 
        _columnWidths = {}, 
        _items = {}, 
        _owners = {}, 
        _filters = {}, 
        _sorts = {}, 
        _selection = {}, 
        _prevClickIndex = 1, 
        _usingShift = false, 
        _usingCtrl = false, 
        OnLayoutChanged = l_Signal_0.new(), 
        OnVisiblePropertiesChanged = l_Signal_0.new(), 
        OnColumnWidthsChanged = l_Signal_0.new(), 
        OnItemsChanged = l_Signal_0.new(), 
        OnItemSelectionChanged = l_Signal_0.new()
    };
    v19._inputConnection = v19._pluginController.OnInputChanged:Connect(function(v20)
        v19._usingShift = v20[Enum.KeyCode.LeftShift] or v20[Enum.KeyCode.RightShift];
        v19._usingCtrl = ((v20[Enum.KeyCode.LeftControl] or v20[Enum.KeyCode.RightControl]) or v20[Enum.KeyCode.LeftMeta]) or v20[Enum.KeyCode.RightMeta];
    end);
    for v21, _ in v19._visibleProperties, nil, nil do
        v19._columnWidths[v21] = v14;
    end;
    v19._fetchAssetsCallback = function(v23, v24)
        l_append_0(v19._items, v23);
        v19._owners = l_join_0(v19._owners, v24);
        v19.OnItemsChanged:Fire(v19._items);
    end;
    v19._fetchAssetsErrorCallback = function(v25, v26)
        if v13() then
            warn("Error fetching assets: " .. v25);
            if v26 then
                warn((("Status code: %*"):format(v26)));
            end;
        end;
    end;
    v19._networking:fetchAssetsLegacyAsync({
        Id = v19._pluginController:getUser().Id, 
        Scope = v19._pluginController:getUser().Scope
    }, v19._fetchAssetsCallback, v19._fetchAssetsErrorCallback);
    v19._explorerSelectionConnection = v19._pluginController.OnSelectionChanged:Connect(function(v27)
        v19._items = {};
        v19._owners = {};
        v19._networking:fetchAssetsLegacyAsync({
            Id = v27.Id, 
            Scope = v27.Scope
        }, v19._fetchAssetsCallback, v19._fetchAssetsErrorCallback);
    end);
    setmetatable(v19, v15);
    return v19;
end;
v15.mock = function(v28, v29)
    return v15.new(v28, v29, true);
end;
v15.destroy = function(v30)
    v30._explorerSelectionConnection:Disconnect();
    v30._explorerSelectionConnection = nil;
    v30._inputConnection:Disconnect();
    v30._inputConnection = nil;
    v30._visibleProperties = nil;
    v30._columnWidths = nil;
    v30._items = nil;
    v30._owners = nil;
    v30._filters = nil;
    v30._sorts = nil;
    v30._selection = nil;
end;
v15.getLayout = function(v31)
    return v31._layout;
end;
v15.setLayout = function(v32, v33)
    v32._layout = v33;
    v32.OnLayoutChanged:Fire(v32._layout);
end;
v15.getColumnWidths = function(v34)
    return v34._columnWidths;
end;
v15.setColumnWidths = function(v35, v36)
    v35._columnWidths = v36;
    v35.OnColumnWidthsChanged:Fire(v35._columnWidths);
end;
v15.getVisibleProperties = function(v37)
    return v37._visibleProperties;
end;
v15.setVisibleProperties = function(v38, v39)
    v38._visibleProperties = v39;
    v38.OnVisiblePropertiesChanged:Fire(v38._visibleProperties);
end;
v15.getItems = function(v40)
    return v40._items;
end;
v15.getOwners = function(v41)
    local v42 = l_keys_0(v41._owners);
    table.sort(v42);
    return v42;
end;
v15.getFilters = function(v43)
    return v43._filters;
end;
v15.addFilter = function(v44, v45, v46)
    v44._filters[v45] = v46;
    v44.OnItemsChanged:Fire(v44._items);
end;
v15.clearFilters = function(v47)
    v47._filters = {};
    v47.OnItemsChanged:Fire(v47._items);
end;
v15.getSorts = function(v48)
    return v48._sorts;
end;
v15.setSorts = function(v49, v50)
    v49._sorts = v50;
    v49.OnItemsChanged:Fire(v49._items);
end;
v15.addSort = function(v51, v52)
    local v53 = false;
    for v54, v55 in v51._sorts, nil, nil do
        if v55.Key == v52 then
            v53 = not v55.IsAscending;
            table.remove(v51._sorts, v54);
            break;
        end;
    end;
    table.insert(v51._sorts, 1, {
        Key = v52, 
        IsAscending = v53
    });
    v51.OnItemsChanged:Fire(v51._items);
end;
v15.getSelection = function(v56)
    return v56._selection;
end;
v15.setSelection = function(v57, v58)
    v57._selection = {};
    for _, v60 in v58, nil, nil do
        v57._selection[v60] = true;
    end;
    v57.OnItemSelectionChanged:Fire(v57._selection);
end;
v15.modifySelection = function(v61, v62)
    for _, v64 in v62, nil, nil do
        if not v61._selection[v64] then
            v61._selection[v64] = true;
        else
            v61._selection[v64] = nil;
        end;
    end;
    v61.OnItemSelectionChanged:Fire(l_copy_0(v61._selection));
end;
v15.getPrevClickIndex = function(v65)
    return v65._prevClickIndex;
end;
v15.handleClick = function(v66, v67, v68, v69, v70)
    local v71 = v9(v68, v66._prevClickIndex, v69);
    if not v70 then
        if not v66._usingCtrl then
            if not v66._usingShift then
                v66:setSelection({
                    v67
                });
                v66._prevClickIndex = v69;
                return ;
            else
                v66:setSelection(v71);
                return ;
            end;
        else
            v66:modifySelection({
                v67
            });
            v66._prevClickIndex = v69;
            return ;
        end;
    else
        v10(v66._selection);
        return ;
    end;
end;
return v15;
