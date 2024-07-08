local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_copy_0 = v3.Dash.copy;
local l_values_0 = v3.Dash.values;
local l_UI_0 = v3.UI;
local l_Table_0 = l_UI_0.Table;
local l_Pane_0 = l_UI_0.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v14 = require(l_script_FirstAncestor_0.Src.Actions.UpdateQueueItem);
local v15 = require(l_script_FirstAncestor_0.Src.Components.ImportQueue.AssetListCell);
local v16 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v17 = v1.PureComponent:extend("AssetList");
v17.init = function(v18)
    v18.columnDefaults = {
        {
            Name = "", 
            Key = "Checkbox", 
            Width = UDim.new(0, 28)
        }, 
        {
            Name = "Asset", 
            Key = "Asset", 
            Width = UDim.new(0.5, -84)
        }, 
        {
            Name = "Preset", 
            Key = "Preset", 
            Width = UDim.new(0, 140)
        }, 
        {
            Name = "Path", 
            Key = "Path", 
            Width = UDim.new(0.5, -84)
        }
    };
    v18.state = {
        columns = v18.columnDefaults
    };
    v18.onColumnSizesChange = function(v19)
        local v20 = l_copy_0(v18.state.columns);
        for v21 = 1, #v18.state.columns do
            v20.Width = v19[v21];
        end;
        v18:setState({
            columns = v20
        });
    end;
    v18.getRows = function()
        local v22 = l_values_0(v18.props.SessionQueue) or {};
        table.sort(v22, v16.compare);
        return v22;
    end;
    v18.onCheckboxToggle = function(v23)
        local l_props_0 = v18.props;
        local v25 = l_copy_0(l_props_0.SessionQueue);
        l_props_0.UpdateQueueItem(v16.update(v25[v23], {
            enabled = not v25[v23].enabled
        }));
    end;
end;
v17.render = function(v26)
    local l_props_1 = v26.props;
    local l_LayoutOrder_0 = v26.props.LayoutOrder;
    local l_Stylizer_1 = l_props_1.Stylizer;
    return v1.createElement(l_Pane_0, {
        Size = l_props_1.Size, 
        Padding = l_Stylizer_1.AssetList.Padding, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Inner = v1.createElement(l_Table_0, {
            Rows = v26.getRows(), 
            Columns = v26.state.columns, 
            Size = UDim2.fromScale(1, 1), 
            Scroll = true, 
            CellComponent = v15, 
            CellProps = {
                OnCheckboxToggle = v26.onCheckboxToggle, 
                StatusIconSize = l_Stylizer_1.PropertyView.IconSize
            }, 
            RowHeight = l_Stylizer_1.AssetList.RowHeight
        })
    });
end;
return v2.connect(function(v30)
    return {
        SessionQueue = v30.Sessions.sessionQueue
    };
end, function(v31)
    return {
        UpdateQueueItem = function(v32)
            v31(v14(v32));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v17)));
