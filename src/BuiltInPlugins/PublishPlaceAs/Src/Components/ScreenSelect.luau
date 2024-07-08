local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Src.Resources.Constants);
local v4 = {
    [v3.SCREENS.CREATE_NEW_GAME] = require(l_Parent_0.Src.Components.ScreenCreateNewGame), 
    [v3.SCREENS.CHOOSE_GAME] = require(l_Parent_0.Src.Components.ScreenChooseGame), 
    [v3.SCREENS.CHOOSE_PLACE] = require(l_Parent_0.Src.Components.ScreenChoosePlace), 
    [v3.SCREENS.PUBLISH_IN_PROGRESS] = require(l_Parent_0.Src.Components.ScreenPublishInProgress), 
    [v3.SCREENS.PUBLISH_SUCCESSFUL] = require(l_Parent_0.Src.Components.ScreenPublishSuccessful), 
    [v3.SCREENS.PUBLISH_FAIL] = require(l_Parent_0.Src.Components.ScreenPublishFail)
};
for v5, _ in pairs(v3.SCREENS) do
    assert(v4[v5] ~= nil, string.format("ScreenSelect.lua does not handle screen %s", v5));
end;
return v2.connect(function(v7, _)
    return {
        Screen = v7.Screen.screen
    };
end)(function(v9)
    return v1.createElement(v4[v9.Screen], {
        OnClose = v9.OnClose, 
        IsPublish = v9.IsPublish, 
        CloseMode = v9.CloseMode
    });
end);
