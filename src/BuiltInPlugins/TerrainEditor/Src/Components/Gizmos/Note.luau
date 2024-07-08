local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v1.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_CoreGui_0 = game:GetService("CoreGui");
return function(v11)
    local v12 = l_Localization_0:use();
    local v13 = l_Stylizer_0:use("Note");
    local l_Key_0 = v11.Key;
    return v2.createPortal({
        Note = v3.createElement("ScreenGui", {}, {
            Frame = v3.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.X, 
                BackgroundColor = v13.Background, 
                Layout = Enum.FillDirection.Horizontal, 
                Spacing = v13.FramePadding, 
                Padding = v13.FramePadding, 
                Position = UDim2.new(0.5, 0, 0, v13.EdgePadding), 
                Size = UDim2.fromOffset(0, 25)
            }, {
                Key = v3.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundColor = v13.KeyBackground, 
                    Padding = v13.TextMargin, 
                    LayoutOrder = 1
                }, {
                    Corner = v3.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    Text = v3.createElement(l_TextLabel_0, {
                        Text = v12:getText("Note", (("%*Title"):format(l_Key_0)))
                    })
                }), 
                Apply = v3.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Padding = v13.TextMargin, 
                    LayoutOrder = 2
                }, {
                    Text = v3.createElement(l_TextLabel_0, {
                        Text = v12:getText("Note", (("%*Description"):format(l_Key_0)))
                    })
                })
            })
        })
    }, l_CoreGui_0);
end;
