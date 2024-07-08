return function(v0, v1)
    return function(v2, _)
        if v0 == nil then
            assert(false);
            return ;
        else
            for v4, _ in pairs(v2:getState().Breakpoint.MetaBreakpoints) do
                v0:GetBreakpointById(v4):SetEnabled(v1);
            end;
            return ;
        end;
    end;
end;
