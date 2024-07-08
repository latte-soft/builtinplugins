local v0 = {
    Asset = "rbxasset://textures/TagEditor/famfamfam.png", 
    Table = require(script.SpritesheetData)
};
v0.Lookup = function(v1)
    local v2 = v0.Table[v1] or v0.Table.computer_error;
    return {
        Image = v0.Asset, 
        ImageRectOffset = Vector2.new(v2[1], v2[2]), 
        ImageRectSize = Vector2.new(16, 16)
    };
end;
return v0;
