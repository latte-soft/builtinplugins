local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.DesignHelpers);
local v2 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.Window.SelectItem);
local v5 = require(l_Actions_0.Window.SetDesignSheet);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function()
    return function(v8, v9)
        local v10 = nil;
        v9.recordChange({
            Name = "StyleEditor/CreateDesignSheet", 
            DisplayName = "StyleEditor - Create Design Sheet", 
            DoChange = function()
                v10 = v1.createDesign();
                v8:dispatch(v5(v10));
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if v10 then
            v8:dispatch(v4((v2.createItemId(v10))));
        end;
        return v10;
    end;
end;
