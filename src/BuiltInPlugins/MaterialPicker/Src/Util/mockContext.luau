local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.MaterialFramework);
local l_ContextServices_0 = v1.ContextServices;
local l_TestHelpers_0 = v1.TestHelpers;
local l_Resources_0 = v2.Resources;
local v6 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock({
        libraries = {
            [l_Resources_0.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = l_Resources_0.SourceStrings, 
                translationResourceTable = l_Resources_0.LocalizedStrings
            }
        }
    }), 
    l_ContextServices_0.Store.new(require(l_Parent_0.Src.TestHelpers.createEmptyStore)()), 
    require(l_Parent_0.Src.Resources.createThemeTable)(true).createTheme(), 
    v2.Context.StudioServices.mock()
};
return function(v7)
    assert(type(v7) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v6, v7);
end;
