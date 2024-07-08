local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.updatePreview);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugTextureGeneratorLogging);
return function(v5)
    return v1.useCallback(function(v6)
        v5(function(v7)
            if v6.uuid == nil then
                return v7;
            else
                local v8 = table.clone(v7);
                if v8[v6.uuid] == nil then
                    v8[v6.uuid] = {};
                end;
                v3(v8, v6);
                if v4() then
                    print("add/update previewTable", v8);
                end;
                return table.freeze(v8);
            end;
        end);
    end, {
        v5
    });
end;
