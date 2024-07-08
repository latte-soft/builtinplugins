local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local _ = require(l_script_FirstAncestor_0.Core.Types.MarketplaceFiatServiceTypes);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFStringToolboxFiatMonetizableAssetTypesCSV);
local v5 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local v7 = {
    ENABLED_ASSET_TYPES = if not v5() then {} else nil, 
    MONETIZABLE_ASSET_TYPES = if not v5() then nil else {}
};
local v8 = v4();
local l_status_0, l_result_0 = pcall(function()
    for v9 in v8:gmatch("([^,]+),?") do
        local v10 = Enum.AssetType[v9];
        if not v5() then
            v7.ENABLED_ASSET_TYPES[v10.Name] = true;
        else
            v7.MONETIZABLE_ASSET_TYPES[v10.Name] = true;
        end;
    end;
end);
if not (l_status_0 or not v1.shouldDebugWarnings()) then
    warn(("Fiat error: Asset Type was not found for getFStringToolboxFiatMonetizableAssetTypesCSV: %s"):format(l_result_0));
end;
v7.isFree = function(v13)
    if not l_game_EngineFeature_0 then
        return (v13 and v13.quantity) and v13.quantity.significand == 0;
    elseif v13 and v13.quantity then
        local v14 = true;
        if v13.quantity.significand ~= 0 then
            v14 = v13.quantity.significand == nil;
        end;
        return v14;
    else
        return false;
    end;
end;
v7.calculateQuantity = function(v15)
    if v15 and v15.quantity then
        return v15.quantity.significand * 10 ^ v15.quantity.exponent;
    else
        return ;
    end;
end;
v7.stringFromCurrencyCode = function(v16)
    if v16 == "USD" then
        return "$";
    else
        return v16;
    end;
end;
v7.displayStringFromMoney = function(v17, v18)
    if not v7.isFree(v17) then
        return string.format("%s%.2f", v7.stringFromCurrencyCode(v17.currencyCode), v17.quantity.significand * 10 ^ v17.quantity.exponent);
    elseif not v18 then
        return "Free";
    else
        return (v18:getText("General", "Free"));
    end;
end;
local v19 = {
    [Enum.AssetType.Audio.Value] = "PRODUCT_TYPE_AUDIO", 
    [Enum.AssetType.Decal.Value] = "PRODUCT_TYPE_DECAL", 
    [Enum.AssetType.FontFamily.Value] = "PRODUCT_TYPE_FONT_FAMILY", 
    [Enum.AssetType.MeshPart.Value] = "PRODUCT_TYPE_MESH_PART", 
    [Enum.AssetType.Model.Value] = "PRODUCT_TYPE_MODEL", 
    [Enum.AssetType.Plugin.Value] = "PRODUCT_TYPE_PLUGIN", 
    [Enum.AssetType.Video.Value] = "PRODUCT_TYPE_VIDEO", 
    [Enum.AssetType.Package.Value] = "PRODUCT_TYPE_MODEL"
};
v7.convertAssetTypeToProductType = function(v20)
    local v21 = v19[v20];
    if v21 then
        return v21;
    else
        warn(("No product type for asset type %s"):format((tostring(v20))));
        return "PRODUCT_TYPE_INVALID";
    end;
end;
v7.getDefaultFiatProduct = function()
    return {
        basePrice = {
            currencyCode = "USD", 
            quantity = {
                significand = 0, 
                exponent = 0
            }
        }, 
        published = false, 
        purchasable = false
    };
end;
v7.createPartialFiatProductWithOnlyAssetId = function(v22, v23)
    return {
        audioAssetId = if v23 == Enum.AssetType.Audio then tostring(v22) else nil, 
        decalAssetId = if v23 == Enum.AssetType.Decal then tostring(v22) else nil, 
        meshPartAssetId = if v23 == Enum.AssetType.MeshPart then tostring(v22) else nil, 
        modelAssetId = if not (v23 ~= Enum.AssetType.Model) or v23 == Enum.AssetType.Package then tostring(v22) else nil, 
        pluginAssetId = if v23 == Enum.AssetType.Plugin then tostring(v22) else nil, 
        videoAssetId = if v23 == Enum.AssetType.Video then tostring(v22) else nil
    };
end;
v7.createFiatProduct = function(v24, v25, v26, v27, v28, v29)
    if v25 and v19[v25.Value] then
        return v3.join(v7.createPartialFiatProductWithOnlyAssetId(v24, v25), {
            basePrice = v26, 
            description = v27, 
            displayName = v28, 
            published = v29
        });
    else
        return nil;
    end;
end;
return v7;
