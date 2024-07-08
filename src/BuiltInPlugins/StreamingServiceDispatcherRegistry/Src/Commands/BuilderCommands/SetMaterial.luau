local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local function _(v4, v5)
    if v4:IsA("BasePart") then
        v4.Material = v5.BaseMaterial;
        v4.MaterialVariant = v5.Name;
    end;
end;
local function v13(v7, v8)
    local v9 = v3.get(v8.applicationTargetInstanceId, v7.requestId);
    if v9 then
        assert(v9, "Luau");
        local v10 = v3.get(v8.materialId, v7.requestId);
        if v10 then
            assert(v10, "Luau");
            if v10:IsA("MaterialVariant") then
                assert(v10:IsA("MaterialVariant"), "Luau");
                if v9:IsA("BasePart") then
                    v9.Material = v10.BaseMaterial;
                    v9.MaterialVariant = v10.Name;
                end;
                for _, v12 in v9:GetDescendants() do
                    if v12:IsA("BasePart") then
                        v12.Material = v10.BaseMaterial;
                        v12.MaterialVariant = v10.Name;
                    end;
                end;
                v1.modifyChatWithInstanceLink(v7.requestId, v9, ("Applied %* to"):format(v10.Name), "set_material_" .. v7.requestId);
                return ;
            else
                warn((("Bad materialVariant instance from id %*, expected class of MaterialVariant, got %*"):format(v8.materialId, v10.ClassName)));
                return ;
            end;
        else
            warn((("Failed to find material for id %*"):format(v8.materialId)));
            return ;
        end;
    else
        warn((("Failed to find target for id %*"):format(v8.applicationTargetInstanceId)));
        return ;
    end;
end;
return function(v14)
    local l_arguments_0 = v14.arguments;
    assert(type(l_arguments_0.applicationTargetInstanceId) == "string", "Bad request.applicationTargetInstanceId");
    assert(type(l_arguments_0.materialId) == "string", "Bad request.materialId");
    v3.StartRecordingActions(v14.requestId);
    v13(v14, l_arguments_0);
    v3.EndRecordingActions(v14.requestId);
end;
