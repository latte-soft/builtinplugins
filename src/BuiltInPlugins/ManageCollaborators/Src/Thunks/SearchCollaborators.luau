local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.CollaboratorSearchActions);
local v2 = require(l_Parent_0.Src.Selectors.IsGame17Plus);
return function(v3, v4)
    return function(v5, v6)
        local v7 = v5:getState();
        local l_gamePermissionsController_0 = v6.gamePermissionsController;
        v5:dispatch(v1.SearchTextChanged(v3));
        if v3 ~= "" and v4 then
            if not v7.CollaboratorSearch.CachedSearchResults[v3] then
                v5:dispatch(v1.LoadWebResults(v3));
                spawn(function()
                    local l_status_0, l_result_0 = pcall(function()
                        return l_gamePermissionsController_0:search(v3, v2(v7));
                    end);
                    v5:dispatch(v1.LoadedWebResults(l_status_0, v3, l_result_0));
                end);
            end;
            return ;
        else
            return ;
        end;
    end;
end;
