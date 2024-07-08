local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.StyleSchema);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
local _ = require(l_Parent_0.Src.Types);
return function(v5, v6, v7)
    local v8 = nil;
    if v7 == "TokenReference" then
        v8 = v1.TokenReferenceSchema.GetDefaultValue();
    else
        local v9 = v1.PropertySchemas[v7];
        assert(v9 ~= nil, (("unknown schema for type: %*"):format(v7)));
        v8 = v9.GetDefaultValue();
    end;
    return function(_, v11)
        v11.recordChange({
            Name = "StyleEditor/SetStyleSheetTokenType", 
            DisplayName = "StyleEditor - Set Token Type", 
            DoChange = function()
                v5:SetAttribute(v6, v8);
                return Enum.FinishRecordingOperation.Commit;
            end
        });
    end;
end;
