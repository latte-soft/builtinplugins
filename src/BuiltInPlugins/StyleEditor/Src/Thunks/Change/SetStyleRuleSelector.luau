local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v3, v4)
    return function(_, v6)
        assert(v3 and v3:IsA("StyleRule"), "expecting valid StyleRule");
        v6.recordChange({
            Name = "StyleEditor/SetStyleRuleSelector", 
            DisplayName = "StyleEditor - Set StyleRule Selector", 
            DoChange = function()
                v3.Selector = v4;
                v3.Name = v4;
                return Enum.FinishRecordingOperation.Commit;
            end
        });
    end;
end;
