local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function()
    return v2.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Image = l_Stylizer_0:use("Background").Image, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = -1
    });
end;
