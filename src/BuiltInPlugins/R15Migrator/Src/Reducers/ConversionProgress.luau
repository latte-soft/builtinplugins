local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SuccessfullyPublished);
local v5 = require(l_Actions_0.SetExperienceData);
local function _()
    return {
        isSuccessfullyPublished = false, 
        experienceData = nil
    };
end;
return (v1.createReducer({
    isSuccessfullyPublished = false, 
    experienceData = nil
}, {
    [v4.name] = function(v7, v8)
        return v2.Dictionary.join(v7, {
            isSuccessfullyPublished = v8.isSuccessfullyPublished
        });
    end, 
    [v5.name] = function(v9, v10)
        return v2.Dictionary.join(v9, {
            experienceData = v10.experienceData or v2.None
        });
    end
}));
