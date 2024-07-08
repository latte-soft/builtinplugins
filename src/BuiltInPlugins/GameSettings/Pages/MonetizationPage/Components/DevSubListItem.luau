local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v5 = require(l_Parent_1.Util.numberWithCommas);
local v6 = require(script.Parent.DevSubListItemText);
local v7 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v7.Util;
local l_FitTextLabel_0 = l_Util_0.FitFrame.FitTextLabel;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_HoverArea_0 = v7.UI.HoverArea;
local v14 = v2.Component:extend("DeveloperSubscriptionListItem");
v14.render = function(v15)
    local l_Height_0 = v15.props.Height;
    local l_LayoutOrder_0 = v15.props.LayoutOrder;
    local l_Name_0 = v15.props.Name;
    local l_Subscribers_0 = v15.props.Subscribers;
    local l_Id_0 = v15.props.Id;
    local l_CreationDate_0 = v15.props.CreationDate;
    local l_OnEditButtonActivated_0 = v15.props.OnEditButtonActivated;
    local l_Stylizer_0 = v15.props.Stylizer;
    local l_Localization_0 = v15.props.Localization;
    local v25 = l_LayoutOrderIterator_0.new();
    return v2.createElement("ImageLabel", {
        Size = UDim2.new(1, 0, 0, l_Height_0), 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1, 
        Image = v4.ROUNDED_BACKGROUND_IMAGE, 
        ImageTransparency = 0, 
        ImageColor3 = l_Stylizer_0.table.item.background, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v4.ROUNDED_FRAME_SLICE
    }, {
        DetailsFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 24)
            }), 
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            IdText = v2.createElement(v6, {
                Size = UDim2.new(0.25, 0, 1, 0), 
                Text = l_Id_0 ~= -1 and l_Id_0 or l_Localization_0:getText("Monetization", "UnsavedDevProduct"), 
                LayoutOrder = v25:getNextOrder(), 
                Alignment = Enum.TextXAlignment.Left
            }), 
            NameText = v2.createElement(v6, {
                Size = UDim2.new(0.25, 0, 1, 0), 
                Text = l_Name_0, 
                LayoutOrder = v25:getNextOrder(), 
                Alignment = Enum.TextXAlignment.Left
            }), 
            SubscribersText = v2.createElement(v6, {
                Size = UDim2.new(0.2, 0, 1, 0), 
                Text = v5(l_Subscribers_0), 
                LayoutOrder = v25:getNextOrder(), 
                Alignment = Enum.TextXAlignment.Left
            }), 
            CreationDateText = v2.createElement(v6, {
                Size = UDim2.new(0.2, 0, 1, 0), 
                Text = l_CreationDate_0:sub(0, 10), 
                LayoutOrder = v25:getNextOrder(), 
                Alignment = Enum.TextXAlignment.Left
            }), 
            EditFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.1, 0, 1, 0), 
                LayoutOrder = v25:getNextOrder()
            }, {
                Button = v2.createElement("ImageButton", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, l_Stylizer_0.table.menu.buttonSize, 0, l_Stylizer_0.table.menu.buttonSize), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Position = UDim2.new(1, 0, 0.5, 0), 
                    [v2.Event.Activated] = l_OnEditButtonActivated_0
                }, {
                    Dots = v2.createElement(l_FitTextLabel_0, v3.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Text = "...", 
                        Font = Enum.Font.SourceSansBold, 
                        BackgroundTransparency = 1, 
                        width = l_Stylizer_0.table.menu.buttonSize
                    })); 
                    v2.createElement(l_HoverArea_0, {
                        Cursor = "PointingHand"
                    })
                })
            })
        }), 
        ErrorIcon = v15.props.HasError and v2.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Image = v4.ERROR_IMAGE, 
            Size = UDim2.new(0, 16, 0, 16), 
            Position = UDim2.new(1, -16, 0, 16), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v14));
