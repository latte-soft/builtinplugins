local v0 = UDim2.new(0, 9, 0, 8);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v2.PureComponent:extend("AddEventEntry");
v7.init = function(v8)
    v8.mouseEnter = function()
        if v8.props.Mouse then
            v8.props.Mouse:__pushCursor("PointingHand");
        end;
    end;
    v8.mouseLeave = function()
        if v8.props.Mouse then
            v8.props.Mouse:__popCursor();
        end;
    end;
end;
v7.render = function(v9)
    local l_Localization_0 = v9.props.Localization;
    local l_props_0 = v9.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Size_0 = l_props_0.Size;
    local l_PaddingLeft_0 = l_props_0.PaddingLeft;
    local l_PaddingRight_0 = l_props_0.PaddingRight;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    return v2.createElement("ImageButton", {
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        [v2.Event.Activated] = l_props_0.OnAddEvent, 
        [v2.Event.MouseEnter] = v9.mouseEnter, 
        [v2.Event.MouseLeave] = v9.mouseLeave
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = l_PaddingLeft_0, 
            PaddingRight = l_PaddingRight_0, 
            PaddingTop = UDim.new(0, 2), 
            PaddingBottom = UDim.new(0, 2)
        }), 
        Label = v2.createElement("TextLabel", {
            Size = UDim2.new(1, -v4.TRACKLIST_BUTTON_SIZE, 1, 0), 
            Text = l_Localization_0:getText("Title", "AddEvent"), 
            TextColor3 = l_dialogTheme_0.subTextColor, 
            Font = l_Stylizer_0.font, 
            TextSize = l_dialogTheme_0.textSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1
        }), 
        AddImage = v2.createElement("ImageLabel", {
            Size = v0, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0, -l_PaddingLeft_0.Offset / 2, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = l_dialogTheme_0.addImage, 
            ImageColor3 = l_dialogTheme_0.subTextColor
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v7));
