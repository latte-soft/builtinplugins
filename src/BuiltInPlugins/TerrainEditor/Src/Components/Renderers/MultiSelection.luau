local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_UI_0 = v1.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Pane_0 = l_UI_0.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v9)
    local l_Schema_0 = v9.Schema;
    local v11 = l_Stylizer_0:use("MultiSelectionRenderer");
    local v12 = l_LayoutOrderIterator_0.new();
    local l_Items_0 = l_Schema_0.Items;
    local l_Labels_0 = l_Schema_0.Labels;
    local l_Value_0 = v9.Value;
    local v16 = {};
    for v17, v18 in l_Items_0, nil, nil do
        v16[v17] = v2.createElement(l_Checkbox_0, {
            Checked = l_Value_0[v18], 
            Disabled = v9.Disabled, 
            LayoutOrder = v12:getNextOrder(), 
            OnClick = function()
                local v19 = table.clone(l_Value_0);
                v19[v18] = not l_Value_0[v18];
                v9.OnChanged(v19);
            end, 
            Text = l_Labels_0[v17]
        });
    end;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        Size = UDim2.fromScale(1, 0), 
        Spacing = v11.Spacing
    }, v16);
end;
