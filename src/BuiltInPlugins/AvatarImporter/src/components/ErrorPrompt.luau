local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.src.Assets);
local v6 = require(l_Parent_0.src.Constants);
local v7 = require(l_Parent_0.src.components.CustomTextButton);
local v8 = require(l_Parent_0.src.utils.themeConfig);
local l_actions_0 = l_Parent_0.src.actions;
local v10 = require(l_actions_0.SetScreen);
local v11 = require(l_actions_0.ClosePlugin);
local l_Studio_0 = settings().Studio;
local v13 = v3.Component:extend("ErrorPrompt");
v13.render = function(v14)
    return v3.createElement("Frame", {
        Name = "ErrorPrompt", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground, Enum.StudioStyleGuideModifier.Default)
    }, {
        errorIcon = v3.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v5.ERROR_ICON, 
            Size = UDim2.new(0, 22, 0, 22), 
            Position = UDim2.new(0, 30, 0, 20)
        }), 
        errorTitle = v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v6.FONT, 
            Position = UDim2.new(0, 62, 0, 20), 
            Size = UDim2.new(1, -62, 0, 20), 
            Text = v14.props.name, 
            TextSize = v6.FONT_SIZE_TITLE, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ClipsDescendants = true, 
            TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default)
        }), 
        requirementsHeader = v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v6.FONT_BOLD, 
            Position = UDim2.new(0, 62, 0, 60), 
            Size = UDim2.new(0, 302, 0, v6.FONT_SIZE_MEDIUM), 
            Text = "The file failed to meet the import requirement(s):", 
            TextSize = v6.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default)
        }), 
        requirements = v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v6.FONT, 
            Position = UDim2.new(0, 62, 0, 86), 
            Size = UDim2.new(0, 302, 0, v6.FONT_SIZE_MEDIUM), 
            Text = v14.props.message, 
            TextSize = v6.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default)
        }), 
        bottomDescription = v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v6.FONT, 
            Position = UDim2.new(0, 62, 1, -149), 
            Size = UDim2.new(0, 210, 0, v6.FONT_SIZE_MEDIUM), 
            Text = "Please update the file and try again", 
            TextSize = v6.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default)
        }), 
        infoLink = v3.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Font = v6.FONT, 
            Position = UDim2.new(0, 62, 1, -123), 
            Size = UDim2.new(0, 210, 0, v6.FONT_SIZE_MEDIUM), 
            Text = "What are import requirements?", 
            TextSize = v6.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = v8({
                Light = Color3.fromRGB(0, 162, 255), 
                Dark = Color3.fromRGB(255, 255, 255)
            }), 
            [v3.Event.MouseButton1Click] = function()
                l_GuiService_0:OpenBrowserWindow(l_HttpRbxApiService_0:GetDocumentationUrl(v6.AVATAR_IMPORTER_DEVHUB));
            end
        }), 
        buttons = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, -64), 
            Size = UDim2.new(1, 0, 0, 34)
        }, {
            buttonsListLayout = v3.createElement("UIListLayout", {
                Padding = UDim.new(0, 21), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            cancelButton = v3.createElement(v7, {
                name = "CancelButton", 
                labelText = "Cancel", 
                layoutOrder = 0, 
                [v3.Event.MouseButton1Click] = v14.props.doClose
            }), 
            retryButton = v3.createElement(v7, {
                name = "RetryButton", 
                labelText = "Try Again", 
                layoutOrder = 1, 
                isMain = true, 
                [v3.Event.MouseButton1Click] = v14.props.doRetry
            })
        })
    });
end;
return v4.connect(function(v15)
    v15 = v15 or {};
    return {
        name = v15.error.name, 
        message = v15.error.message
    };
end, function(v16)
    return {
        doRetry = function()
            v16(v10(v6.SCREENS.AVATAR));
        end, 
        doClose = function()
            v16(v11());
        end
    };
end)(v13);
