local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_UI_0 = v2.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Button_0 = l_UI_0.Button;
local l_TextService_0 = game:GetService("TextService");
local v12 = Vector2.new(1000, 1);
local l_FixSocialPresenceDropdown_0 = game:GetFastFlag("FixSocialPresenceDropdown");
return function()
    local l_CollaboratorsService_0 = game:GetService("CollaboratorsService");
    local v15 = l_Localization_0.use();
    local v16 = l_Stylizer_0:use();
    local v17, v18 = v1.useState(false);
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v16.footer.height), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        ZIndex = 2
    }, {
        Border = v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Thickness = 1, 
            Color = v16.footer.borderColor
        }), 
        Button = v1.createElement(l_IconButton_0, {
            OnClick = function()
                v18(true);
            end, 
            LeftIcon = v16.footer.moreIcon, 
            IconColor = v16.footer.iconColor, 
            Size = UDim2.fromOffset(16, 16), 
            Style = "IconOnly", 
            Position = UDim2.new(1, -4, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5)
        }), 
        Menu = v1.createElement("Frame", {
            Position = not not l_FixSocialPresenceDropdown_0 and UDim2.new(1, -20, 1, -16) or UDim2.new(1, -4, 0.5, 0), 
            AnchorPoint = not not l_FixSocialPresenceDropdown_0 and Vector2.new(1, 0) or Vector2.new(1, 0.5), 
            BackgroundTransparency = 1
        }, {
            v1.createElement(l_DropdownMenu_0, {
                Hide = not v17, 
                Items = {
                    v1.createElement(l_TextLabel_0, {
                        Text = v15:getText("Settings", "DisableTeamCreate"), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor = v16.footer.disableTeamCreateColor
                    }, {
                        Padding = v1.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 10)
                        })
                    })
                }, 
                OnItemActivated = function(_, v20)
                    if v20 == 1 then
                        l_CollaboratorsService_0:ToggleTeamCreate(false);
                    end;
                end, 
                OnRenderItem = function(v21, v22, v23, v24)
                    return v1.createElement(l_Button_0, {
                        LayoutOrder = v22, 
                        OnClick = v23, 
                        Size = UDim2.new(1, 0, 0, 32), 
                        StyleModifier = if not v24 then nil else l_StyleModifier_0.Hover
                    }, {
                        v21
                    });
                end, 
                OnFocusLost = function()
                    v18(false);
                end, 
                Style = {
                    Width = l_TextService_0:GetTextSize(v15:getText("Settings", "DisableTeamCreate"), 22, Enum.Font.SourceSans, v12).X, 
                    MaxHeight = not l_FixSocialPresenceDropdown_0 and 120 or 32, 
                    Offset = not not l_FixSocialPresenceDropdown_0 and Vector2.zero or Vector2.new(0, 12)
                }
            })
        })
    });
end;
