local l_pollUntil_0 = require(script:FindFirstAncestor("Toolbox").Packages.Framework).Util.pollUntil;
return {
    createMockStudioStyleGuideColor = function()
        local v1 = {};
        setmetatable(v1, {
            __index = function()
                return Color3.new(math.random(), math.random(), math.random());
            end
        });
        return v1;
    end, 
    createMockStudioStyleGuideModifier = function()
        local v2 = {};
        setmetatable(v2, {
            __index = function()
                return nil;
            end
        });
        return v2;
    end, 
    pollAssertionUntil = function(v3, v4)
        local v5 = nil;
        return l_pollUntil_0(function()
            local l_status_0, l_result_0 = pcall(v3);
            if not l_status_0 then
                v5 = l_result_0;
                return false;
            else
                v5 = nil;
                return true;
            end;
        end, v4):catch(function()
            error(string.format("pollAssertionUntil failed after %ds:\n%s", v4 or 1, (tostring(v5))));
        end):await();
    end
};
