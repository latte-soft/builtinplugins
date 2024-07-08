local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("HttpRbxApiService");
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.src.Assets);
local v5 = require(l_Parent_0.src.components.AvatarButton);
local v6 = require(l_Parent_0.src.Constants);
local v7 = require(l_Parent_0.src.utils.themeConfig);
local v8 = require(l_Parent_0.src.utils.getTextWidth);
local v9 = require(l_Parent_0.src.flags.getFFlagShowAvatarImportDeprecation);
local v10 = require(l_Parent_0.src.flags.getFFlagShowAvatarImportDeprecationWithRedirect);
local v11 = require(l_Parent_0.src.flags.getFStringAvatarImportDeprecationMessage);
local v12 = require(l_Parent_0.src.flags.getFStringAvatarImportDevForumLink);
local l_Studio_0 = settings().Studio;
local v14 = v3.Component:extend("AvatarPrompt");
v14.init = function(v15)
    v15.openDevForum = function()
        l_GuiService_0:OpenBrowserWindow(v12());
    end;
end;
v14.render = function(v16)
    local v17 = 0;
    local v18 = nil;
    if not v10() then
        if v9() then
            v17 = 28;
            v18 = v3.createElement("TextLabel", {
                BackgroundColor3 = v6.WARNING_COLOR, 
                BorderSizePixel = 0, 
                Font = v6.FONT, 
                Name = "DeprecationBanner", 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 0, 28), 
                Text = v11(), 
                TextSize = v6.FONT_SIZE_LARGE, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextColor3 = v6.WARNING_TEXT_COLOR
            });
        end;
    else
        v17 = 28;
        v18 = v3.createElement("TextButton", {
            BackgroundColor3 = v6.WARNING_COLOR, 
            BorderSizePixel = 0, 
            Font = v6.FONT, 
            Name = "DeprecationBanner", 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, 28), 
            Text = ("%* %*"):format(v11(), v6.CLICK_HERE), 
            TextSize = v6.FONT_SIZE_LARGE, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = v6.WARNING_TEXT_COLOR, 
            [v3.Event.Activated] = v16.openDevForum
        });
    end;
    return v3.createElement("Frame", {
        Name = "AvatarPrompt", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground, Enum.StudioStyleGuideModifier.Default)
    }, {
        content = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Name = "Content", 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            deprecationBanner = v18, 
            topDescription = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v6.FONT, 
                Name = "TopDescription", 
                Position = UDim2.new(0, 0, 0, 20 + v17), 
                Size = UDim2.new(1, 0, 0, 18), 
                Text = "Choose the Avatar type you are going to import:", 
                TextSize = v6.FONT_SIZE_LARGE, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default)
            }), 
            buttons = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Name = "Buttons", 
                Position = UDim2.new(0, v6.BUTTON_SIDE_PADDING, 0, v6.BUTTON_TOP_PADDING + v17), 
                Size = UDim2.new(1, -v6.BUTTON_SIDE_PADDING * 2, 0, v6.BUTTON_HEIGHT)
            }, {
                buttonsListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, v6.BUTTON_CENTER_PADDING), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                rthroButton = v3.createElement(v5, {
                    name = "Rthro", 
                    avatarType = v6.AVATAR_TYPE.RTHRO, 
                    iconOptions = v4.RTHRO, 
                    contextInfo = v6.RTHRO_INFO, 
                    layoutOrder = 0
                }), 
                rthroNarrowButton = v3.createElement(v5, {
                    name = "Rthro Narrow", 
                    avatarType = v6.AVATAR_TYPE.RTHRO_SLENDER, 
                    iconOptions = v4.RTHRO_NARROW, 
                    contextInfo = v6.RTHRO_SLENDER_INFO, 
                    layoutOrder = 1
                }), 
                r15Button = v3.createElement(v5, {
                    name = "R15", 
                    avatarType = v6.AVATAR_TYPE.R15, 
                    iconOptions = v4.R15, 
                    contextInfo = v6.R15_INFO, 
                    layoutOrder = 2
                }), 
                customButton = v3.createElement(v5, {
                    name = "Custom", 
                    avatarType = v6.AVATAR_TYPE.CUSTOM, 
                    iconOptions = v4.CUSTOM, 
                    contextInfo = v6.CUSTOM_INFO, 
                    layoutOrder = 3
                })
            }), 
            bottomDescription = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, 307 + v17), 
                Size = UDim2.new(1, 0, 1, -(307 + v17))
            }, {
                bottomDescriptionListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                requirementsText = v3.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v6.FONT, 
                    LayoutOrder = 0, 
                    Size = UDim2.new(0, v8(v6.REQUIREMENTS_DESCRIPTION, v6.FONT_SIZE_SMALL, v6.FONT), 0, v6.FONT_SIZE_SMALL), 
                    Text = v6.REQUIREMENTS_DESCRIPTION, 
                    TextSize = v6.FONT_SIZE_SMALL, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextColor3 = v7({
                        Light = Color3.fromRGB(98, 98, 98), 
                        Dark = Color3.fromRGB(204, 204, 204)
                    })
                }), 
                infoLink = false
            })
        })
    });
end;
return v14;
