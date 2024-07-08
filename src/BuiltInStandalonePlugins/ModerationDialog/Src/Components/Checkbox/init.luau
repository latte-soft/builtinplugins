local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_joinTags_0 = v2.Styling.joinTags;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v6)
    local v7 = l_Localization_0:use();
    local v8 = l_LayoutOrderIterator_0.new();
    return v1.createElement("Frame", {
        LayoutOrder = v6.LayoutOrder, 
        [v1.Tag] = "Component-Checkbox X-FitY"
    }, {
        CheckboxImage = v1.createElement("ImageButton", {
            LayoutOrder = v8:getNextOrder(), 
            [v1.Tag] = l_joinTags_0("X-Fit", not v6.Checked and "Unchecked" or "Checked"), 
            [v1.Event.Activated] = v6.OnChecked
        }), 
        IAgree = v1.createElement("TextButton", {
            Text = v7:getText("Agreement", "IAgree"), 
            LayoutOrder = v8:getNextOrder(), 
            [v1.Tag] = "X-FitY", 
            [v1.Event.Activated] = v6.OnChecked
        })
    });
end;
