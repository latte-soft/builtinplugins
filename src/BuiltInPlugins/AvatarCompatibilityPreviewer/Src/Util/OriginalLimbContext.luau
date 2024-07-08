local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.createUnimplemented);
return (v1.createContext({
    isLimbOriginal = v2("isLimbOriginal"), 
    markLimbAsOriginal = v2("markLimbAsOriginal")
}));
