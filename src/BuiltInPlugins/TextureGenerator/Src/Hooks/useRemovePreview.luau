local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugTextureGeneratorLogging);
return function(v3)
    return v1.useCallback(function(v4)
        v3(function(v5)
            local v6 = table.clone(v5);
            v6[v4] = nil;
            if v2() then
                print("remove previewTable", v6);
            end;
            return v6;
        end);
    end, {
        v3
    });
end;
