local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_Button_0 = l_UI_0.Button;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v5 = require(script.Parent.animationFunctions);
local v6 = v1.PureComponent:extend("animationCatalogUIComponent");
v6.init = function(v7)
    v7.state = {
        items = {
            ["Rthro-Walk"] = 10921269718, 
            ["Rthro-Run"] = 10921261968, 
            ["Rthro-Climb"] = 10921257536, 
            ["Rthro-Jump"] = 10921263860, 
            ["Rthro-Fall"] = 10921262864, 
            ["Rthro-Swim"] = 10921264784, 
            ["Rthro-Idle"] = 10921258489
        }
    };
end;
v6.render = function(v8)
    local l_items_0 = v8.state.items;
    local v10 = {};
    for v11, v12 in pairs(l_items_0) do
        v10[v11] = v1.createElement(l_Button_0, {
            Style = "Round", 
            Text = v11, 
            Size = UDim2.new(1, 0, 0, 30), 
            OnClick = function()
                v5.attachAnimation(v12);
            end
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    }, {
        v1.createElement(l_ScrollingFrame_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(0, 0, 0, #l_items_0 * 30)
        }, v10)
    });
end;
return v6;
