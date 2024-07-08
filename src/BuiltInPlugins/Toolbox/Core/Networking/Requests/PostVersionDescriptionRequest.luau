local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.Analytics.Analytics);
local v2 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local l_ToolboxSendPackageVersionNoteTelemetry_0 = game:GetFastFlag("ToolboxSendPackageVersionNoteTelemetry");
return function(v4, v5, v6, v7)
    return function(v8)
        if not l_ToolboxSendPackageVersionNoteTelemetry_0 then
            return v4:postVersionDescription(v5, v6, v7);
        else
            return v4:postVersionDescription(v5, v6, v7):andThen(function(_)
                v1.onPackageNoteCreated(v5, v6, v7);
            end, function(v10)
                v8:dispatch(v2(v10));
            end);
        end;
    end;
end;
