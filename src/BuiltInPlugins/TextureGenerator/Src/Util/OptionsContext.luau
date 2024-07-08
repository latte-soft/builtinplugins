local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.createUnimplemented);
return (v1.createContext({
    promptText = "", 
    randomizeSeed = true, 
    seed = 0, 
    rotation = CFrame.new(), 
    smartUVUnwrap = false, 
    promptMasking = false, 
    validRotation = true, 
    validSeed = true, 
    setPromptText = v2("setPromptText"), 
    setRandomizeSeed = v2("setRandomizeSeed"), 
    setSeed = v2("setSeed"), 
    setRotation = v2("setRotation"), 
    setSmartUVUnwrap = v2("setSmartUVUnwrap"), 
    setPromptMasking = v2("setPromptMasking"), 
    setValidRotation = v2("setValidRotation"), 
    setValidSeed = v2("setValidSeed")
}));
