local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v3 = require(l_Parent_0.Src.Actions.SetCurrentSettings);
return function(v4)
    return function(v5, v6)
        local v7 = v5:getState();
        local l_gameId_0 = v7.Metadata.gameId;
        local l_placesIndex_0 = v7.Settings.Current.placesIndex;
        local l_placesPageCursor_0 = v7.Settings.Current.placesPageCursor;
        local l_placesController_0 = v6.placesController;
        if not (l_placesPageCursor_0 == "") or v4 then
            return l_Promise_0.resolve(l_placesController_0:getPlaces(l_gameId_0, l_placesPageCursor_0, l_placesIndex_0)):andThen(function(v12, v13, v14)
                if v12 then
                    v5:dispatch(v3((v1.Dictionary.join(v7.Settings.Current, {
                        placesPageCursor = v13, 
                        places = v1.Dictionary.join(not not v7.Settings.Current.places and v7.Settings.Current.places or {}, v12), 
                        placesIndex = v14
                    }))));
                end;
            end);
        else
            return ;
        end;
    end;
end;
