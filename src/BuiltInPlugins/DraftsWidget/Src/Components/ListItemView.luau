local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Src.Components.AbstractItemView);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v7 = v2.Component:extend("ListItemView");
v7.init = function(v8)
    v8:setState({});
    v8.canvasRef = v2.createRef();
    v8.contentSizeChanged = function(v9)
        local l_current_0 = v8.canvasRef.current;
        if l_current_0 then
            l_current_0.CanvasSize = UDim2.new(1, 0, 0, v9.Y);
        end;
    end;
end;
v7.render = function(v11)
    local l_ItemHeight_0 = v11.props.ItemHeight;
    local l_Items_0 = v11.props.Items;
    local l_RenderItem_0 = v11.props.RenderItem;
    local l_MakeMenuActions_0 = v11.props.MakeMenuActions;
    local l_OnDoubleClicked_0 = v11.props.OnDoubleClicked;
    local l_OnSelectionChanged_0 = v11.props.OnSelectionChanged;
    local l_ButtonStyle_0 = v11.props.ButtonStyle;
    local l_GetCurrentSelection_0 = v11.props.GetCurrentSelection;
    local l_VerticalAlignment_0 = v11.props.VerticalAlignment;
    local l_Padding_0 = v11.props.Padding;
    return v2.createElement(v3, {
        Size = UDim2.new(1, 0, 1, 0), 
        GetCurrentSelection = l_GetCurrentSelection_0, 
        OnDoubleClicked = l_OnDoubleClicked_0, 
        OnSelectionChanged = l_OnSelectionChanged_0, 
        MakeMenuActions = l_MakeMenuActions_0, 
        ButtonStyle = l_ButtonStyle_0, 
        Items = l_Items_0, 
        RenderItem = l_RenderItem_0, 
        RenderContents = function(v22)
            local v23 = {};
            for v24, v25 in pairs(v22) do
                v23[v24] = v2.createElement("Frame", {
                    LayoutOrder = v25.Index, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, l_ItemHeight_0)
                }, {
                    Button = v25.Button
                });
            end;
            return v2.createElement(l_ScrollingFrame_0, {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                [v2.Ref] = v11.canvasRef
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    VerticalAlignment = l_VerticalAlignment_0, 
                    Padding = l_Padding_0, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    [v2.Change.AbsoluteContentSize] = function(v26)
                        v11.contentSizeChanged(v26.AbsoluteContentSize);
                    end
                }), 
                FitContent = v2.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Vertical
                }, v23)
            });
        end
    });
end;
return v7;
