local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_TextService_0 = game:GetService("TextService");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local l_ContextServices_0 = v3.ContextServices;
local v6 = require(l_Packages_0.Dash);
local _ = v3.UI.HoverArea;
local l_Pane_0 = v3.UI.Pane;
local l_withAbsoluteSizeAndPosition_0 = v3.Wrappers.withAbsoluteSizeAndPosition;
local v10 = require(l_script_FirstAncestor_0.Core.Util.multiLanguageUtils);
local v11 = require(l_script_FirstAncestor_0.Core.Components.Categorization.SearchPill);
local l_withContext_0 = l_ContextServices_0.withContext;
local v13 = v4.PureComponent:extend("SearchList");
v13.defaultProps = {
    ItemMinWidth = 0, 
    MaxRowCount = math.huge, 
    Size = UDim2.new(1, 0, 0, 0)
};
v13.init = function(v14)
    v14.onRenderItem = function(v15, v16, v17)
        local l_props_0 = v14.props;
        return v4.createElement(v11, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v15, 
            OnClick = l_props_0.OnClick, 
            Size = UDim2.new(0, v17, 0, l_props_0.Stylizer.searchPill.textSize), 
            Text = v10.lower(v16)
        });
    end;
    v14.resizeRowItemsToAvailableSpace = function(v19, v20, v21)
        if #v19 == 0 then
            return ;
        else
            local v22 = v21 - v20;
            local v23 = math.floor(v22 / #v19);
            for _, v25 in ipairs(v19) do
                v25.Width = v25.Width + v23;
            end;
            local v26 = v22 - v23 * #v19;
            local v27 = v19[#v19];
            v27.Width = v27.Width + v26;
            return ;
        end;
    end;
    v14.getRowMatrix = function()
        local l_props_1 = v14.props;
        local l_Stylizer_0 = l_props_1.Stylizer;
        local l_Items_0 = l_props_1.Items;
        local l_ItemMinWidth_0 = l_props_1.ItemMinWidth;
        local l_MaxRowCount_0 = l_props_1.MaxRowCount;
        local l_X_0 = l_props_1.AbsoluteSize.X;
        local v34 = {};
        local v35 = {};
        local v36 = 0;
        local l_searchList_0 = l_Stylizer_0.searchList;
        local l_searchPill_0 = l_Stylizer_0.searchPill;
        for v39, v40 in ipairs(l_Items_0) do
            local v41 = l_TextService_0:GetTextSize(v40, l_searchPill_0.textSize, l_searchPill_0.font, Vector2.new(l_X_0, math.huge)).X + l_ItemMinWidth_0;
            local v42 = {
                Item = v40, 
                Width = v41
            };
            local l_v36_0 = v36;
            v36 = v36 + v41;
            if v39 ~= 1 then
                v36 = v36 + l_searchList_0.buttonSpacing;
            end;
            if l_X_0 < v36 then
                v14.resizeRowItemsToAvailableSpace(v35, l_v36_0, l_X_0);
                table.insert(v34, v35);
                v36 = v41;
                v35 = {};
            end;
            if #v34 < l_MaxRowCount_0 then
                table.insert(v35, v42);
            else
                break;
            end;
        end;
        if #v35 > 0 then
            table.insert(v34, v35);
            v14.resizeRowItemsToAvailableSpace(v35, v36, l_X_0);
        end;
        return v34;
    end;
end;
v13.render = function(v44)
    local l_props_2 = v44.props;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local _ = l_props_2.Items;
    local l_Position_0 = l_props_2.Position;
    local l_Size_0 = l_props_2.Size;
    local l_searchList_1 = l_props_2.Stylizer.searchList;
    local v51 = v44.getRowMatrix();
    local v52 = {};
    for v53, v54 in pairs(v51) do
        local v55 = {};
        for v56, v57 in pairs(v54) do
            table.insert(v55, (v44.onRenderItem(v56, v57.Item, v57.Width)));
        end;
        table.insert(v52, (v4.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v53, 
            Size = UDim2.new(1, 0, 0, 0), 
            Spacing = l_searchList_1.buttonSpacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, v55)));
    end;
    return v4.createElement(l_Pane_0, v6.join({
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0, 
        Spacing = l_searchList_1.buttonSpacing
    }, l_props_2.WrapperProps), v52);
end;
return l_withAbsoluteSizeAndPosition_0((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v13)));
