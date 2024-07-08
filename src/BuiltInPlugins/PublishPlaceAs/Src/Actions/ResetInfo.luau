local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.Constants);
local v2 = require(script.Parent.Action);
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
local l_RemoveVRToggleDialog2_0 = game:GetFastFlag("RemoveVRToggleDialog2");
local v5 = nil;
if l_shouldShowDevPublishLocations_0() then
    v5 = {};
end;
return v2(script.Name, function(v6, v7)
    local l_CREATE_NEW_GAME_0 = v1.SCREENS.CREATE_NEW_GAME;
    if v7 then
        l_CREATE_NEW_GAME_0 = v1.SCREENS.CHOOSE_GAME;
    end;
    return {
        placeInfo = {
            places = {}, 
            parentGame = {}
        }, 
        gameInfo = {
            games = {}
        }, 
        groupInfo = {
            groups = {}
        }, 
        current = {}, 
        changed = {
            name = v6, 
            description = "", 
            genre = v1.GENRE_IDS[1], 
            playableDevices = {
                Computer = true, 
                Phone = true, 
                Tablet = true, 
                VR = l_RemoveVRToggleDialog2_0 or nil
            }, 
            OptInLocations = v5
        }, 
        errors = {}, 
        publishInfo = {
            id = 0, 
            name = "", 
            parentGameName = "", 
            parentGameId = 0, 
            settings = {}
        }, 
        isPublishing = false, 
        screen = l_CREATE_NEW_GAME_0
    };
end);
