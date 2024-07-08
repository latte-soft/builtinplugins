local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Actions.SetCurrentSettings);
return function()
    return function(v3, v4)
        local v5 = v3:getState();
        local l_gameId_0 = v5.Metadata.gameId;
        local l_devProductsCursor_0 = v5.Settings.Current.devProductsCursor;
        if l_devProductsCursor_0 == nil then
            return ;
        else
            local v8, v9 = v4.monetizationController:getDeveloperProducts(l_gameId_0, l_devProductsCursor_0);
            v3:dispatch(v2((v1.Dictionary.join(v5.Settings.Current, {
                devProductsCursor = v9, 
                developerProducts = v1.Dictionary.join(not not v5.Settings.Current.developerProducts and v5.Settings.Current.developerProducts or {}, v8)
            }))));
            return ;
        end;
    end;
end;
