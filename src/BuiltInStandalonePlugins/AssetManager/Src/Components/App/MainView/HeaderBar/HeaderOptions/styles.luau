local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
local _ = require(l_script_FirstAncestor_0.Src.Util.Images);
return l_createStyleRule_0(".HeaderOptions", {}, {
    l_createStyleRule_0("> .ClearFilter", {
        Size = UDim2.fromOffset(20, 20)
    })
}, {
    FilterSize = UDim2.fromOffset(80, 32)
});
