local l_STUDIOAUTO1302_0 = game:GetFastFlag("STUDIOAUTO1302");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v3.ContextServices.withContext;
local l_Stylizer_0 = v3.Style.Stylizer;
local v6 = require(l_Parent_0.Src.Components.TutorialComponents.MyJiraTicket);
local v7 = v2.PureComponent:extend("Aggregator");
v7.render = function(_)
    return v2.createElement(v2.Fragment, {}, {
        BootcampComponent = not not l_STUDIOAUTO1302_0 and v2.createElement(v6) or nil
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v7));
