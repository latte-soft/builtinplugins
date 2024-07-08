local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.src.Globals);
local v2 = require(l_Parent_0.src.Constants);
local v3 = require(l_Parent_0.src.actions.SetScreen);
local v4 = require(l_Parent_0.src.actions.SetError);
local v5 = require(l_Parent_0.src.actions.ClosePlugin);
local v6 = require(l_Parent_0.src.utils.getLinesFromStr);
local v7 = require(l_Parent_0.src.utils.setupImportedAvatar);
return function(v8)
    local v9 = v8 ~= v2.AVATAR_TYPE.CUSTOM;
    return function(v10)
        v10:dispatch(v3(v2.SCREENS.LOADING));
        local l_status_0, l_result_0 = pcall(function()
            return v1.plugin:ImportFbxRig(v9);
        end);
        if not l_status_0 then
            if l_result_0 == v2.ERROR_NO_FILE then
                v10:dispatch(v3(v2.SCREENS.AVATAR));
                return ;
            else
                local v13 = "<filename>";
                local l_l_result_0_0 = l_result_0;
                local v15 = v6(l_result_0);
                if v15[1] == "FBX Import Error(s):" and #v15 >= 3 then
                    v13 = v15[2];
                    for v16 = 3, #v15 do
                        v15[v16] = "- " .. v15[v16];
                    end;
                    l_l_result_0_0 = table.concat(v15, "\n", 3);
                end;
                v10:dispatch(v4(v13, l_l_result_0_0));
                v10:dispatch(v3(v2.SCREENS.ERROR));
                return ;
            end;
        else
            v7(l_result_0, v8);
            v10:dispatch(v5(true));
            return ;
        end;
    end;
end;
