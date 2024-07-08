local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.src.thunks.ImportWithoutSceneLoad);
local v2 = require(l_Parent_0.src.Constants);
local v3 = require(l_Parent_0.src.utils.getLinesFromStr);
local v4 = require(l_Parent_0.src.actions.SetScreen);
local v5 = require(l_Parent_0.src.actions.SetError);
local v6 = require(l_Parent_0.src.actions.SetOriginalAvatarType);
return function(v7)
    return function(v8)
        v8:dispatch(v4(v2.SCREENS.LOADING));
        v8:dispatch(v6(v7));
        local v9 = v7 ~= v2.AVATAR_TYPE.CUSTOM;
        local function v11(v10)
            if v9 or not v10 then
                if not v9 or v10 then
                    v8:dispatch(v1(v7));
                    return ;
                else
                    v8:dispatch(v4(v2.SCREENS.REDIRECT_RIG));
                    return ;
                end;
            else
                v8:dispatch(v4(v2.SCREENS.REDIRECT_RIG));
                return ;
            end;
        end;
        local _, l_result_0 = pcall(function()
            return game:GetService("AvatarImportService"):LoadRigAndDetectType(v11);
        end);
        if l_result_0 then
            local v14 = "<filename>";
            local l_l_result_0_0 = l_result_0;
            local v16 = v3(l_result_0);
            if v16[1] == "FBX Import Error(s):" and #v16 >= 3 then
                v14 = v16[2];
                for v17 = 3, #v16 do
                    v16[v17] = "- " .. v16[v17];
                end;
                l_l_result_0_0 = table.concat(v16, "\n", 3);
            end;
            v8:dispatch(v5(v14, l_l_result_0_0));
            v8:dispatch(v4(v2.SCREENS.ERROR));
        end;
    end;
end;
