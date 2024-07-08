local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_StyleKey_0 = v4.Style.StyleKey;
local l_UI_0 = v4.UI;
local l_List_0 = l_UI_0.List;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v14 = v2.PureComponent:extend("EventList");
v14.init = function(v15)
    v15.rightAlignSizes = {};
end;
v14.render = function(v16)
    local l_props_0 = v16.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_SelectedIndex_0 = l_props_0.SelectedIndex;
    local v20 = string.lower(l_props_0.SearchTerm);
    return v2.createElement(l_List_0, {
        Rows = l_props_0.Events, 
        RowComponent = "TextButton", 
        GetRowProps = function(v21, v22, v23, v24)
            local l_props_1 = v21.props;
            local l_name_0 = l_props_1.name;
            local l_elapsedMs_0 = l_props_1.elapsedMs;
            local v28 = v22 == l_SelectedIndex_0;
            local v29 = v20 ~= "" and string.find(string.lower(l_name_0), v20, 1, true) ~= nil;
            local v30 = v21.eventType == "Flush" and 6 or 1;
            local v31 = v30 * 0.75;
            local v32 = nil;
            if v31 <= l_elapsedMs_0 then
                v32 = l_Stylizer_1[l_StyleKey_0.ErrorText]:Lerp(l_Stylizer_1[l_StyleKey_0.WarningText], (math.clamp((v30 - l_elapsedMs_0) / (v30 - v31), 0, 1)));
            end;
            if v16.rightAlignSizes[v22] == nil then
                v16.rightAlignSizes[v22] = {
                    v2.createBinding(Vector2.zero)
                };
            end;
            return {
                LayoutOrder = v22, 
                Position = v23, 
                Size = v24, 
                BackgroundColor3 = if not v28 then l_Stylizer_1[l_StyleKey_0.SecondaryMain] else l_Stylizer_1[l_StyleKey_0.MenuEntryHighlight], 
                BackgroundTransparency = (v28 or v29) and 0 or 1, 
                AutoButtonColor = false, 
                Text = "", 
                [v2.Event.Activated] = function()
                    l_props_0.OnSelected(v22);
                end, 
                children = {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 5), 
                        PaddingRight = UDim.new(0, 12)
                    }), 
                    Corner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 3)
                    }), 
                    Title = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = v16.rightAlignSizes[v22][1]:map(function(v33)
                            return UDim2.new(1, -v33.X - 5, 1, 0);
                        end)
                    }, {
                        Label = v2.createElement(l_TextLabel_0, {
                            Size = UDim2.fromScale(1, 1), 
                            Text = l_name_0, 
                            TextColor = if not not v21.altered and v21.altered.skipped then l_Stylizer_1[l_StyleKey_0.SubText] else nil, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd
                        }, {
                            Strikethrough = v2.createElement("Frame", {
                                Visible = not not v21.altered and v21.altered.skipped, 
                                BackgroundColor3 = l_Stylizer_1[l_StyleKey_0.SubText], 
                                BorderSizePixel = 0, 
                                Size = UDim2.new(1, 0, 0, 1), 
                                Position = UDim2.fromScale(0.5, 0.5), 
                                AnchorPoint = Vector2.new(0.5, 0.5)
                            })
                        })
                    }), 
                    RightAligned = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(0.5, 1), 
                        Position = UDim2.fromScale(0.5, 0)
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 5), 
                            [v2.Change.AbsoluteContentSize] = function(v34)
                                v16.rightAlignSizes[v22][2](v34.AbsoluteContentSize);
                            end
                        }), 
                        ElapsedMs = v2.createElement(l_TextLabel_0, {
                            Style = "SubText", 
                            Text = string.format("%.1f ms", l_elapsedMs_0), 
                            TextXAlignment = Enum.TextXAlignment.Right, 
                            TextColor = v32, 
                            Size = UDim2.fromScale(0, 1), 
                            AutomaticSize = Enum.AutomaticSize.X
                        })
                    })
                }
            };
        end
    });
end;
return v3.connect(function(v35, _)
    return {
        SelectedIndex = v35.selectedIndex, 
        SearchTerm = v35.searchTerm, 
        Events = v35.events
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v14)));
