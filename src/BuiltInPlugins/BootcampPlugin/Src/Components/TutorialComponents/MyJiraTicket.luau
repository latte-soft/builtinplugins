local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Button_0 = v2.UI.Button;
local v6 = v1.PureComponent:extend("MyJiraTicket");
local function v9()
    local v7 = Random.new();
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "My part";
    l_Part_0.Color = Color3.fromRGB(27, 143, 143);
    l_Part_0.Position = l_Part_0.Position + Vector3.new(v7:NextInteger(-10, 10), 0, v7:NextInteger(-10, 10));
    l_Part_0.Parent = workspace;
end;
v6.render = function(v10)
    return v1.createElement(l_Button_0, {
        Text = v10.props.Localization:getText("TutorialComponents", "MyJiraTicket"), 
        OnClick = v9
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v6));
