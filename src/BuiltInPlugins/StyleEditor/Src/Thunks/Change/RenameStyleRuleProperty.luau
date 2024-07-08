local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v2 = require(l_Parent_0.Src.Util.StyleSchema);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v5, v6, v7)
    assert(v5 and v5:IsA("StyleRule"), "expecting valid StyleRule");
    return function(_, v9)
        if v6 == v7 then
            return ;
        else
            local v10 = v2.getPropertySchema(v7, (v1.findFirstClassSelector(v5)));
            if v10 then
                local v11 = v10.GetDefaultValue();
                local v12 = if typeof(v11) == typeof((v5:GetPropertyResolved(v6))) then v5:GetProperty(v6) else v11;
                v9.recordChange({
                    Name = "StyleEditor/RenameStyleRuleProperty", 
                    DisplayName = "StyleEditor - Rename StyleRule Property", 
                    DoChange = function()
                        v5:SetProperty(v6, nil);
                        v5:SetProperty(v7, v12);
                        return Enum.FinishRecordingOperation.Commit;
                    end
                });
                return ;
            else
                return ;
            end;
        end;
    end;
end;
