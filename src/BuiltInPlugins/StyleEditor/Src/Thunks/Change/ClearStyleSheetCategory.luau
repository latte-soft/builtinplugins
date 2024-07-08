local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Dash);
local l_startsWith_0 = v2.startsWith;
local l_filter_0 = v2.filter;
local v5 = require(l_Parent_0.Src.Util.DesignHelpers);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v8)
    return function(v9, v10)
        local l_DesignSheet_0 = v9:getState().Window.DesignSheet;
        if l_DesignSheet_0 then
            assert(l_DesignSheet_0 ~= nil, "expecting valid design sheet");
            v10.recordChange({
                Name = "StyleEditor/ClearStyleSheetCategory", 
                DisplayName = "StyleEditor - Clear StyleSheet Category", 
                DoChange = function()
                    local l_v8_Attribute_0 = v8:GetAttribute("StyleCategory");
                    if l_v8_Attribute_0 then
                        if l_v8_Attribute_0 == "Themes" then
                            v8:SetDerives((l_filter_0(v8:GetDerives(), function(v13)
                                return not l_startsWith_0(v13:GetAttribute("StyleCategory"), "Tokens");
                            end)));
                            v5.removeDerive(l_DesignSheet_0, v8);
                        elseif l_v8_Attribute_0 == "Tokens" then
                            for _, v15 in l_ReplicatedStorage_0:GetDescendants() do
                                if v15:IsA("StyleSheet") then
                                    local l_v15_Attribute_0 = v15:GetAttribute("StyleCategory");
                                    if not (not l_v15_Attribute_0 or not l_startsWith_0(l_v15_Attribute_0, "Themes")) then
                                        v5.removeDerive(v15, v8);
                                    end;
                                end;
                            end;
                        end;
                        v8:SetAttribute("StyleCategory", nil);
                        return Enum.FinishRecordingOperation.Commit;
                    else
                        return Enum.FinishRecordingOperation.Cancel;
                    end;
                end
            });
            return ;
        else
            return ;
        end;
    end;
end;
