local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
return (v1.createReducer({
    ExampleCount = 0, 
    ExampleString = ""
}, {
    [require(l_script_FirstAncestor_0.Src.Actions.ExampleIncrementCount).name] = function(v3, v4)
        return l_join_0(v3, {
            ExampleCount = v3.ExampleCount + 1, 
            ExampleString = v4.something
        });
    end
}));
