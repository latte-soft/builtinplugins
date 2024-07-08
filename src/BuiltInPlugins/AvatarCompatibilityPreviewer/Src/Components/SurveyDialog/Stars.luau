local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_UI_0 = v1.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
return function(v11)
    local v12 = l_Localization_0:use();
    local v13 = l_Stylizer_0:use("Stars");
    local v14, v15 = v2.useState({});
    local v16 = (next(v14) or v11.rating) or 0;
    local v17 = l_LayoutOrderIterator_0.new();
    local v18 = {};
    for v19 = 1, 5 do
        v18[("Star%*"):format(v19)] = v2.createElement(l_Pane_0, {
            LayoutOrder = v19, 
            Size = v13.StarSize + UDim2.fromOffset(v13.StarSpacing, 0), 
            OnClick = function()
                v11.setRating(v19);
            end, 
            [v2.Event.MouseEnter] = function()
                v15(function(v20)
                    local v21 = table.clone(v20);
                    v21[v19] = true;
                    return v21;
                end);
            end, 
            [v2.Event.MouseLeave] = function()
                v15(function(v22)
                    local v23 = table.clone(v22);
                    v23[v19] = nil;
                    return v23;
                end);
            end, 
            [v2.Tag] = ("data-testid=Star%*"):format(v19)
        }, {
            Image = v2.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Image = if v19 <= v16 then v13.StarFilled else v13.StarUnfilled, 
                ImageColor3 = v13.StarColor, 
                Position = UDim2.fromScale(0.5, 0), 
                Size = v13.StarSize
            })
        });
    end;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v11.layoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = v13.RatingSpacing
    }, {
        Stars = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = v17:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal
        }, v18), 
        Text = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v17:getNextOrder(), 
            Text = v16 == 0 and "" or v12:getText("Survey", (("StarsRating%*"):format(v16)))
        })
    });
end;
