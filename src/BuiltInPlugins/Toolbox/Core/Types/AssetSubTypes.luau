local l_Packages_0 = script:FindFirstAncestor("Toolbox").Packages;
local _ = require(l_Packages_0.Framework);
local v2 = require(l_Packages_0.Dash);
return {
    Invalid = "Invalid", 
    Ad = "Ad", 
    MaterialPack = "MaterialPack", 
    Package = "Package", 
    contains = function(v3, v4)
        if v3 == nil then
            return false;
        else
            return v2.find(v3, function(v5)
                return v5 == v4;
            end) == v4;
        end;
    end
};
