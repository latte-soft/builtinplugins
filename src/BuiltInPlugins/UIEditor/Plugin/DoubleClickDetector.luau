local v0 = nil;
return {
    isDoubleClick = function(_)
        local v2 = tick();
        if v0 and v2 <= v0 + 0.3 then
            v0 = nil;
            return true;
        else
            v0 = v2;
            return false;
        end;
    end
};
