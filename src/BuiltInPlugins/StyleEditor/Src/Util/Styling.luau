local l_StylingService_0 = game:GetService("StylingService");
local _ = require(script.Parent.Parent.Parent.Src.Types);
return {
    getStyleInfo = function(v2)
        assert(v2 and v2:IsA("StyleRule"), "expecting style rule");
        local l_status_0, l_result_0 = pcall(function()
            return (l_StylingService_0:GetStyleInfo(v2));
        end);
        if not l_status_0 then
            return nil;
        else
            return l_result_0;
        end;
    end
};
