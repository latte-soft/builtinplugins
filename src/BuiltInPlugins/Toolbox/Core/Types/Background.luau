local v0 = require(script.Parent.Parent.Parent.Core.Util.isCli);
local v1 = {
    BACKGROUNDS = {
        {
            name = "White", 
            color = "White"
        }, 
        {
            name = "Black", 
            color = "Black"
        }, 
        {
            name = "None", 
            color = "None"
        }
    }, 
    WHITE = 1, 
    BLACK = 2, 
    NONE = 3
};
v1.getBackgroundForStudioTheme = function()
    if not v0() then
        local l_Name_0 = settings().Studio.Theme.Name;
        if l_Name_0 == "Light" then
            return v1.WHITE;
        elseif l_Name_0 == "Dark" then
            return v1.NONE;
        else
            return v1.NONE;
        end;
    else
        return v1.NONE;
    end;
end;
return v1;
