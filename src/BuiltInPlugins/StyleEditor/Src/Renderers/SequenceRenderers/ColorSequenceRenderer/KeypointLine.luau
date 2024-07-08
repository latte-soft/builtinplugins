local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_joinTags_0 = require(l_Parent_0.Packages.Framework).Styling.joinTags;
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
return function(v4)
    return v1.createElement("Frame", {
        LayoutOrder = v4.LayoutOrder, 
        Position = v4.Position, 
        [v1.Tag] = l_joinTags_0("ColorSequenceLine", if not v4.Selected then nil else "Selected"), 
        [v1.Event.MouseEnter] = function()
            v4.OnHoverStart();
        end
    });
end;
