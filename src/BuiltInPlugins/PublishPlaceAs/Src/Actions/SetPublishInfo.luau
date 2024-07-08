local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.AssertType);
local v2 = require(script.Parent.Action);
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
return v2(script.Name, function(v4)
    v1.assertNullableType(v4, "table", "SetPublishInfo arg");
    local v5 = v4 or {};
    local l_id_0 = v5.id;
    local l_name_0 = v5.name;
    local l_parentGameId_0 = v5.parentGameId;
    local l_parentGameName_0 = v5.parentGameName;
    local l_settings_0 = v5.settings;
    local l_failed_0 = v5.failed;
    local l_message_0 = v5.message;
    v1.assertType(l_id_0, "number", "SetPublishInfo.id");
    assert(l_failed_0 or game.GameId ~= 0, "Game ID should not be 0 if studio did not fail to publish a new game");
    v1.assertType(l_name_0, "string", "SetPublishInfo.name");
    v1.assertType(l_parentGameName_0, "string", "SetPublishInfo.parentGameName");
    v1.assertNullableType(l_parentGameId_0, "number", "SetPublishInfo.parentGameId");
    if not l_shouldShowDevPublishLocations_0() then
        v1.assertNullableType(l_settings_0, "table", "SetPublishInfo.settings { name : String, description : String, genre : String, playableDevices : table }");
    else
        v1.assertNullableType(l_settings_0, "table", "SetPublishInfo.settings { name : String, description : String, genre : String, playableDevices : table, OptInLocations : table }");
    end;
    if l_settings_0 ~= nil then
        v1.assertType(l_settings_0.name, "string", "settings.name");
        v1.assertType(l_settings_0.description, "string", "settings.description");
        v1.assertType(l_settings_0.genre, "string", "settings.genre");
        v1.assertType(l_settings_0.playableDevices, "table", "settings.playableDevices");
        if l_shouldShowDevPublishLocations_0() then
            v1.assertType(l_settings_0.OptInLocations, "table", "settings.OptInLocations");
        end;
        assert(next(l_settings_0.playableDevices) ~= nil, "Empty platform table");
    end;
    return {
        publishInfo = {
            id = l_id_0, 
            name = l_name_0, 
            parentGameId = l_parentGameId_0, 
            parentGameName = l_parentGameName_0, 
            settings = l_settings_0, 
            message = l_message_0
        }
    };
end);
