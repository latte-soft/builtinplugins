local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v3)
    return function(v4, v5)
        local l_Attribute_0 = v4:getState().Clipboard.Attribute;
        if l_Attribute_0 then
            assert(l_Attribute_0 ~= nil, "expecting valid attribute");
            v5.recordChange({
                Name = "StyleEditor/PasteStyleInstanceAttribute", 
                DisplayName = "StyleEditor - Paste StyleInstance Token", 
                DoChange = function()
                    v3:SetAttribute(l_Attribute_0.Name, l_Attribute_0.Value);
                    return Enum.FinishRecordingOperation.Commit;
                end
            });
            return ;
        else
            return ;
        end;
    end;
end;
