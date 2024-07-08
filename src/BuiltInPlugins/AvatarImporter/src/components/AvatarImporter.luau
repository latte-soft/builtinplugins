local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.src.Constants);
local v4 = require(l_Parent_0.src.components.AvatarPrompt);
local v5 = require(l_Parent_0.src.components.LoadingPrompt);
local v6 = require(l_Parent_0.src.components.ErrorPrompt);
local v7 = require(l_Parent_0.src.components.RedirectRigPrompt);
local function _(v8)
    return v8 == v3.SCREENS.AVATAR;
end;
local function _(v10)
    return v10 == v3.SCREENS.LOADING;
end;
local function _(v12)
    return v12 == v3.SCREENS.ERROR;
end;
local function _(v14)
    return v14 == v3.SCREENS.REDIRECT_RIG;
end;
local v16 = v1.Component:extend("AvatarImporter");
v16.render = function(v17)
    local l_screen_0 = v17.props.screen;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        AvatarPrompt = l_screen_0 == v3.SCREENS.AVATAR and v1.createElement(v4), 
        LoadingPrompt = l_screen_0 == v3.SCREENS.LOADING and v1.createElement(v5), 
        ErrorPrompt = l_screen_0 == v3.SCREENS.ERROR and v1.createElement(v6), 
        RedirectRigPrompt = l_screen_0 == v3.SCREENS.REDIRECT_RIG and v1.createElement(v7)
    });
end;
return v2.connect(function(v19)
    return {
        screen = (v19 or {}).plugin.screen
    };
end)(v16);
