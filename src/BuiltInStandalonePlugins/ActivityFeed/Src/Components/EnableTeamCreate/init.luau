local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Contexts.ActivityHistoryContext);
local l_Localization_0 = v2.ContextServices.Localization;
local v5 = v2.Util.LayoutOrderIterator.new();
local l_joinTags_0 = v2.Styling.joinTags;
return function(_)
    local v8 = v1.useContext(v3);
    local v9 = l_Localization_0:use();
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Column", "X-Middle", "X-Center", "Component-EnableTeamCreate")
    }, {
        Text = v1.createElement("TextLabel", {
            [v1.Tag] = l_joinTags_0("CX-Invisible", "X-Fit"), 
            LayoutOrder = v5:getNextOrder(), 
            Text = v9:getText("EnableTeamCreate", "SaveText")
        }), 
        Button = v1.createElement("TextButton", {
            [v1.Tag] = l_joinTags_0("X-Corner", "X-Fit"), 
            LayoutOrder = v5:getNextOrder(), 
            [v1.Event.Activated] = function()
                v8.showSaveOrPublishPlaceToRobloxFn();
            end, 
            Text = v9:getText("EnableTeamCreate", "SaveToRobloxButtonText")
        })
    });
end;
