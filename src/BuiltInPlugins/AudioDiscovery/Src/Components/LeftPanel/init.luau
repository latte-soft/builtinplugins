local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_Dash_0 = v3.Dash;
local l_map_0 = l_Dash_0.map;
local l_join_0 = l_Dash_0.join;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v10 = require(l_Parent_0.Src.Util.Analytics);
local v11 = require(l_Parent_0.Src.Actions.SelectRow);
local v12 = require(l_Parent_0.Src.Actions.SortTable);
local l_Stylizer_0 = v3.Style.Stylizer;
local l_Selection_0 = game:GetService("Selection");
local v15 = require(l_Parent_0.Src.Components.AudioTable);
local v16 = require(script.LeftCell);
local v17 = v1.PureComponent:extend("LeftPanel");
v17.init = function(v18)
    v18.state = {
        sizes = {
            UDim.new(0.1, 0), 
            UDim.new(0.2, 0), 
            UDim.new(0.3, 0), 
            UDim.new(0.1, 0), 
            UDim.new(0.3, 0)
        }
    };
    v18.onSizesChange = function(v19)
        v18:setState({
            sizes = v19
        });
    end;
    v18.onSelectRow = function(v20, v21)
        local v22 = v18.props.Locations[v20.Id];
        if v22 and #v22 > 0 then
            l_Selection_0:Set({
                v22[1].Instance
            });
        end;
        v18.props.OnSelectRow(v21);
        v10:reportSelect();
    end;
end;
v17.render = function(v23)
    local l_props_0 = v23.props;
    local l_state_0 = v23.state;
    local l_Localization_1 = l_props_0.Localization;
    return v1.createElement(v15, {
        Scroll = true, 
        UseScale = true, 
        ClampSize = true, 
        OnColumnSizesChange = v23.onSizesChange, 
        SortIndex = l_props_0.SortIndex, 
        SortOrder = l_props_0.SortOrder, 
        OnSortChange = l_props_0.Sort, 
        CellComponent = v16, 
        Columns = l_map_0({
            {
                Name = l_Localization_1:getText("Table", "OK")
            }, 
            {
                Name = l_Localization_1:getText("Table", "Id")
            }, 
            {
                Name = l_Localization_1:getText("Table", "Name")
            }, 
            {
                Name = l_Localization_1:getText("Table", "Time")
            }, 
            {
                Name = l_Localization_1:getText("Table", "Creator")
            }
        }, function(v27, v28)
            return l_join_0(v27, {
                Width = l_state_0.sizes[v28]
            });
        end), 
        Rows = l_props_0.Rows, 
        SelectedRow = l_props_0.SelectedRow, 
        OnSelectRow = v23.onSelectRow, 
        CellProps = {
            Locations = l_props_0.Locations
        }
    });
end;
return v2.connect(function(v29, _)
    return {
        Locations = v29.Audio.Locations, 
        Rows = v29.Audio.Rows, 
        SelectedRow = v29.Audio.SelectedRow, 
        SortIndex = v29.Audio.Left.SortIndex, 
        SortOrder = v29.Audio.Left.SortOrder
    };
end, function(v31)
    return {
        OnSelectRow = function(v32)
            v31(v11(v32));
        end, 
        Sort = function(v33, v34)
            v31(v12("Left", v33, v34));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v17)));
