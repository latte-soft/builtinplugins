local v0 = require(script.Parent.Parent.Actions.CollaboratorSearchActions);
return function(v1, v2)
    return function(v3, v4)
        local v5 = v3:getState();
        local l_gamePermissionsController_0 = v4.gamePermissionsController;
        v3:dispatch(v0.SearchTextChanged(v1));
        if v1 ~= "" and v2 then
            if not v5.CollaboratorSearch.CachedSearchResults[v1] then
                v3:dispatch(v0.LoadingWebResults(v1));
                spawn(function()
                    local l_status_0, l_result_0 = pcall(function()
                        return l_gamePermissionsController_0:search(v1);
                    end);
                    v3:dispatch(v0.LoadedWebResults(l_status_0, v1, l_result_0));
                end);
            end;
            return ;
        else
            return ;
        end;
    end;
end;
