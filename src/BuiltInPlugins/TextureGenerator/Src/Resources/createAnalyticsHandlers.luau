local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetry);
return function(v4)
    local function v16(v5, v6, v7, v8, v9, v10, v11, v12)
        assert(v3(), "Telemetry is not enabled");
        local v13 = {};
        for _, v15 in v6, nil, nil do
            table.insert(v13, v15.MeshId);
        end;
        v4:SendEventDeferred("studio", "TextureGenerator", v5, (v2.join({
            studioSid = v4:GetSessionId(), 
            clientId = v4:GetClientId(), 
            userId = l_StudioService_0:GetUserId(), 
            placeId = game.PlaceId, 
            meshIds = table.concat(v13, ","), 
            prompt = v7, 
            seed = v8, 
            rotation = v9, 
            smartUVUnwrap = v10, 
            specifyFrontView = v11
        }, v12)));
    end;
    return {
        GeneratedPreview = function(_, v18, v19, v20, v21, v22, v23, v24)
            v16("GeneratedPreview", v18, v19, v20, v21, v22, v23, {
                localId = v24
            });
        end, 
        ReceivedPreview = function(_, v26, v27, v28, v29, v30, v31, v32, v33)
            v16("ReceivedPreview", v27, v28, v29, v30, v31, v32, {
                jobId = v26, 
                localId = v33
            });
        end, 
        GeneratedTexture = function(_, v35, v36, v37, v38, v39, v40, v41, v42)
            v16("GeneratedTexture", v36, v37, v38, v39, v40, v41, {
                previewJobId = v35, 
                localId = v42
            });
        end, 
        ReceivedTexture = function(_, v44, v45, v46, v47, v48, v49, v50, v51, v52)
            v16("ReceivedTexture", v45, v46, v47, v48, v49, v50, {
                jobId = v44, 
                colorMapId = v51, 
                localId = v52
            });
        end, 
        CancelTextureGeneration = function(_, v54, v55, v56, v57, v58, v59, v60, v61)
            v16("CancelTextureGeneration", v55, v56, v57, v58, v59, v60, {
                jobId = v54, 
                localId = v61
            });
        end, 
        ExportGeneratedTexture = function(_, v63, v64, v65, v66, v67, v68, v69, v70, v71)
            v16("ExportGeneratedTexture", v64, v65, v66, v67, v68, v69, {
                jobId = v63, 
                colorMapId = v70, 
                localId = v71
            });
        end, 
        RemoveGeneratedTexture = function(_, v73, v74, v75, v76, v77, v78, v79, v80, v81)
            v16("RemoveGeneratedTexture", v74, v75, v76, v77, v78, v79, {
                jobId = v73, 
                colorMapId = v80, 
                localId = v81
            });
        end, 
        SendFeedback = function(_, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93)
            v16("SendFeedback", v84, v85, v86, v87, v88, v89, {
                acceptance = v92, 
                feedback = v93, 
                jobId = v83, 
                colorMapId = v90, 
                localId = v91
            });
        end
    };
end;
