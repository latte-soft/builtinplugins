local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.DesignHelpers);
local v3 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v4 = require(l_Parent_0.Src.Actions.Window.SelectItem);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function()
    return function(v7, v8)
        local l_DesignSheet_0 = v7:getState().Window.DesignSheet;
        local v10 = nil;
        v8.recordChange({
            Name = "StyleEditor/CreateTokenSheet", 
            DisplayName = "StyleEditor - Create Token Sheet", 
            DoChange = function()
                v10 = Instance.new("StyleSheet");
                v10.Name = "StyleSheet";
                v10.Parent = if not l_DesignSheet_0 then l_ReplicatedStorage_0 else l_DesignSheet_0.Parent;
                v10:SetAttribute("StyleCategory", "Tokens");
                v2.setAsToken(v10, l_DesignSheet_0);
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if v10 then
            v7:dispatch(v4((v3.createItemId(v10))));
        end;
        return v10;
    end;
end;
