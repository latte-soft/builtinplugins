local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.createUnimplemented);
return (v1.createContext({
    generations = {}, 
    updateGeneration = v2("updateGeneration"), 
    modelToGenerations = {}, 
    updateModelToGenerations = v2("updateModelToGenerations"), 
    selected = nil, 
    setSelected = v2("setSelected"), 
    quota = 0, 
    setQuota = v2("setQuota"), 
    total = 0, 
    setTotal = v2("setTotal")
}));
