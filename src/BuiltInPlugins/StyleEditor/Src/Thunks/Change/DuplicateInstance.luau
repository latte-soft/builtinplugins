local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v2 = require(l_Parent_0.Src.Actions.Window.SelectItem);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v5, v6)
    return function(v7, v8)
        local v9 = nil;
        v8.recordChange({
            Name = "StyleEditor/DuplicateInstance", 
            DisplayName = "StyleEditor - Duplicate Instance", 
            DoChange = function()
                v9 = v5:Clone();
                v9.Parent = v6;
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if v9 then
            v7:dispatch(v2((v1.createItemId(v9))));
        end;
        return v9;
    end;
end;
