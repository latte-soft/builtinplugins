local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetPageSaveState);
local v2 = require(l_Parent_0.Src.Util.SaveState);
return function(v3, v4)
    return function(v5, v6)
        local v7 = v4(v5, v6);
        v5:dispatch(v1(v3, v2.Saving));
        local v8 = 0;
        local v9 = false;
        for _, v11 in ipairs(v7) do
            coroutine.wrap(function()
                local l_status_0, l_result_0 = pcall(v11);
                if not (l_status_0 or v9) then
                    warn("Failed", l_result_0);
                    v9 = true;
                    v5:dispatch(v1(v3, v2.SaveFailed));
                end;
                v8 = v8 + 1;
                if not (not (v8 == #v7) or v9) then
                    v5:dispatch(v1(v3, v2.Saved));
                end;
            end)();
        end;
    end;
end;
