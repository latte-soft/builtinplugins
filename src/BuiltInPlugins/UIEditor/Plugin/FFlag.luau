local v0 = {};
local function _(v1)
    local l_status_0, l_result_0 = pcall(function()
        return settings():GetFFlag(v1);
    end);
    v0[v1] = l_status_0 and l_result_0;
end;
return {
    isEnabled = function(_, v6)
        if v0[v6] == nil then
            local l_status_1, l_result_1 = pcall(function()
                return settings():GetFFlag(v6);
            end);
            v0[v6] = l_status_1 and l_result_1;
        end;
        return v0[v6];
    end
};
