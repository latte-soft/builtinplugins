local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v2.join;
local l_Actions_0 = l_Parent_0.Src.Actions;
return v1.createReducer({
    DesignSheet = nil, 
    IsDirty = false, 
    SearchTerm = "", 
    RootRoute = "Onboarding", 
    SelectedItemId = nil, 
    ExpandedItems = {}
}, {
    [require(l_Actions_0.Window.SetDesignSheet).name] = function(v5, v6)
        return l_join_0(v5, {
            DesignSheet = v6.designSheet, 
            SelectItem = if v5.DesignSheet ~= v6.designSheet then v2.None else v5.SelectedItemId
        });
    end, 
    [require(l_Actions_0.Window.SetIsDirty).name] = function(v7, v8)
        return l_join_0(v7, {
            IsDirty = v8.isDirty
        });
    end, 
    [require(l_Actions_0.Window.SetSearch).name] = function(v9, v10)
        return l_join_0(v9, {
            SearchTerm = v10.searchTerm
        });
    end, 
    [require(l_Actions_0.Window.SetRootRoute).name] = function(v11, v12)
        return l_join_0(v11, {
            RootRoute = v12.route
        });
    end, 
    [require(l_Actions_0.Window.SelectItem).name] = function(v13, v14)
        if v14.itemId then
            return l_join_0(v13, {
                SelectedItemId = v14.itemId, 
                ExpandedItems = l_join_0(v13.ExpandedItems, {
                    [v14.itemId] = not (v13.SelectedItemId == v14.itemId) and true or not (v13.ExpandedItems[v14.itemId] or false)
                })
            });
        else
            return l_join_0(v13, {
                SelectedItemId = v2.None
            });
        end;
    end, 
    [require(l_Actions_0.Window.DeselectItem).name] = function(v15, v16)
        if v15.SelectedItemId ~= v16.itemId then
            return v15;
        else
            return l_join_0(v15, {
                SelectedItemId = v2.None
            });
        end;
    end, 
    [require(l_Actions_0.Window.SetItemsExpanded).name] = function(v17, v18)
        return l_join_0(v17, {
            ExpandedItems = l_join_0(v17.ExpandedItems, v18.expandedItems)
        });
    end
});
