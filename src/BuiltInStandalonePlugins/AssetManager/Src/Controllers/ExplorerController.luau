local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v4 = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
local v6 = l_ContextItem_0:extend("ExplorerController");
v6.new = function(v7, v8, v9)
    local v10 = {
        _isMock = v9, 
        _networking = v8, 
        _pluginController = v7, 
        explorerItems = {}, 
        _groups = {}, 
        _visibleGroups = {}, 
        _selection = {}, 
        _expansion = {}, 
        OnExplorerItemsChanged = l_Signal_0.new(), 
        OnExpansionChanged = l_Signal_0.new()
    };
    v10._selection = v10._pluginController:getUser();
    v10.populateExplorerItems = function()
        local v11 = {};
        table.insert(v11, v10._pluginController:getUser());
        for _, v13 in v10._visibleGroups, nil, nil do
            table.insert(v11, {
                Name = v10._groups[v13] or tostring(v13), 
                Id = v13, 
                Scope = v4.Scope.Group
            });
        end;
        return v11;
    end;
    v10._explorerItems = v10.populateExplorerItems();
    v10._networking:fetchGroupsAsync(function(v14)
        for _, v16 in v14.data, nil, nil do
            v10._groups[v16.id] = v16.name;
            table.insert(v10._visibleGroups, v16.id);
        end;
        v10._explorerItems = v10.populateExplorerItems();
        v10.OnExplorerItemsChanged:Fire(v10._explorerItems);
    end, function(v17)
        if v5() then
            warn((("Error fetching groups: %*"):format(v17)));
        end;
    end);
    setmetatable(v10, v6);
    return v10;
end;
v6.mock = function(v18, v19)
    return v6.new(v18, v19, true);
end;
v6.destroy = function(_)
end;
v6.getExplorerItems = function(v21)
    return v21._explorerItems;
end;
v6.getExpansion = function(v22)
    return v22._expansion;
end;
v6.getSelection = function(v23)
    return v23._selection;
end;
v6.setSelection = function(v24, v25)
    v24._selection = v25;
    v24._pluginController.OnSelectionChanged:Fire(v25);
end;
return v6;
