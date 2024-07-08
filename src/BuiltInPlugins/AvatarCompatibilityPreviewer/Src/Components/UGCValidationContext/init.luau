local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.UGCValidation);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.createUnimplemented);
local v6 = require(script.useCanUploadBundles);
local l_Analytics_0 = v1.ContextServices.Analytics;
local v8 = game:DefineFastFlag("AvatarPreviewerBypassHSRValidation2", false);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupTelemetryV2);
local v10 = v2.createContext({
    cachedResponses = {}, 
    validateBundle = v5("validateBundle"), 
    canUploadBundles = nil, 
    requestCanUploadBundles = v5("requestCanUploadBundles")
});
return {
    Context = v10, 
    Provider = function(v11)
        local v12 = l_Analytics_0:use();
        local v13, v14 = v2.useState({});
        local v15 = v2.useRef({});
        assert(v15.current ~= nil, v4.LUAU_ANALYZE_ERROR);
        local v16 = v2.useRef(nil);
        local v30 = v2.useCallback(function(v17)
            if not v15.current[v17] then
                v15.current[v17] = true;
                if v16.current == nil then
                    v16.current = v3.util.BundlesMetadata.fetch():andThen(function(v18)
                        return {
                            type = "success", 
                            metadata = v18
                        };
                    end):catch(function(v19)
                        v12:report("bundlesMetadataError", v19);
                        return {
                            type = "error"
                        };
                    end);
                end;
                assert(v16.current ~= nil, v4.LUAU_ANALYZE_ERROR);
                v16.current:andThen(function(v20)
                    if v20.type ~= "success" then
                        return ;
                    else
                        assert(v20.type == "success", v4.LUAU_ANALYZE_ERROR);
                        local v21 = if not v9() then nil else os.clock();
                        if not v8 then
                            v3.validateBundleReadyForUpload(v17, v20.metadata.allowedBundleTypeSettings, "Body", function(v22)
                                v14(function(v23)
                                    v23 = table.clone(v23);
                                    v23[v17] = {
                                        completed = false, 
                                        ugcValidationResponse = v22
                                    };
                                    return v23;
                                end);
                            end):andThen(function(v24)
                                v14(function(v25)
                                    v25 = table.clone(v25);
                                    v25[v17] = {
                                        completed = true, 
                                        duration = if not v9() then nil else os.clock() - v21, 
                                        ugcValidationResponse = v24
                                    };
                                    return v25;
                                end);
                            end):finally();
                            return ;
                        else
                            v3.validateBundleReadyForUpload(v17, v20.metadata.allowedBundleTypeSettings, "Body", function(v26)
                                v14(function(v27)
                                    v27 = table.clone(v27);
                                    v27[v17] = {
                                        completed = false, 
                                        ugcValidationResponse = v26
                                    };
                                    return v27;
                                end);
                            end, nil, {
                                skipValidateHSR = true
                            }):andThen(function(v28)
                                v14(function(v29)
                                    v29 = table.clone(v29);
                                    v29[v17] = {
                                        completed = true, 
                                        duration = if not v9() then nil else os.clock() - v21, 
                                        ugcValidationResponse = v28
                                    };
                                    return v29;
                                end);
                            end):finally();
                            return ;
                        end;
                    end;
                end);
                return ;
            else
                return ;
            end;
        end, {});
        local v31, v32 = v6(v3.util.canUploadBundlesAsync);
        return v2.createElement(v10.Provider, {
            value = {
                cachedResponses = v13, 
                validateBundle = v30, 
                canUploadBundles = v31, 
                requestCanUploadBundles = v32
            }
        }, v11.children);
    end
};
