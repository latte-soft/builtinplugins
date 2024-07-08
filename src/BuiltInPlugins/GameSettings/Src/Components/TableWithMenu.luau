local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ScrollingFrame_0 = v3.UI.ScrollingFrame;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Components.TableWithMenuItem);
local v8 = v1.PureComponent:extend("TableWithMenu");
v8.createHeaderLabels = function(_, v10, v11, v12)
    local v13 = {
        HeaderLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v10.table.textPadding), 
            PaddingRight = UDim.new(0, v10.table.textPadding)
        })
    };
    local v14 = #v11;
    for v15 = 1, #v11 do
        v13[v15] = v1.createElement("TextLabel", v2.Dictionary.join(v10.fontStyle.Normal, {
            Size = UDim2.new(1 / v14, 0, 1, 0), 
            LayoutOrder = v15, 
            Text = v11[v15], 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }));
    end;
    if v12 then
        v13[#v11 + 1] = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = #v11 + 1, 
            Size = UDim2.new(0, 0, 1, 0)
        }, {
            v12
        });
    end;
    return v13;
end;
v8.createDataLabels = function(v16, v17, v18, v19, v20)
    local v21 = {
        ListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v1.Ref] = v16.layoutRef
        })
    };
    local v22 = 0;
    for v23, v24 in pairs(v17) do
        local v25 = nil;
        if not v20 then
            v25 = v18;
        else
            v25 = {
                unpack(v18)
            };
            v20(v24, v25);
        end;
        v21[v23] = v1.createElement(v7, {
            RowData = v24.row, 
            MenuItems = v25, 
            OnItemClicked = function(v26)
                v19(v26, v23);
            end, 
            LayoutOrder = v24.index, 
            Icon = v24.icon or nil
        });
        v22 = v22 + 1;
    end;
    return v21, v22;
end;
v8.init = function(v27)
    v27.layoutRef = v1.createRef();
end;
v8.render = function(v28)
    local l_props_0 = v28.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Headers_0 = l_props_0.Headers;
    local l_Data_0 = l_props_0.Data;
    local l_MenuItems_0 = l_props_0.MenuItems;
    local l_OnItemClicked_0 = l_props_0.OnItemClicked;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v36 = l_props_0.NextPageFunc or function()
    end;
    local l_MenuItemsFilterFunc_0 = l_props_0.MenuItemsFilterFunc;
    local l_ScrollingFrameNextPageRequestDistance_0 = l_props_0.ScrollingFrameNextPageRequestDistance;
    local l_HeaderButton_0 = l_props_0.HeaderButton;
    local v40 = l_props_0.TableHeight or l_Stylizer_0.table.height;
    local l_ShowTableBackground_0 = l_props_0.ShowTableBackground;
    local v42 = v28:createHeaderLabels(l_Stylizer_0, l_Headers_0, l_HeaderButton_0);
    local v43, v44 = v28:createDataLabels(l_Data_0, l_MenuItems_0, l_OnItemClicked_0, l_MenuItemsFilterFunc_0);
    local v45 = v44 == 0 and l_props_0.EmptyText or nil;
    local v46 = not not l_ShowTableBackground_0 and l_Stylizer_0.table.item.background or nil;
    local v47 = UDim2.new(1, 0, 1, -l_Stylizer_0.table.header.height);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v40), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        ListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        HeaderFrame = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.table.header.height), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, v42), 
        ScrollingContainer = not v45 and v1.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            Size = v47, 
            NextPageFunc = v36, 
            NextPageRequestDistance = l_ScrollingFrameNextPageRequestDistance_0, 
            LayoutOrder = 2
        }, v43), 
        EmptyTextBox = v45 and v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Smaller, {
            Size = v47, 
            LayoutOrder = 2, 
            Text = v45, 
            BackgroundTransparency = not l_ShowTableBackground_0 and 1 or 0, 
            BackgroundColor3 = v46, 
            BorderColor3 = v46, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), {})
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
