local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Src.Types);
return function(v3)
    return v1.createElement("TextButton", {
        Text = "", 
        ref = v3.ForwardRef, 
        [v1.Event.Activated] = v3.OnClick, 
        [v1.Tag] = "SequencePreviewButton X-Corner X-Stroke"
    }, {
        Gradient = v1.createElement("UIGradient", {
            Color = v3.Color, 
            Transparency = v3.Transparency
        })
    });
end;
