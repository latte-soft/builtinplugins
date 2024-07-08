local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Promise_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Promise;
local v2 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
local v3 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local _ = game:GetEngineFeature("ToolboxSampleProductMUS418");
return function(v5, v6)
    return l_Promise_0.new(function(v7)
        if not v5:getIsAssetOpenForUse(v6):catch(function(v8)
            if v3.shouldDebugUrls() then
                warn((("networkInterface:getIsAssetOpenForUse failed to fetch permissions of asset %*. %*"):format(v6, v8 or "")));
            end;
            v7(false);
        end):await() then
            local l_responseBody_0 = v5:getFiatProduct(v6, Enum.AssetType.Audio):catch(function(v9)
                if v3.shouldDebugUrls() then
                    warn((("networkInterface:getFiatProduct failed to fetch details of asset %*. %*"):format(v6, v9 or "")));
                end;
                v7(false);
            end):await().responseBody;
            if l_responseBody_0 then
                local v11 = v2.isFree(l_responseBody_0.purchasePrice);
                local l_purchasable_0 = l_responseBody_0.purchasable;
                if v11 and l_purchasable_0 then
                    if not v5:getIsOwnedByUser(v6, Enum.AvatarItemType.Asset):catch(function(v13)
                        if v3.shouldDebugUrls() then
                            warn((("networkInterface:getIsOwnedByUser failed to check ownership of asset %*. %*"):format(v6, v13 or "")));
                        end;
                        v7(false);
                    end):await().responseBody then
                        v7(true);
                        return ;
                    else
                        v7(false);
                        return ;
                    end;
                else
                    v7(false);
                    return ;
                end;
            else
                v7(false);
                return ;
            end;
        else
            v7(false);
            return ;
        end;
    end);
end;
