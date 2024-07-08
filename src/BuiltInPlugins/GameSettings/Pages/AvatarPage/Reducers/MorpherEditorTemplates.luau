local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Cryo);
local v3 = require(l_Parent_1.Packages.Rodux);
local v4 = require(l_Parent_0.Util.UtilityFunctionsTable);
local v5 = {
    templates = {}
};
return v3.createReducer(v5, {
    ResetStore = function(_, _)
        return v5;
    end, 
    TemplatesAdd = function(v8, v9)
        return v2.Dictionary.join(v8, {
            templates = v9.templatesArrayToAdd
        });
    end, 
    TemplatesClobberTemplate = function(v10, v11)
        return v2.Dictionary.join(v10, {
            templates = v4.immutableSetExistingDictionaryEntry(v10.templates, v11.templateToClobber, v11.newTemplateModel)
        });
    end
});
