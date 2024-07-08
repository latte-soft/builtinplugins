local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v3 = require(l_Parent_0.Src.Actions.Window.SelectItem);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function()
    return function(v6, v7)
        local l_DesignSheet_0 = v6:getState().Window.DesignSheet;
        local v9 = nil;
        v7.recordChange({
            Name = "StyleEditor/CreateThemeCategory", 
            DisplayName = "StyleEditor - Create Theme Category", 
            DoChange = function()
                v9 = Instance.new("Folder");
                v9.Name = "Folder";
                v9.Parent = if not l_DesignSheet_0 then l_ReplicatedStorage_0 else l_DesignSheet_0.Parent;
                v9:SetAttribute("StyleCategory", "Themes");
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if v9 then
            v6:dispatch(v3((v2.createItemId(v9))));
        end;
        return v9;
    end;
end;
