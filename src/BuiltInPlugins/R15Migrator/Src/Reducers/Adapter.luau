local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetAdapted);
local v5 = require(l_Actions_0.ResetAllAdapter);
local v6 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local function _()
    return {
        adapted = v6.GetAdapted()
    };
end;
return (v1.createReducer({
    adapted = v6.GetAdapted()
}, {
    [v4.name] = function(v8, v9)
        return v2.Dictionary.join(v8, {
            adapted = v9.adapted
        });
    end, 
    [v5.name] = function(v10)
        return v2.Dictionary.join(v10, {
            adapted = v6.GetAdapted()
        });
    end
}));
