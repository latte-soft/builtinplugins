local l_Parent_0 = script.Parent.Parent.Parent;
local l_enumerate_0 = require(l_Parent_0.Packages.Framework).Util.enumerate;
local _ = require(l_Parent_0.Src.Types);
return (l_enumerate_0("PropertyNameValidationError", {
    "None", 
    "DoesNotExist", 
    "DoesNotExistOnType", 
    "AlreadyDefined"
}));
