local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
return {
    name = "Toolbox", 
    mapStory = require(l_Packages_0.Framework).UI.Stories.getStoryMiddleware(), 
    storyRoots = {
        l_Parent_0.Stories, 
        l_Parent_0.Core.Components
    }, 
    roact = require(l_Packages_0.Roact)
};
