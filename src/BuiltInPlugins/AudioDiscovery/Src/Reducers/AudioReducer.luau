local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_Dash_0 = require(l_Parent_0.Packages.Framework).Dash;
local l_append_0 = l_Dash_0.append;
local l_join_0 = l_Dash_0.join;
local l_findIndex_0 = l_Dash_0.findIndex;
local l_None_0 = l_Dash_0.None;
local l_sort_0 = table.sort;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v9 = require(l_Actions_0.SetDialog);
local v10 = require(l_Actions_0.SelectRow);
local v11 = require(l_Actions_0.Unpause);
local v12 = require(l_Actions_0.UpdateRows);
local v13 = require(l_Actions_0.UpdateLocations);
local v14 = require(l_Actions_0.SortTable);
local v15 = {
    Left = {
        "OK", 
        "Id", 
        "Name", 
        "Time", 
        "Creator"
    }, 
    Right = {
        "Instance", 
        "Path"
    }
};
local function _(v16, v17, v18)
    local v19 = v17[v16];
    if v16 == "Id" then
        return (tonumber(v19));
    elseif v18 and v16 == "OK" then
        if v18[v17.Id] and #v18[v17.Id] == 0 then
            return "fixed";
        else
            return v19;
        end;
    elseif type(v19) == "userdata" then
        return (tostring(v19));
    else
        return v19;
    end;
end;
local function v38(v21, v22, v23, v24)
    local v25 = l_join_0({}, v21);
    l_sort_0(v25, function(v26, v27)
        if v23 == Enum.SortDirection.Descending then
            local l_v22_0 = v22;
            local l_v24_0 = v24;
            local v30 = v26[l_v22_0];
            local v31 = if l_v22_0 == "Id" then tonumber(v30) else if l_v24_0 and l_v22_0 == "OK" then (l_v24_0[v26.Id] and #l_v24_0[v26.Id] == 0) and "fixed" or v30 else if type(v30) == "userdata" then tostring(v30) else v30;
            l_v24_0 = v22;
            v30 = v24;
            local v32 = v27[l_v24_0];
            return v31 < if l_v24_0 == "Id" then tonumber(v32) else if v30 and l_v24_0 == "OK" then (v30[v27.Id] and #v30[v27.Id] == 0) and "fixed" or v32 else if type(v32) == "userdata" then tostring(v32) else v32;
        else
            local l_v22_1 = v22;
            local l_v24_1 = v24;
            local v35 = v26[l_v22_1];
            local v36 = if l_v22_1 == "Id" then tonumber(v35) else if l_v24_1 and l_v22_1 == "OK" then (l_v24_1[v26.Id] and #l_v24_1[v26.Id] == 0) and "fixed" or v35 else if type(v35) == "userdata" then tostring(v35) else v35;
            l_v24_1 = v22;
            v35 = v24;
            local v37 = v27[l_v24_1];
            return if l_v24_1 == "Id" then tonumber(v37) else if v35 and l_v24_1 == "OK" then (v35[v27.Id] and #v35[v27.Id] == 0) and "fixed" or v37 else if type(v37) == "userdata" then tostring(v37) else v37 < v36;
        end;
    end);
    return v25;
end;
return v1.createReducer({
    Dialog = false, 
    Paused = true, 
    Rows = {}, 
    SelectedRow = nil, 
    Left = {
        SortIndex = 1, 
        SortOrder = Enum.SortDirection.Descending
    }, 
    Right = {}
}, {
    [v9.name] = function(v39, v40)
        return l_join_0(v39, {
            Dialog = v40.Open
        });
    end, 
    [v12.name] = function(v41, v42)
        local v43 = v15.Left[v41.Left.SortIndex];
        local v44 = l_append_0({}, v41.Rows, v42.Rows);
        local v45 = nil;
        local v46 = v38(v44, v43, v41.Left.SortOrder, v41.Locations);
        if v41.SelectedRow then
            local l_Id_0 = v41.Rows[v41.SelectedRow].Id;
            v45 = l_findIndex_0(v46, function(v48)
                return v48.Id == l_Id_0;
            end) or l_None_0;
        end;
        return l_join_0(v41, {
            SelectedRow = v45, 
            Rows = v46
        });
    end, 
    [v11.name] = function(v49)
        return l_join_0(v49, {
            Paused = false
        });
    end, 
    [v10.name] = function(v50, v51)
        local l_locations_0 = v50.locations;
        if not (not v50.Right.SortIndex or not v50.SelectedRow) then
            local l_Id_1 = v50.Rows[v50.SelectedRow].Id;
            l_locations_0 = l_join_0({}, v50.Locations, {
                [l_Id_1] = v38(v50.Locations[l_Id_1], v15.Right[v50.Right.SortIndex], v50.Right.SortOrder)
            });
        end;
        return l_join_0(v50, {
            Locations = l_locations_0, 
            SelectedRow = v51.SelectedRow
        });
    end, 
    [v13.name] = function(v54, v55)
        local _ = nil;
        local v57 = l_join_0({}, v54.Locations, v55.Locations);
        return l_join_0(v54, {
            Rows = v38(v54.Rows, v15.Left[v54.Left.SortIndex], v54.Left.SortOrder, v57), 
            Locations = v57
        });
    end, 
    [v14.name] = function(v58, v59)
        local v60 = v15[v59.TableName][v59.SortIndex];
        local l_SelectedRow_0 = v58.SelectedRow;
        local l_Rows_0 = v58.Rows;
        local l_Locations_0 = v58.Locations;
        local v64 = if not v58.SelectedRow then nil else v58.Rows[v58.SelectedRow].Id;
        if v59.TableName == "Left" then
            l_Rows_0 = v38(v58.Rows, v60, v59.SortOrder, l_Locations_0);
            if v58.SelectedRow then
                l_SelectedRow_0 = l_findIndex_0(l_Rows_0, function(v65)
                    return v65.Id == v64;
                end) or l_None_0;
            end;
        end;
        if not (not (v59.TableName == "Right") or not v64) then
            l_Locations_0 = l_join_0({}, v58.Locations, {
                [v64] = v38(v58.Locations[v64], v60, v59.SortOrder)
            });
        end;
        return l_join_0(v58, {
            SelectedRow = l_SelectedRow_0, 
            Rows = l_Rows_0, 
            Locations = l_Locations_0, 
            [v59.TableName] = {
                SortIndex = v59.SortIndex, 
                SortOrder = v59.SortOrder
            }
        });
    end
});
