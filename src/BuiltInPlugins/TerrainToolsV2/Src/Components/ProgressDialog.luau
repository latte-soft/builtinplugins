local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Components.ProgressWidget);
local l_CoreGui_0 = game:GetService("CoreGui");
return function(v5)
    return v1.createElement(v1.Portal, {
        target = l_CoreGui_0
    }, {
        ProgressDialog = v1.createElement("ScreenGui", {
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            ProgressWidget = v1.createElement(v3, (v2.Dictionary.join({
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 0)
            }, v5)))
        })
    });
end;
