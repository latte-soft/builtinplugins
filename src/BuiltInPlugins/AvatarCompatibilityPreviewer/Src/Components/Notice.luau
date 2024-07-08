local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_UI_0 = v1.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v8)
    local v9 = l_Stylizer_0:use("Notice");
    return v2.createElement(l_Pane_0, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor = v9.BackgroundColor, 
        Padding = v9.Padding
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = v9.CornerRadius
        }), 
        NoticeText = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v8.Text, 
            TextColor = v9.TextColor, 
            TextSize = v9.TextSize, 
            TextWrapped = true
        })
    });
end;
