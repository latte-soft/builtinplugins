local v0 = require(script.Parent.Parent.Parent.Packages.React);
local v1 = v0.PureComponent:extend("Tabs");
local v2 = require(script.Parent.importUIComponent);
local v3 = require(script.Parent.avatarCheckUIComponent);
v1.init = function(v4)
    v4.state = {
        currentTab = "Tab1"
    };
end;
v1.render = function(v5)
    return v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Tabs = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 30), 
            BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        }, {
            Tab1 = v0.createElement("TextButton", {
                Size = UDim2.new(0.5, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Text = "Import", 
                Font = Enum.Font.SourceSans, 
                TextSize = 18, 
                BackgroundColor3 = Color3.fromRGB(150, 150, 150), 
                BorderSizePixel = 0, 
                [v0.Event.Activated] = function()
                    v5:setState({
                        currentTab = "Tab1"
                    });
                end
            }), 
            Tab2 = v0.createElement("TextButton", {
                Size = UDim2.new(0.5, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                Text = "Check", 
                Font = Enum.Font.SourceSans, 
                TextSize = 18, 
                BackgroundColor3 = Color3.fromRGB(150, 150, 150), 
                BorderSizePixel = 0, 
                [v0.Event.Activated] = function()
                    v5:setState({
                        currentTab = "Tab2"
                    });
                end
            })
        }), 
        Frame = v0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -30), 
            Position = UDim2.new(0, 0, 0, 30), 
            BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        }, {
            Content = v5.state.currentTab == "Tab1" and v0.createElement(v2) or v0.createElement(v3)
        })
    });
end;
return v1;
