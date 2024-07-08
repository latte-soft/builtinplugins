local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugTextureGeneratorLogging);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = {
    PreviewFront = 1, 
    Preview90 = 2, 
    Preview180 = 3, 
    Preview270 = 4
};
local function _(v5)
    return v4[v5];
end;
return function(v7, v8)
    local v9 = table.clone(v7[v8.uuid]);
    for v10, v11 in v8, nil, nil do
        if v10 ~= "uuid" and v10 ~= "previewId" then
            v9[v10] = v11;
        end;
    end;
    if v8.previewId ~= nil then
        if v9.allPreviews == nil then
            v9.allPreviews = {
                {
                    previewId = v8.previewId, 
                    status = v8.status
                }
            };
        else
            local v12 = table.clone(v9.allPreviews);
            local v14 = v2.find(v12, function(v13)
                return v13.previewId == v8.previewId;
            end);
            if not v14 then
                table.insert(v12, v8);
            else
                v12[v14] = v8;
            end;
            table.sort(v12, function(v15, v16)
                return v4[v15.previewAngle] < v4[v16.previewAngle];
            end);
            if v1() then
                print("all previews", v12);
            end;
            v9.allPreviews = v12;
        end;
    elseif v9.allPreviews == nil then
        v9.allPreviews = {};
    end;
    v7[v8.uuid] = v9;
end;
