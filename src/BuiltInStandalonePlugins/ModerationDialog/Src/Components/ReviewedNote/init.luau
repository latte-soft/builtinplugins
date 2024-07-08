local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local _ = v2.Util;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v6)
    local v7 = l_Localization_0:use();
    local v8 = v7:getLocale();
    local v9 = l_LayoutOrderIterator_0.new();
    local v10 = DateTime.fromIsoDate(v6.ReviewDateTime);
    local v11 = v10 and v10:FormatLocalTime("lll", v8);
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-ReviewedNote X-FitY", 
        LayoutOrder = v6.LayoutOrder
    }, {
        ReviewedDateTime = v11 and v1.createElement("TextLabel", {
            Text = v7:getText("ReviewedNote", "ReviewedDateTime1", {
                dateTime = v11
            }), 
            LayoutOrder = v9:getNextOrder(), 
            [v1.Tag] = "X-FitY"
        }), 
        ModeratorNote = v1.createElement("TextLabel", {
            Text = v7:getText("ReviewedNote", "ModeratorNote1", {
                note = v6.ModeratorNote
            }), 
            LayoutOrder = v9:getNextOrder(), 
            [v1.Tag] = "X-FitY"
        })
    });
end;
