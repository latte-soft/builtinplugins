local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.UGCValidation);
local _ = require(l_script_FirstAncestor_0.Src.Util.Signal);
local v4 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local v5 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext.useCanUploadBundles);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v7 = {};
local function v8()
    return {
        type = "allowed"
    };
end;
local function v21(v9)
    local v10, v11 = v1.useState({});
    local v18 = v1.useCallback(function(v12)
        local function v15()
            v11(function(v13)
                if v13[v12] ~= nil then
                    return v13;
                else
                    local v14 = v9.createCachedResponse();
                    if v14 == nil then
                        return v13;
                    else
                        assert(v14 ~= nil, v6.LUAU_ANALYZE_ERROR);
                        v13 = table.clone(v13);
                        v13[v12] = v14;
                        return v13;
                    end;
                end;
            end);
        end;
        if v9.waitForSignal == nil then
            v11(function(v16)
                if v16[v12] ~= nil then
                    return v16;
                else
                    local v17 = v9.createCachedResponse();
                    if v17 == nil then
                        return v16;
                    else
                        assert(v17 ~= nil, v6.LUAU_ANALYZE_ERROR);
                        v16 = table.clone(v16);
                        v16[v12] = v17;
                        return v16;
                    end;
                end;
            end);
            return ;
        else
            v9.waitForSignal:Once(v15);
            return ;
        end;
    end, {});
    local v19, v20 = v5(v9.canUploadBundlesAsync or v8);
    return v1.createElement(v4.Context.Provider, {
        value = {
            cachedResponses = v10, 
            validateBundle = v18, 
            canUploadBundles = v19, 
            requestCanUploadBundles = v20
        }
    }, v9.children);
end;
v7.AlwaysPassesProvider = function(v22)
    return v1.createElement(v21, {
        waitForSignal = v22.waitForSignal, 
        canUploadBundlesAsync = v22.canUploadBundlesAsync, 
        createCachedResponse = function()
            return {
                completed = true, 
                ugcValidationResponse = {
                    errors = {}, 
                    pieces = {}
                }
            };
        end
    }, v22.children);
end;
v7.AlwaysFailsProvider = function(v23)
    return v1.createElement(v21, {
        createCachedResponse = function()
            return {
                completed = true, 
                ugcValidationResponse = {
                    errors = {
                        {
                            assetType = Enum.AssetType.Head, 
                            error = {
                                type = "message", 
                                message = "Your brain gets smart, but your head gets dumb"
                            }
                        }, 
                        {
                            assetType = nil, 
                            error = {
                                type = "message", 
                                message = "Full body error"
                            }
                        }, 
                        {
                            assetType = Enum.AssetType.LeftArm, 
                            error = {
                                type = "notFound"
                            }
                        }
                    }, 
                    pieces = {}
                }
            };
        end
    }, v23.children);
end;
v7.NeverReturnsProvider = function(v24)
    return v1.createElement(v21, {
        createCachedResponse = function()
            return nil;
        end
    }, v24.children);
end;
return v7;
