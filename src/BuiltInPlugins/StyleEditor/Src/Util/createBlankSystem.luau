local v0 = require(script.Parent.Parent.Parent.Packages.Framework);
local l_createStyleRule_0 = v0.Styling.createStyleRule;
local l_createStyleSheet_0 = v0.Styling.createStyleSheet;
return function()
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "Design";
    l_createStyleSheet_0("Design", {
        l_createStyleRule_0("Frame"), 
        l_createStyleRule_0("ScrollingFrame"), 
        l_createStyleRule_0("TextLabel"), 
        l_createStyleRule_0("TextButton"), 
        l_createStyleRule_0("TextBox"), 
        l_createStyleRule_0("ImageButton"), 
        l_createStyleRule_0("ImageLabel")
    }, {
        StyleCategory = "Designs"
    }).Parent = l_Folder_0;
    return l_Folder_0;
end;
