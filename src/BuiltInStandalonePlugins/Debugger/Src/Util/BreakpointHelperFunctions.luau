local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local v2 = require(l_Parent_0.Src.Util.Constants);
return {
    setBreakpointRowEnabled = function(v3, v4, v5, v6, v7)
        local v8 = not v4.item.isEnabled;
        if v4.item.context == nil then
            v3:SetEnabled(v8);
            if not v8 then
                v5:report(v1.DisableMetaBreakpoint, v6);
                return ;
            else
                v5:report(v1.EnableMetaBreakpoint, v6);
                return ;
            end;
        else
            local v9 = v2.GetIntForGST(v4.item.context);
            if v9 == nil then
                return ;
            else
                local l_DebuggerUIService_0 = game:GetService("DebuggerUIService");
                local v11 = false;
                if v7 and v7 ~= v2.kInvalidDebuggerConnectionId then
                    v11 = not l_DebuggerUIService_0:IsConnectionForPlayDataModel(v7);
                end;
                if not v11 or not v8 then
                    v3:SetChildBreakpointEnabledByScriptAndContext(v4.item.scriptGUID, v9, v8);
                else
                    v3:SetEnabled(v8);
                end;
                if not v8 then
                    v5:report(v1.DisableBreakpoint, v6);
                    return ;
                else
                    v5:report(v1.EnableBreakpoint, v6);
                    return ;
                end;
            end;
        end;
    end
};
