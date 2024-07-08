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
local v10 = require(l_Parent_0.Src.Actions.SortTable);
local l_Selection_0 = game:GetService("Selection");
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v16 = require(l_Parent_0.Src.Components.AudioTable);
local v17 = require(script.RightCell);
local v18 = v1.PureComponent:extend("RightPanel");
v18.init = function(v19)
    v19.state = {
        sizes = {
            UDim.new(0.3333333333333333, 0), 
            UDim.new(0.6666666666666666, 0)
        }
    };
    v19.onSizesChange = function(v20)
        v19:setState({
            sizes = v20
        });
    end;
end;
v18.render = function(v21)
    local l_props_0 = v21.props;
    local l_state_0 = v21.state;
    local l_Localization_1 = l_props_0.Localization;
    local v27 = l_map_0({
        {
            Name = l_Localization_1:getText("Table", "Instance")
        }, 
        {
            Name = l_Localization_1:getText("Table", "Path")
        }
    }, function(v25, v26)
        return l_join_0(v25, {
            Width = l_state_0.sizes[v26]
        });
    end);
    if l_props_0.Rows and #l_props_0.Rows > 0 then
        return v1.createElement(v16, {
            Scroll = true, 
            UseScale = true, 
            ClampSize = true, 
            OnColumnSizesChange = v21.onSizesChange, 
            SortIndex = l_props_0.SortIndex, 
            SortOrder = l_props_0.SortOrder, 
            OnSortChange = l_props_0.Sort, 
            Columns = v27, 
            Rows = l_props_0.Rows, 
            CellComponent = v17, 
            OnSelectRow = function(v28)
                l_Selection_0:Set({
                    v28.Instance
                });
            end
        });
    else
        return v1.createElement(l_Pane_0, {
            Padding = 5
        }, {
            Child = v1.createElement(l_TextLabel_0, {
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true, 
                Size = UDim2.fromScale(1, 1), 
                RichText = true, 
                Text = l_Localization_1:getText("Plugin", "Info")
            })
        });
    end;
end;
return v2.connect(function(v29, _)
    local v31 = if not v29.Audio.SelectedRow then nil else v29.Audio.Rows[v29.Audio.SelectedRow];
    return {
        Rows = if not v31 then {} else v29.Audio.Locations[v31.Id], 
        SortOrder = v29.Audio.Right.SortOrder, 
        SortIndex = v29.Audio.Right.SortIndex
    };
end, function(v32)
    return {
        Sort = function(v33, v34)
            v32(v10("Right", v33, v34));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v18)));
