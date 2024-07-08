local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.AssertType);
return require(script.Parent.Action)(script.Name, function(v3)
    v2.assertNullableType(v3, "string", "SetChoosePlaceQuery arg");
    return {
        placeInfo = {
            queryState = v3
        }
    };
end);
