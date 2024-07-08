local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v2 = require(l_Parent_0.Src.Actions.Window.SelectItem);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v5, v6, v7)
    return function(v8, v9)
        local v10 = nil;
        v9.recordChange({
            Name = "StyleEditor/CreateStyleRule", 
            DisplayName = "StyleEditor - Create StyleRule", 
            DoChange = function()
                if not (v6:sub(1, 1) == ",") or not v5:IsA("StyleRule") then
                    v10 = Instance.new("StyleRule");
                    v10.Name = v6;
                    v10.Selector = v6;
                    v10.Parent = v5;
                else
                    v5.Selector = v5.Selector .. v6;
                    v5.Name = v5.Selector;
                    v10 = v5;
                end;
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if not (not v7 or not v10) then
            v8:dispatch(v2((v1.createItemId(v10))));
        end;
        return v10;
    end;
end;
