local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
local _ = require(l_Parent_0.Src.Types);
return function(v4, v5, v6)
    assert(v4 and v4:IsA("StyleRule"), "expecting valid StyleRule");
    return function(_, v8)
        v8.recordChange({
            Name = "StyleEditor/SetStyleRuleProperty", 
            DisplayName = "StyleEditor - Set StyleRule Property", 
            DoChange = function()
                v4:SetProperty(v5, v6);
                local v9 = typeof(v6);
                if not (v9 ~= "Color3") or v9 == "ColorSequence" then
                    return Enum.FinishRecordingOperation.Append;
                else
                    return Enum.FinishRecordingOperation.Commit;
                end;
            end
        });
    end;
end;
