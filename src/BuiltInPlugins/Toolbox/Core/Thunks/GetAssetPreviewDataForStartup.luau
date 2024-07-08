local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.MarkTryInStudioDone);
local v2 = require(l_Parent_0.Core.Util.Analytics.Analytics);
return function(v3, v4, _, v6, v7)
    return function(v8)
        local l_status_0, l_result_0 = pcall(function()
            if v2.getIsEditMode() then
                if not v8:getState().tryInStudio.triedInStudio[v3] then
                    v6:getItemDetails({
                        {
                            id = v3, 
                            itemType = "Asset"
                        }
                    }):andThen(function(v9)
                        local v10 = v9.responseBody.data[1];
                        if v10 then
                            local v11 = {
                                Asset = {
                                    Id = v10.asset.id, 
                                    TypeId = v10.asset.typeId, 
                                    AssetGenres = v10.asset.assetGenres, 
                                    Name = v10.asset.name, 
                                    Description = v10.asset.description, 
                                    Created = v10.asset.createdUtc, 
                                    Updated = v10.asset.updatedUtc, 
                                    AssetSubTypes = v10.asset.assetSubTypes
                                }, 
                                Context = {}, 
                                Creator = {
                                    Name = v10.creator.name, 
                                    Id = v10.creator.id, 
                                    Type = v10.creator.type
                                }
                            };
                            v7(v11);
                            v4(v11, false);
                            v2.onTryAsset(v3);
                            v8:dispatch(v1(v3));
                            return ;
                        else
                            warn("Could not find asset information in response for", (tostring(v3)));
                            v2.onTryAssetFailure(v3);
                            return ;
                        end;
                    end, function(v12)
                        warn("Could not load asset information for", tostring(v3), v12);
                        v2.onTryAssetFailure(v3);
                    end);
                    return nil;
                else
                    return ;
                end;
            else
                return ;
            end;
        end);
        if not l_status_0 then
            warn("Failed to try asset", tostring(v3), (tostring(l_result_0)));
            v2.onTryAssetFailure(v3);
        end;
    end;
end;
