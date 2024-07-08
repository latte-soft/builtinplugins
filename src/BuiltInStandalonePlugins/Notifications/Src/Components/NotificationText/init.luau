local v0 = require(script.Parent.Parent.Parent.Packages.React);
return v0.memo(function(v1)
    return v0.createElement("Frame", {
        Size = v1.Size, 
        LayoutOrder = v1.LayoutOrder, 
        [v0.Tag] = "Component-NotificationText X-Column"
    }, {
        Subject = v0.createElement("TextLabel", {
            Text = v1.Subject, 
            LayoutOrder = 1
        }), 
        Subline = if v1.Subline ~= nil and v1.Subline ~= "" then v0.createElement("TextLabel", {
            Text = v1.Subline, 
            LayoutOrder = 2
        }) else nil, 
        ElapsedTime = v0.createElement("TextLabel", {
            Text = v1.ElapsedTime, 
            LayoutOrder = 3
        })
    });
end);
