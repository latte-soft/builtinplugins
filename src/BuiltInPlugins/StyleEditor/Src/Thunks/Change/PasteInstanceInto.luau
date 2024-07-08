local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v2 = require(l_Parent_0.Src.Actions.Window.SelectItem);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v5)
    return function(v6, v7)
        local l_Instance_0 = v6:getState().Clipboard.Instance;
        if l_Instance_0 then
            assert(l_Instance_0 ~= nil, "expecting valid instance");
            local v9 = nil;
            v7.recordChange({
                Name = "StyleEditor/PasteInstanceInto", 
                DisplayName = "StyleEditor - Paste Instance", 
                DoChange = function()
                    v9 = l_Instance_0:Clone();
                    v9.Parent = v5;
                    return Enum.FinishRecordingOperation.Commit;
                end
            });
            if v9 then
                v6:dispatch(v2((v1.createItemId(v9))));
            end;
            return v9;
        else
            return nil;
        end;
    end;
end;
