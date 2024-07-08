local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_UI_0 = v1.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_Plugin_0 = v1.ContextServices.Plugin;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v11)
    local v12 = l_Plugin_0:use():get();
    local v13 = l_Stylizer_0:use("PickTabMenu");
    local v14 = v3(false);
    return v2.createElement(l_Pane_0, {
        Position = v13.Position, 
        Size = v13.Size, 
        BackgroundColor3 = v11.BackgroundColor, 
        Padding = v13.Padding
    }, {
        Button = v2.createElement(l_Pane_0, {
            OnClick = function()
                l_showContextMenu_0(v12, v11.MenuTabs);
            end, 
            BackgroundColor3 = if not v14.enabled then v11.BackgroundColor else v11.BackgroundColorHover, 
            [v2.Event.MouseEnter] = v14.enable, 
            [v2.Event.MouseLeave] = v14.disable
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = v13.CornerRadius
            }), 
            DotsIcon = v2.createElement(l_Image_0, {
                Style = "PickTabMenu", 
                ImageColor3 = v13.ImageColor
            })
        })
    });
end;
