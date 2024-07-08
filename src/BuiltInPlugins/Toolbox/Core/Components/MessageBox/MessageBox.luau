local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v8 = require(l_Parent_0.Core.Components.PluginWidget.Dialog);
local v9 = require(l_Parent_0.Core.Components.MessageBox.MessageBoxButton);
local v10 = v2.PureComponent:extend("MessageBox");
v10.init = function(v11, _)
    v11.isDead = false;
    v11.onEnabledChanged = function(v13)
        if not v11.isDead then
            if not (v13.Enabled or not v11.props.onClose) then
                v11.props.onClose();
            end;
            return ;
        else
            return ;
        end;
    end;
    v11.onAncestryChanged = function(_, _, v16)
        if not v11.isDead then
            if not (v16 or not v11.props.onClose) then
                v11.props.onClose();
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v10.willUnmount = function(v17)
    v17.isDead = true;
end;
v10.render = function(v18)
    local l_props_0 = v18.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v21 = l_props_0.Title or "";
    local v22 = l_props_0.Name or v21;
    local v23 = l_props_0.Id or nil;
    local v24 = l_props_0.Text or "";
    local v25 = l_props_0.InformativeText or "";
    local v26 = l_props_0.Icon or "";
    local v27 = #v25 ~= 0;
    local v28 = v26 ~= "";
    local l_FONT_0 = v4.FONT;
    local l_FONT_SIZE_SMALL_0 = v4.FONT_SIZE_SMALL;
    local l_FONT_1 = v4.FONT;
    local l_FONT_SIZE_SMALL_1 = v4.FONT_SIZE_SMALL;
    local l_messageBox_0 = l_Stylizer_0.messageBox;
    local v34 = l_props_0.buttons or {};
    if #v34 == 0 then
        v34 = {
            {
                Text = "Ok", 
                action = "ok"
            }
        };
    end;
    local l_MESSAGE_BOX_BUTTON_WIDTH_0 = v4.MESSAGE_BOX_BUTTON_WIDTH;
    local v36 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 8)
        })
    };
    for v37, v38 in ipairs(v34) do
        v36[v38.action .. v37] = v2.createElement(v9, {
            index = v37, 
            Text = v38.Text, 
            action = v38.action, 
            onButtonClicked = v18.props.onButtonClicked
        });
    end;
    local v39 = math.max(math.min(l_GetTextSize_0(v24, l_FONT_SIZE_SMALL_0, l_FONT_0, Vector2.new(0, 0)).X, 424), (math.min(l_GetTextSize_0(v25, l_FONT_SIZE_SMALL_1, l_FONT_1, Vector2.new(0, 0)).X, 192)));
    local v40 = not v28 and 0 or 32;
    local v41 = v40 + 20;
    local v42 = v41 + v39;
    local v43 = if not l_props_0.IconColor then nil else l_props_0.IconColor;
    local v44 = math.max(math.max(#v34 * l_MESSAGE_BOX_BUTTON_WIDTH_0 + (#v34 - 1) * 8, v42), 120);
    local v45 = v44 - v41;
    local v46 = l_GetTextSize_0(v24, l_FONT_SIZE_SMALL_0, l_FONT_0, Vector2.new(v45, 1000));
    local v47 = l_GetTextSize_0(v25, l_FONT_SIZE_SMALL_1, l_FONT_1, Vector2.new(v45, 1000));
    local l_Y_0 = v46.Y;
    local l_Y_1 = v47.Y;
    local v50 = math.max(v40, l_Y_0 + (not not v27 and 8 + l_Y_1 or 0));
    return v2.createElement(v8, {
        Name = v22, 
        Title = v21, 
        Id = v23, 
        Size = Vector2.new((12 + v44) + 12, (((8 + v50) + 12) + 23) + 12), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        Modal = true, 
        plugin = v18.props.Plugin:get(), 
        [v2.Change.Enabled] = v18.onEnabledChanged, 
        [v2.Event.AncestryChanged] = v18.onAncestryChanged
    }, {
        Background = v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_messageBox_0.backgroundColor
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                PaddingTop = UDim.new(0, 8)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 12)
            }), 
            Information = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v50), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 20), 
                    FillDirection = Enum.FillDirection.Horizontal
                }), 
                Icon = v2.createElement("ImageLabel", {
                    Size = UDim2.new(0, v40, 0, v40), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 0, 
                    Image = v26, 
                    ImageColor3 = v43
                }), 
                Texts = v2.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, -v41, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        Padding = UDim.new(0, 8), 
                        FillDirection = Enum.FillDirection.Vertical
                    }), 
                    TextLabel = v2.createElement("TextLabel", {
                        LayoutOrder = 0, 
                        Size = UDim2.new(1, 0, 0, l_Y_0), 
                        BackgroundTransparency = 1, 
                        Text = v24, 
                        Font = l_FONT_0, 
                        TextSize = l_FONT_SIZE_SMALL_0, 
                        TextColor3 = l_messageBox_0.textColor, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true
                    }), 
                    InformativeLabel = v27 and v2.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, l_Y_1), 
                        BackgroundTransparency = 1, 
                        Text = v25, 
                        Font = l_FONT_1, 
                        TextSize = l_FONT_SIZE_SMALL_1, 
                        TextColor3 = l_messageBox_0.informativeTextColor, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true
                    })
                })
            }), 
            Buttons = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 23), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, v36)
        })
    });
end;
return (l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
