local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(script.Parent.animationFunctions);
local v4 = require(script.Parent.animationCatalogUIComponent);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local v9 = v1.PureComponent:extend("avatarCheckUIComponent");
v9.init = function(v10)
    v10.state = {
        animLoop = true, 
        playSpeed = 1, 
        animIsRunning = false
    };
    v10.animationID = "";
    v10.attachAnimation = function()
        if v10.animationID ~= "" then
            v3.attachAnimation(v10.animationID);
        end;
    end;
end;
v9.render = function(v11)
    return v1.createElement(l_Pane_0, {
        BackgroundColor = Color3.fromRGB(100, 100, 100), 
        Padding = 10, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = 0
    }, {
        First = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0.2, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = Color3.fromRGB(100, 100, 100), 
            LayoutOrder = 1
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 10)
            }); 
            v1.createElement(l_Button_0, {
                OnClick = v11.attachAnimation, 
                Style = "RoundPrimary", 
                Size = UDim2.fromOffset(200, 30), 
                Text = "Attach animation from ID", 
                LayoutOrder = 1
            }), 
            v1.createElement(l_DEPRECATED_TextInput_0, {
                Size = UDim2.fromOffset(200, 30), 
                Style = "FilledRoundedBorder", 
                PlaceholderText = "Input animation ID here", 
                OnTextChanged = function(v12)
                    v11.animationID = v12;
                end, 
                LayoutOrder = 2
            })
        }), 
        Second = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0.6, 0), 
            Position = UDim2.new(0, 0, 0.2, 0), 
            BackgroundColor3 = Color3.fromRGB(100, 100, 100), 
            LayoutOrder = 2
        }, {
            v1.createElement(v4)
        })
    });
end;
return v9;
