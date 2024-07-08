local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Core.Util.Urls);
local v4 = require(l_script_FirstAncestor_0.Core.Util.LayoutOrderIterator);
local v5 = require(l_script_FirstAncestor_0.Core.Types.ThumbnailTypes);
local l_Pane_0 = v2.UI.Pane;
local l_TextLabel_0 = v2.UI.TextLabel;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
return function(v9)
    local v10 = v1.useMemo(function()
        if v9.CreatorType == Enum.CreatorType.Group then
            return v5.Icon.GroupIcon;
        else
            return v5.Icon.AvatarHeadShot;
        end;
    end, {
        v9.CreatorType
    });
    local v11 = l_Stylizer_0:use();
    local v12 = v4.new();
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = v9.LayoutOrder, 
        Spacing = v11.creatorLabel.spacingUnit
    }, {
        Thumbnail = v1.createElement("ImageLabel", {
            BackgroundColor3 = v11.creatorLabel.thumbnailBackgroundColor, 
            Image = v3.constructAssetThumbnailUrl(v9.CreatorId, 150, 150, v10), 
            LayoutOrder = v12:getNextOrder(), 
            Size = UDim2.fromOffset(v11.creatorLabel.textSize, v11.creatorLabel.textSize)
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = if v9.CreatorType == Enum.CreatorType.User then UDim.new(0.5, 0) else UDim.new(0, v11.creatorLabel.spacingUnit / 2)
            })
        }), 
        Name = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Font = v11.creatorLabel.font, 
            LayoutOrder = v12:getNextOrder(), 
            Text = v9.CreatorName, 
            TextColor = v11.creatorLabel.textColor, 
            TextSize = v11.creatorLabel.textSize
        })
    });
end;
