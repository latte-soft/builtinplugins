local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Packages.Rodux).createReducer({
    AllLanguages = {}, 
    LocalesToLanguages = {}, 
    CanManageTranslation = nil, 
    CloudTableId = ""
}, {
    LoadLanguagesAndLocalesInfo = function(v2, v3)
        return v1.Dictionary.join(v2, {
            AllLanguages = v3.allLanguages, 
            LocalesToLanguages = v3.localesToLanguages
        });
    end, 
    LoadManageTranslationPermission = function(v4, v5)
        return v1.Dictionary.join(v4, {
            CanManageTranslation = v5.canManageTranslation
        });
    end, 
    SetCloudTableId = function(v6, v7)
        return v1.Dictionary.join(v6, {
            CloudTableId = v7.cloudTableId
        });
    end
});
