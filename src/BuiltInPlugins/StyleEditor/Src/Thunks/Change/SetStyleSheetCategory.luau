local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.Window.SetDesignSheet);
local v2 = require(l_Parent_0.Src.Util.DesignHelpers);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v5, v6)
    return function(v7, v8)
        local l_DesignSheet_0 = v7:getState().Window.DesignSheet;
        if l_DesignSheet_0 then
            assert(l_DesignSheet_0 ~= nil, "expecting valid design sheet");
            v8.recordChange({
                Name = "StyleEditor/SetStyleSheetCategory", 
                DisplayName = "StyleEditor - Set StyleSheet Category", 
                DoChange = function()
                    if v6 == "Designs" then
                        l_DesignSheet_0:SetAttribute("StyleCategory", nil);
                        v7:dispatch(v1(v5));
                    elseif v6 == "Themes" then
                        v2.setAsTheme(v5, l_DesignSheet_0);
                    elseif v6 == "Tokens" then
                        v2.setAsToken(v5, l_DesignSheet_0);
                    else
                        warn("Unknown StyleSheetCategory:", v6);
                    end;
                    v5:SetAttribute("StyleCategory", v6);
                    return Enum.FinishRecordingOperation.Commit;
                end
            });
            return ;
        else
            return ;
        end;
    end;
end;
