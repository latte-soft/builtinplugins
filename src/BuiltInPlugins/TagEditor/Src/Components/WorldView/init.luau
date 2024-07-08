local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(script.WorldVisual);
local v4 = require(script.WorldProvider);
return (v2.connect(function(v5)
    return {
        enabled = v5.WorldView, 
        tags = v5.TagData
    };
end)(function(v6)
    if not v6.enabled then
        return nil;
    else
        return v1.createElement(v4, {}, {
            render = function(v7)
                return v1.createElement(v3, {
                    partsList = v7, 
                    tags = v6.tags
                });
            end
        });
    end;
end));
