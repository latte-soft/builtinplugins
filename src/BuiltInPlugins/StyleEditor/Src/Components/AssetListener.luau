local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_useEffect_0 = require(l_Parent_0.Packages.React).useEffect;
local v4 = require(l_Parent_0.Src.Hooks.useDispatch);
local v5 = require(l_Parent_0.Src.Thunks.Asset.LoadBuiltinFonts);
local v6 = require(l_Parent_0.Src.Thunks.Asset.LoadToolboxFonts);
local v7 = require(l_Parent_0.Src.Thunks.Asset.LoadFontFamilyInfo);
local _ = require(l_Parent_0.Src.Types);
return function()
    local v9 = v4();
    l_useEffect_0(function()
        v9(v5());
        v9(v6());
        local v13 = l_MemStorageService_0:Bind("AddToolboxAssetToInventory", function(v10)
            local l_status_0, l_result_0 = pcall(function()
                return (l_HttpService_0:JSONDecode(v10));
            end);
            if l_status_0 and l_result_0 then
                if l_result_0.assetTypeId == Enum.AssetType.FontFamily.Value and l_result_0.assetId then
                    v9(v7({
                        (tostring(l_result_0.assetId))
                    }));
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        end);
        return function()
            if v13 then
                v13:Disconnect();
            end;
        end;
    end, {});
    return nil;
end;
