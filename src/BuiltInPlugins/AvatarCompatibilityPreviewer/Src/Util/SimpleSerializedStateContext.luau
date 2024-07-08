local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.createUnimplemented);
return v1.createContext({
    setStage = v3("setStage"), 
    stage = "CheckBody", 
    setIsTextured = v3("setIsTextured"), 
    isTextured = true
});
