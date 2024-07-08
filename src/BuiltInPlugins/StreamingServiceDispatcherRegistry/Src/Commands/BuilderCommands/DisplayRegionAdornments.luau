local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
return function(v4)
    local l_requestId_0 = v4.requestId;
    local v6 = v1.getRequestCFrame(l_requestId_0);
    local v7 = v3.GetRequestMetadata(l_requestId_0, "PlacementSize");
    v1.addConstraintVisualization(l_requestId_0, v6, Vector3.new(v7.X, 0, v7.Z), true);
    v1.startConstraintVisualization(l_requestId_0, true);
end;
