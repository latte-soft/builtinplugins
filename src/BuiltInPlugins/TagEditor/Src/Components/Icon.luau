local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Emoji);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_prioritize_0 = v3.Util.prioritize;
local v14 = require(l_Parent_0.Src.FamFamFam);
local v15 = v2.PureComponent:extend("Icon");
v15.render = function(v16)
    local l_props_0 = v16.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local v19 = nil;
    if l_props_0.Name then
        if not l_props_0.Name:find("^rbxassetid://") and not l_props_0.Name:find("^rbxasset://") then
            if not l_props_0.Name:find("emoji:") then
                local v20 = v14.Lookup(l_props_0.Name) or v14.Lookup("computer_error");
                v19 = v2.createElement(l_Image_0, {
                    Size = UDim2.fromScale(1, 1), 
                    Image = v20.Image, 
                    Style = {
                        ImageRectSize = v20.ImageRectSize - Vector2.new(0.5, 0.5), 
                        ImageRectOffset = v20.ImageRectOffset + Vector2.new(0.25, 0.25)
                    }
                });
            else
                local _, v22 = l_props_0.Name:find("emoji:");
                local v23 = l_props_0.Name:sub(v22 + 1, -1);
                local v24 = v4.getNamedEmoji(v23);
                if v24 or v23:match("^[a-zA-Z%-_]+$") then
                    if not v24 then
                        v24 = "\226\157\140";
                    end;
                else
                    v24 = v23;
                end;
                v19 = v2.createElement(l_TextLabel_0, {
                    TextSize = l_Stylizer_1.TextSize, 
                    Text = v24, 
                    Size = l_Stylizer_1.Size
                });
            end;
        else
            v19 = v2.createElement(l_Image_0, {
                Size = UDim2.fromScale(1, 1), 
                Image = l_props_0.Name, 
                ImageColor3 = if not l_props_0.Name:find("^rbxasset://") then nil else l_Stylizer_1.IconColor
            });
        end;
    end;
    return v2.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_0.LayoutOrder, 
        OnClick = l_props_0.OnClick, 
        Padding = l_Stylizer_1.Padding, 
        Position = l_props_0.Position, 
        Size = l_prioritize_0(l_props_0.Size, l_Stylizer_1.Size), 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        [v2.Event.MouseEnter] = l_props_0.OnMouseEnter, 
        [v2.Event.MouseLeave] = l_props_0.OnMouseLeave
    }, {
        ChildDecoration = v19
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Stylizer = l_Stylizer_0
})(v15));
