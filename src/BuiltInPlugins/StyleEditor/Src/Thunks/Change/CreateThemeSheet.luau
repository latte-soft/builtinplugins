local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.DesignHelpers);
local v3 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.Window.SelectItem);
local v6 = require(l_Actions_0.Window.SetDesignSheet);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v9)
    return function(v10, v11)
        local l_DesignSheet_0 = v10:getState().Window.DesignSheet;
        local v13 = nil;
        v11.recordChange({
            Name = "StyleEditor/CreateThemeSheet", 
            DisplayName = "StyleEditor - Create Theme Sheet", 
            DoChange = function()
                if not l_DesignSheet_0 then
                    l_DesignSheet_0 = v2.createDesign();
                    v10:dispatch(v6(l_DesignSheet_0));
                end;
                assert(l_DesignSheet_0 ~= nil, "expecting valid design sheet");
                v13 = Instance.new("StyleSheet");
                v13.Name = "StyleSheet";
                v13.Parent = v9 or l_ReplicatedStorage_0;
                v13:SetAttribute("StyleCategory", "Themes");
                v2.setAsTheme(v13, l_DesignSheet_0);
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if v13 then
            v10:dispatch(v5((v3.createItemId(v13))));
        end;
        return v13;
    end;
end;
