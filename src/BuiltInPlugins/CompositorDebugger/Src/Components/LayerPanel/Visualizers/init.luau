local _ = require(script:FindFirstAncestor("CompositorDebugger").Src.Types);
local v1 = {};
local v2 = {
    Blend1D = require(script.Blend1D), 
    Blend2D = require(script.Blend2D), 
    BlendSpace = {
        Locomotion = require(script.Blend2D), 
        Scalar = require(script.Blend1D), 
        Directional = require(script.Blend2D)
    }
};
v1.getModule = function(v3)
    if not v3 or not v3.className then
        return nil;
    elseif v3.className == "BlendSpace" then
        if not v3.props then
            return nil;
        else
            return v2.BlendSpace[v3.props.blendSpaceType];
        end;
    else
        return v2[v3.className];
    end;
end;
return v1;
