local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Enums.PropertyNameValidationError);
local _ = require(l_Parent_0.Src.Types);
local v3 = {
    [v1.DoesNotExist] = "PropertyNameErrorDoesNotExist", 
    [v1.DoesNotExistOnType] = "PropertyNameErrorDoesNotExistOnType", 
    [v1.AlreadyDefined] = "PropertyNameErrorAlreadyDefined", 
    Unknown = "ErrorUnknown"
};
return function(v4, v5, v6)
    if v5 == v1.None then
        return "";
    else
        return v4:getText("Label", v3[v5] or v3.Unknown, v6);
    end;
end;
