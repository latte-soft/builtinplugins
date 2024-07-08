local l_script_FirstAncestor_0 = script:FindFirstAncestor("SuperTemplate");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
return function(v3)
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-BasicExample X-Fit"
    }, {
        OptionalContent = if not v3.showContent then nil else v1.createElement("TextLabel", {
            Text = l_Localization_0:use():getText("BasicExample", "Text")
        })
    });
end;
