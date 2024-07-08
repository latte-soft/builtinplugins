local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local function v3()
    return {
        scaleBoundaries = {
            boundaries = {}
        }
    };
end;
return v2.createReducer(v3(), {
    ResetStore = function(_, _)
        return (v3());
    end, 
    SettingsSaveScaleBoundaries = function(v6, v7)
        return v1.Dictionary.join(v6, {
            scaleBoundaries = v1.Dictionary.join(v6.scaleBoundaries, {
                boundaries = v7.rulesData.scales
            })
        });
    end
});
