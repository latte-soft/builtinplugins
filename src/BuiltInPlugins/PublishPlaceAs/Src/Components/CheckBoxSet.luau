local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_Checkbox_0 = l_UI_0.Checkbox;
local v9 = v1.PureComponent:extend("CheckBoxSet");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Title_0 = l_props_0.Title;
    local v14 = l_props_0.LayoutOrder or 1;
    local l_Boxes_0 = l_props_0.Boxes;
    local v16 = l_props_0.Enabled == nil and true or l_props_0.Enabled;
    local l_EntryClicked_0 = l_props_0.EntryClicked;
    local l_ErrorMessage_0 = l_props_0.ErrorMessage;
    assert(type(l_Boxes_0) == "table", "CheckBoxSet.Boxes must be a table");
    local v19 = {
        Layout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, 8), 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v20 = nil;
    local l_v19_0 = v19;
    if l_props_0.UseGridLayout then
        v20 = {
            v1.createElement("UIGridLayout", {
                CellSize = UDim2.new(0, l_Stylizer_0.SCREEN_CHOOSE_GAME.ICON_SIZE, 0, 25), 
                CellPadding = UDim2.new(0, l_Stylizer_0.SCREEN_CHOOSE_GAME.CELL_PADDING_X, 0, 2), 
                [v1.Ref] = v10.layoutRef, 
                FillDirectionMaxCells = 2
            })
        };
        l_v19_0 = v20;
    end;
    for v22, v23 in ipairs(l_Boxes_0) do
        local l_l_v19_0_0 = l_v19_0;
        local l_createElement_0 = v1.createElement;
        local l_l_Checkbox_0_0 = l_Checkbox_0;
        local v27 = {};
        local v28 = false;
        if v23.Selected ~= nil then
            v28 = v23.Selected;
        end;
        v27.Checked = v28;
        v27.Disabled = not v16;
        v27.Key = v23.Id;
        v27.LayoutOrder = v22;
        v27.OnClick = function()
            l_EntryClicked_0(v23);
        end;
        v27.Text = v23.Title;
        table.insert(l_l_v19_0_0, l_createElement_0(l_l_Checkbox_0_0, v27, {
            Link = v23.LinkTextFrame
        }));
    end;
    if l_props_0.UseGridLayout then
        for _, v30 in ipairs(v20) do
            table.insert(v19, v30);
        end;
    end;
    if l_props_0[v1.Children] then
        v19 = v2.Dictionary.join(l_props_0[v1.Children], v19);
    end;
    if l_ErrorMessage_0 then
        v19.Error = v1.createElement("TextLabel", {
            LayoutOrder = #l_Boxes_0 + 1, 
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1, 
            Text = l_ErrorMessage_0, 
            TextSize = 16, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_Stylizer_0.checkboxset.font, 
            TextColor3 = l_Stylizer_0.checkboxset.error
        });
    end;
    local v31 = #l_Boxes_0 * 28;
    if l_props_0.MaxHeight then
        v31 = v31 + l_props_0.MaxHeight;
    end;
    if l_props_0.AbsoluteMaxHeight then
        v31 = l_props_0.AbsoluteMaxHeight;
    end;
    return v1.createElement(l_TitledFrame_0, {
        LayoutOrder = v14, 
        Title = l_Title_0
    }, v19);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
