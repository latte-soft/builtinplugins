local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v3 = require(l_Parent_0.Src.Util.StyleSchema);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
local _ = require(l_Parent_0.Src.Types);
local function _(v7, v8)
    local v9 = nil;
    v9 = if not not v8 and #v8 > 0 then v3.allProperties[v8][v7] else v3.PropertySchemas[v3.getPossiblePropertyTypes(v7)[1]];
    assert(v9 ~= nil, (("unknown schema for: %* (%*)"):format(v7, v8)));
    return v9.GetDefaultValue();
end;
return function(v11, v12)
    return function(_, v14)
        v14.recordChange({
            Name = "StyleEditor/UnlinkStyleRulePropertyTokenReference", 
            DisplayName = "StyleEditor - Unlink Token from StyleRule Property", 
            DoChange = function()
                local v15 = l_StylingService_0:GetStyleInfo(v11).Properties[v12];
                if v15 then
                    local l_Value_0 = v15.Value;
                    if v15.Error or l_Value_0 == "$" then
                        local v17 = v2.findFirstClassSelector(v11);
                        local l_v12_0 = v12;
                        local v19 = nil;
                        v19 = if not not v17 and #v17 > 0 then v3.allProperties[v17][l_v12_0] else v3.PropertySchemas[v3.getPossiblePropertyTypes(l_v12_0)[1]];
                        assert(v19 ~= nil, (("unknown schema for: %* (%*)"):format(l_v12_0, v17)));
                        l_Value_0 = v19.GetDefaultValue();
                    end;
                    v11:SetProperty(v12, l_Value_0);
                    return Enum.FinishRecordingOperation.Commit;
                else
                    return Enum.FinishRecordingOperation.Cancel;
                end;
            end
        });
    end;
end;
