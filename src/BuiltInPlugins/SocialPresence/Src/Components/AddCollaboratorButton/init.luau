local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialPresence");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_CrossPluginCommunication_0 = v2.Util.CrossPluginCommunication;
return function(v8)
    local v9 = v8.MockCrossPluginComm or l_CrossPluginCommunication_0.new("ManageCollaborators");
    local v10 = l_Analytics_0:use();
    return v1.createElement("TextButton", {
        [v1.Event.Activated] = function()
            v10:report("manageCollaboratorsPressed");
            v9:Fire("ToggleManageCollaborators");
        end, 
        [v1.Tag] = l_joinTags_0("Component-AddCollaboratorButton Button X-RowS X-Middle X-Center", not v8.IsTeamCreateOn and "X-Pad" or nil)
    }, {
        CollaboratorIcon = v1.createElement("ImageLabel"), 
        TextLabel = not v8.IsTeamCreateOn and v1.createElement("TextLabel", {
            Text = l_Localization_0.use():getText("Ribbon", "Collaborate")
        })
    });
end;
