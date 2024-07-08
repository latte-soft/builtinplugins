local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local v2 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local function _(v3, v4, v5)
    if v2.shouldDebugWarnings() then
        warn("Failed here -- Could not post UGC Bundle consent and received response:", v5);
    end;
    v3:dispatch(v1(v4:getText("AssetConfig", "ValidationErrorUnknown")));
end;
return function(v7, v8, v9, v10)
    return function(v11)
        return v7:postCreateBundleDataSharing(v8, v9):andThen(function()
            if v2.shouldDebugWarnings() then
                warn("UGC Bundle consent post succeeded");
            end;
        end):catch(function(v12)
            local l_v11_0 = v11;
            local l_v10_0 = v10;
            if v2.shouldDebugWarnings() then
                warn("Failed here -- Could not post UGC Bundle consent and received response:", v12);
            end;
            l_v11_0:dispatch(v1(l_v10_0:getText("AssetConfig", "ValidationErrorUnknown")));
        end);
    end;
end;
