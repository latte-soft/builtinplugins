local v0 = require(script.Parent.BoundingBoxUtils);
local v1 = require(script:FindFirstAncestor("AnimationClipEditor").Src.Util.RigUtils);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4)
    local v5 = setmetatable(v0.computeInfo(v3, v4), v2);
    v5.joints = not not v5.draggerContext.RootInstance and v1.getJoints(v5.parts, v5.draggerContext.RootInstance) or nil;
    return v5;
end;
v2.isEmpty = function(v6)
    local v7 = false;
    if #v6.parts == 0 then
        v7 = false;
        if #v6.attachments == 0 then
            v7 = #v6.bones == 0;
        end;
    end;
    return v7;
end;
v2.getBoundingBox = function(v8)
    local v9 = v8.draggerContext:shouldUseLocalSpace();
    local v10 = #v8.parts > 0;
    local v11 = not not v10 and v8.joints or v8.bones;
    if #v11 > 0 then
        local v12 = v11[#v11];
        if v10 then
            if v12.Part1 ~= nil then
                if not v9 then
                    return CFrame.new((v12.Part1.CFrame * v12.C1).Position), Vector3.new(), (Vector3.new());
                else
                    return v12.Part1.CFrame * v12.C1, Vector3.new(), (Vector3.new());
                end;
            end;
        elseif not v9 then
            return CFrame.new(v12.TransformedWorldCFrame.Position), Vector3.new(), (Vector3.new());
        else
            return v12.TransformedWorldCFrame, Vector3.new(), (Vector3.new());
        end;
    end;
    return v8.basisCFrame, v8.boundingBoxOffset, v8.boundingBoxSize;
end;
v2.doesContainItem = function(v13, v14)
    return v13.partSet[v14] ~= nil;
end;
v2.isDynamic = function(_)
    return false;
end;
v2.getObjectsToTransform = function(v16)
    local l_parts_0 = v16.parts;
    for _, v19 in ipairs(v16.bones) do
        table.insert(l_parts_0, v19);
    end;
    return l_parts_0, v16.attachments;
end;
v2.getAllAttachments = function(v20)
    return v20.allAttachments;
end;
return v2;
