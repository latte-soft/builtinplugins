local v0 = require(script.Parent.Parent.Util.StateModelTemplate);
local v2 = {
    getStateModelTemplate = function(v1)
        return ((v1.StateTemplates and v1.StateTemplates.templates) and v1.template) and v1.StateTemplates.templates[v1.template];
    end
};
v2.getStateModelTemplateCopy = function(v3)
    return v0.makeCopy(v2.getStateModelTemplate(v3));
end;
return v2;
