local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v3.ContextServices.Localization;
local l_TextLabel_0 = v3.UI.TextLabel;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
return function(v7)
    local v8 = v7.Size or UDim2.new(1, 0, 0, 20);
    local v9 = l_Localization_0:use();
    local v10 = l_LayoutOrderIterator_0.new();
    local l_PLACEHOLDER_ICON_URL_0 = v2.PLACEHOLDER_ICON_URL;
    if game.GameId and game.GameId ~= 0 then
        l_PLACEHOLDER_ICON_URL_0 = v2.GAME_ICON_URL:format(game.GameId);
    end;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v8, 
        LayoutOrder = v7.LayoutOrder
    }, {
        ListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 2), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        PlaceLabel = v1.createElement(l_TextLabel_0, {
            Text = v9:getText("Labels", "Place"), 
            Style = "Basic", 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 20), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = v10:getNextOrder()
        }), 
        SpacerPlace = v1.createElement("Frame", {
            LayoutOrder = v10:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 8), 
            BackgroundTransparency = 1
        }), 
        PlaceFrame = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 20, 0, 20), 
            LayoutOrder = v10:getNextOrder()
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 8)
            }), 
            GameIconImage = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = l_PLACEHOLDER_ICON_URL_0, 
                Size = UDim2.new(0, 25, 0, 25), 
                ImageTransparency = 0, 
                LayoutOrder = 0
            }, {
                Corner = v1.createElement("UICorner")
            }), 
            PlaceName = v1.createElement(l_TextLabel_0, {
                Text = v7.PlaceName, 
                Style = "Basic", 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Size = UDim2.new(1, -25, 0, 25), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            })
        })
    });
end;
