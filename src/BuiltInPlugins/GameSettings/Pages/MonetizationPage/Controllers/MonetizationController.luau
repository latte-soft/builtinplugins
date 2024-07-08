local v0 = {};
local v1 = require(script.Parent.Parent.Parent.Parent.Packages.Cryo);
local v2 = game:DefineFastInt("ListDevProductsUniverseRollout", 0);
local v3 = game:DefineFastInt("CreateUpdateDevProductRollout", 0);
v0.__index = v0;
v0.new = function(v4)
    return (setmetatable({
        __networking = v4
    }, v0));
end;
v0.economyV1GET = function(v5)
    return v5.__networking:get("economy", "/v1/resale-tax-rate");
end;
v0.configurationV2GET = function(v6, v7)
    return v6.__networking:get("develop", "/v2/universes/" .. v7 .. "/configuration");
end;
v0.configurationV2PATCH = function(v8, v9, v10)
    return v8.__networking:patch("develop", "/v2/universes/" .. v9 .. "/configuration", {
        Body = v10
    });
end;
v0.vipServersV1GET = function(v11, v12)
    return v11.__networking:get("develop", "/v1/universes/" .. v12 .. "/configuration/vip-servers");
end;
v0.developerProductsV1GET = function(v13, v14, v15)
    local l___networking_0 = v13.__networking;
    if v14 % 100 < v2 then
        return l___networking_0:get("apis", "/developer-products/v1/developer-products/list", {
            Params = {
                universeId = v14, 
                page = v15
            }
        });
    else
        return l___networking_0:get("api", "/developerproducts/list", {
            Params = {
                universeId = v14, 
                page = v15
            }
        });
    end;
end;
v0.developerProductsCreateV1POST = function(v17, v18, v19)
    local l___networking_1 = v17.__networking;
    if v18 % 100 < v3 then
        return l___networking_1:post("apis", "/developer-products/v1/universes/" .. v18 .. "/developerproducts", {
            Params = {
                name = v19.name, 
                description = " ", 
                priceInRobux = v19.price
            }, 
            Body = {}
        });
    else
        return l___networking_1:post("develop", "/v1/universes/" .. v18 .. "/developerproducts", {
            Params = {
                name = v19.name, 
                description = " ", 
                priceInRobux = v19.price
            }, 
            Body = {}
        });
    end;
end;
v0.developerProductsUpdateV1POST = function(v21, v22, v23)
    local l___networking_2 = v21.__networking;
    if v22 % 100 < v3 then
        return l___networking_2:post("apis", "/developer-products/v1/universes/" .. v22 .. "/developerproducts/" .. v23.id .. "/update", {
            Body = {
                name = v23.name, 
                priceInRobux = v23.price
            }
        });
    else
        return l___networking_2:post("develop", "/v1/universes/" .. v22 .. "/developerproducts/" .. v23.id .. "/update", {
            Body = {
                name = v23.name, 
                priceInRobux = v23.price
            }
        });
    end;
end;
v0.badgesV1GET = function(v25, v26, v27)
    return v25.__networking:get("badges", "/v1/universes/" .. v26 .. "/badges", {
        Params = {
            sortOrder = "Asc", 
            cursor = v27
        }
    });
end;
v0.getTaxRate = function(v28)
    return v28:economyV1GET():await().responseBody.taxRate;
end;
v0.getMinimumFee = function(v29)
    return v29:economyV1GET():await().responseBody.minimumFee;
end;
v0.getPaidAccessEnabled = function(v30, v31)
    return v30:configurationV2GET(v31):await().responseBody.isForSale;
end;
v0.setPaidAccessEnabled = function(v32, v33, v34)
    v32:configurationV2PATCH(v33, {
        isForSale = v34
    });
end;
v0.getPaidAccessPrice = function(v35, v36)
    return v35:configurationV2GET(v36):await().responseBody.price;
end;
v0.setPaidAccessPrice = function(v37, v38, v39)
    v37:configurationV2PATCH(v38, {
        price = v39
    });
end;
v0.getVIPServersEnabled = function(v40, v41)
    return v40:vipServersV1GET(v41):await().responseBody.isEnabled;
end;
v0.setVIPServersEnabled = function(v42, v43, v44)
    v42:configurationV2PATCH(v43, {
        allowPrivateServers = v44
    });
end;
v0.getVIPServersPrice = function(v45, v46)
    return v45:vipServersV1GET(v46):await().responseBody.price;
end;
v0.setVIPServersPrice = function(v47, v48, v49)
    v47:configurationV2PATCH(v48, {
        privateServerPrice = v49
    });
end;
v0.getVIPServersActiveServersCount = function(v50, v51)
    return v50:vipServersV1GET(v51):await().responseBody.activeServersCount;
end;
v0.getVIPServersActiveSubscriptionsCount = function(v52, v53)
    return v52:vipServersV1GET(v53):await().responseBody.activeSubscriptionsCount;
end;
v0.getDeveloperProducts = function(v54, v55, v56)
    local v57 = (not not v56 and v56.page) and v56.page or 1;
    local v58 = v54:developerProductsV1GET(v55, v57):await();
    v56 = if not v58.responseBody.FinalPage then {
        page = v57 + 1
    } else v1.None;
    local l_DeveloperProducts_0 = v58.responseBody.DeveloperProducts;
    local v60 = {};
    for _, v62 in ipairs(l_DeveloperProducts_0) do
        v60[v62.ProductId] = {
            id = v62.ProductId, 
            name = v62.Name, 
            price = v62.PriceInRobux
        };
    end;
    return v60, v56;
end;
v0.createDevProduct = function(v63, v64, v65)
    v63:developerProductsCreateV1POST(v64, v65):await();
end;
v0.updateDevProduct = function(v66, v67, v68)
    v66:developerProductsUpdateV1POST(v67, v68):await();
end;
v0.getBadges = function(v69, v70, v71)
    local v72 = v69:badgesV1GET(v70, v71):await();
    v71 = v72.responseBody.nextPageCursor;
    local l_data_0 = v72.responseBody.data;
    local v74 = {};
    for _, v76 in ipairs(l_data_0) do
        v74[v76.id] = {
            id = v76.id, 
            name = v76.name, 
            description = v76.description or "", 
            iconImageId = v76.iconImageId
        };
    end;
    return v74, v71;
end;
return v0;
