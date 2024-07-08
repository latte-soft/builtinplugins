local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.SetAllowedAssetTypes);
local v4 = require(l_Parent_0.Core.Actions.SetAllowedBundleTypes);
local v5 = require(l_Parent_0.Core.Actions.SetTagsMetadata);
local v6 = require(l_Parent_0.Core.Util.DebugFlags);
return function(v7)
    return function(v8)
        if not v7 or not v7.getMetaData then
            return l_Promise_0.reject();
        else
            return v7:getMetaData():andThen(function(v9)
                v8:dispatch(v3(if not v9.responseBody then {} else v9.responseBody.allowedAssetTypesForRelease, if not v9.responseBody then {} else v9.responseBody.allowedAssetTypeForUpload, if not v9.responseBody then {} else v9.responseBody.allowedAssetTypesForFree));
                return v7:getBundleMetadata():andThen(function(v10)
                    if v10.responseBody and v10.responseBody.isBundlesControllerEnabled then
                        v8:dispatch(v4(v10.responseBody and v10.responseBody.allowedBundleTypeSettings));
                    end;
                    return v7:getTagsMetadata():andThen(function(v11)
                        v8:dispatch(v5(v11.responseBody and v11.responseBody.isItemTagsFeatureEnabled == true, if not v11.responseBody then {} else v11.responseBody.enabledAssetTypes or {}, not v11.responseBody and 0 or (v11.responseBody.maximumItemTagsPerItem or 0)));
                    end, function(_)
                        if v6.shouldDebugWarnings() then
                            warn("Lua toolbox: Could not get tags metadata");
                        end;
                    end);
                end, function(_)
                    if v6.shouldDebugWarnings() then
                        warn("Lua toolbox: Could not get bundles metadata");
                    end;
                end);
            end, function(v14)
                if v6.shouldDebugWarnings() then
                    warn("Lua toolbox: Could not get roleset back-end data");
                end;
                v8:dispatch(v2(v14));
            end);
        end;
    end;
end;
