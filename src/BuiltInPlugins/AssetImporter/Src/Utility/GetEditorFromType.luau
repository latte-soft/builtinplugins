local l_Types_0 = script:FindFirstAncestor("AssetImporter").Src.Components.Properties.Types;
local v1 = {
    boolean = require(l_Types_0.BooleanProperty), 
    userdata = require(l_Types_0.EnumProperty), 
    number = require(l_Types_0.NumberProperty), 
    string = require(l_Types_0.StringProperty), 
    vector = require(l_Types_0.VectorProperty)
};
return function(v2)
    local v3 = v1[type(v2)];
    assert(v3, table.concat({
        "Unsupported property type", 
        (type(v2))
    }));
    return v3;
end;
