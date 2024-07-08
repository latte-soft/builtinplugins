local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
local _ = require(l_Parent_0.Src.Types);
return function(v4, v5, v6)
    return function(_, v8)
        v8.recordChange({
            Name = "StyleEditor/SetStyleInstanceAttribute", 
            DisplayName = "StyleEditor - Set StyleInstance Token", 
            DoChange = function()
                v4:SetAttribute(v5, v6);
                return Enum.FinishRecordingOperation.Commit;
            end
        });
    end;
end;
