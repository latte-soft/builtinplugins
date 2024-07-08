local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local l_mapOne_0 = v1.mapOne;
local l_map_0 = v1.map;
local _ = require(l_Parent_0.Src.Types);
local v11 = {
    createItemId = function(...)
        return table.concat(l_map_0({
            ...
        }, function(v5)
            if typeof(v5) == "Instance" then
                return (("Instance[%*]"):format((v5:GetDebugId())));
            else
                return (tostring(v5));
            end;
        end), "/");
    end, 
    getRowChildren = function(v6)
        return v6.Children or {};
    end, 
    getTableRowId = function(v7)
        return v7.Id;
    end, 
    getOneSelectedItem = function(v8)
        return l_mapOne_0(v8, function(v9, v10)
            if v9 == true then
                return v10;
            else
                return nil;
            end;
        end);
    end
};
v11.updateItems = function(v12, v13, v14, v15)
    if not (not v13 or not v14) and v15 then
        v12:migrateItemState(v13, v14, v15);
        local l_Children_0 = v14.Children;
        local l_Children_1 = v15.Children;
        if l_Children_0 and l_Children_1 then
            for _, v19 in l_Children_0, nil, nil do
                for _, v21 in l_Children_1, nil, nil do
                    local v22 = v21.Instance == v19.Instance;
                    local v23 = v19.Name.Value == v21.Name.Value;
                    if not (not v22 or v21.Instance == nil and not v23) then
                        v11.updateItems(v12, v13, v19, v21);
                        break;
                    end;
                end;
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
return v11;
