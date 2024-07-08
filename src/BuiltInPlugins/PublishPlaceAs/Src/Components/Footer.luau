local v0 = Vector2.new(512, 256);
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Actions.SetScreen);
local v7 = require(l_Parent_0.Src.Components.ButtonBar);
local v8 = require(l_Parent_0.Src.Util.Analytics);
local v9 = v2.PureComponent:extend("Footer");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_MainButton_0 = l_props_0.MainButton;
    local l_NextScreen_0 = l_props_0.NextScreen;
    local l_NextScreenText_0 = l_props_0.NextScreenText;
    local l_OpenNextScreen_0 = l_props_0.OpenNextScreen;
    local l_IsPublish_0 = l_props_0.IsPublish;
    local v20 = l_props_0[v2.Children];
    local l_createElement_0 = v2.createElement;
    local v22 = "Frame";
    local v23 = {
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.FOOTER_HEIGHT), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 0, 1, 0), 
        ZIndex = 2
    };
    local v25 = {
        Gradient = v2.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 0, 3), 
            AnchorPoint = Vector2.new(0, 1), 
            Image = "rbxasset://textures/gradient.png", 
            ImageRectSize = v0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Stylizer_0.footer.gradient, 
            ImageTransparency = 0.9, 
            ZIndex = 1
        }), 
        SaveSettings = v2.createElement(v7, {
            ZIndex = 2, 
            Buttons = {
                {
                    Name = "Cancel", 
                    Active = true, 
                    Value = false
                }, 
                {
                    Name = l_MainButton_0.Name, 
                    Default = true, 
                    Active = l_MainButton_0.Active, 
                    Value = true
                }
            }, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            buttonActivated = function(v24)
                if not v24 then
                    v8.reportSaveCancel(l_IsPublish_0);
                    l_OnClose_0();
                    return ;
                else
                    l_MainButton_0.OnActivated();
                    return ;
                end;
            end
        }, v20)
    };
    local v26 = false;
    if l_NextScreen_0 ~= nil then
        v26 = v2.createElement("TextButton", {
            Size = UDim2.new(0.15, 0, 0.5, 0), 
            Position = UDim2.new(0.13, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 3, 
            TextColor3 = l_Stylizer_0.defaultButton.ButtonColor, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = 20, 
            Font = l_Stylizer_0.footer.textbutton.font, 
            Text = l_Localization_0:getText("FooterButton", l_NextScreenText_0), 
            [v2.Event.Activated] = function()
                l_OpenNextScreen_0(l_NextScreen_0);
            end
        });
    end;
    v25.GotoNextScreen = v26;
    return l_createElement_0(v22, v23, v25);
end;
return v3.connect(nil, function(v27)
    return {
        OpenNextScreen = function(v28)
            v27(v6(v28));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v9)));
