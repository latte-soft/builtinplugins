local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v5)
    local v6 = l_Localization_0:use();
    local v7 = l_LayoutOrderIterator_0.new();
    return v1.createElement("Frame", {
        LayoutOrder = v5.LayoutOrder, 
        [v1.Tag] = "Component-Reason X-FitY"
    }, {
        Reason = v1.createElement("TextLabel", {
            Text = v6:getText("Reason", "Reason1", {
                reason = v5.Reason
            }), 
            LayoutOrder = v7:getNextOrder(), 
            [v1.Tag] = "X-FitY"
        }), 
        OffensiveItem = v1.createElement("TextLabel", {
            Text = v6:getText("Reason", "OffensiveItem1", {
                offensiveItem = v5.OffensiveItem
            }), 
            LayoutOrder = v7:getNextOrder(), 
            [v1.Tag] = "X-FitY"
        })
    });
end;
