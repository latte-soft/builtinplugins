local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v1.UI;
local l_Container_0 = l_UI_0.Container;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local l_Box_0 = l_UI_0.Box;
local l_TextLabel_0 = l_UI_0.TextLabel;
local function v13(v12)
    return v2.createElement(l_Button_0, {
        LayoutOrder = v12.LayoutOrder, 
        Size = UDim2.new(0, 96, 0, 28), 
        Text = v12.Text, 
        Style = v12.Style, 
        OnClick = v12.OnClick
    }, {
        HoverArea = v2.createElement(l_HoverArea_0, {
            Cursor = "PointingHand"
        })
    });
end;
local v14 = v2.PureComponent:extend("ProgressWidget");
v14.render = function(v15)
    local l_props_0 = v15.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Position_0 = l_props_0.Position;
    local v20 = l_props_0.Title or "";
    local l_SubText_0 = l_props_0.SubText;
    local v22 = l_SubText_0 and #l_SubText_0 > 0;
    local v23 = l_props_0.Progress or 0;
    local l_IsPaused_0 = l_props_0.IsPaused;
    local l_OnPauseButtonClicked_0 = l_props_0.OnPauseButtonClicked;
    local l_OnCancelButtonClicked_0 = l_props_0.OnCancelButtonClicked;
    local v27 = l_OnPauseButtonClicked_0 ~= nil;
    local v28 = l_OnCancelButtonClicked_0 ~= nil;
    local v29 = v27 or v28;
    return v2.createElement(l_Container_0, {
        AnchorPoint = l_AnchorPoint_0, 
        Position = l_Position_0, 
        Size = UDim2.new(0, 406, 0, (77 + (not v22 and 0 or 27)) + (not v29 and 0 or 48)), 
        Background = l_Box_0
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 20), 
            PaddingLeft = UDim.new(0, 20), 
            PaddingRight = UDim.new(0, 20), 
            PaddingBottom = UDim.new(0, 20)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8)
        }), 
        Title = v2.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 19), 
            Text = v20, 
            Font = Enum.Font.SourceSansBold, 
            TextSize = 20, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        LoadingBarContainer = v2.createElement(l_Container_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 10)
        }, {
            LoadingBar = v2.createElement(l_LoadingBar_0, {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, 6), 
                Progress = v23
            })
        }), 
        SubText = v22 and v2.createElement(l_TextLabel_0, {
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, 19), 
            Text = l_SubText_0, 
            TextSize = 20, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        ButtonRow = v29 and v2.createElement(l_Container_0, {
            LayoutOrder = 4, 
            Size = UDim2.new(1, 0, 0, 40)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 8), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            PauseButton = v27 and v2.createElement(v13, {
                LayoutOrder = 1, 
                Text = l_Localization_0:getText("Action", not l_IsPaused_0 and "Pause" or "Resume"), 
                Style = "RoundPrimary", 
                OnClick = l_OnPauseButtonClicked_0
            }), 
            CancelButton = v28 and v2.createElement(v13, {
                LayoutOrder = 2, 
                Text = l_Localization_0:getText("Action", "Cancel"), 
                Style = "RoundPrimary", 
                OnClick = l_OnCancelButtonClicked_0
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v14));
