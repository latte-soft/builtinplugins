local _ = require(script.Parent.Parent.Parent.Src.Clients.ActivityHistoryClient);
local v1 = "https://www.roblox.com";
local v2 = "https://create.roblox.com";
pcall(function()
    v1 = game:GetService("ContentProvider").BaseUrl;
    v2 = string.gsub(v1, "www", "create");
end);
local function _(v3)
    return "<b>" .. v3 .. "</b>";
end;
local function _(v5)
    return "<b><u>" .. v5 .. "</u></b>";
end;
local function _(v7)
    return "<b><u>" .. v7 .. "</u></b>";
end;
local function _(v9)
    if string.lower(v9) == "true" then
        return true;
    else
        return false;
    end;
end;
joinStrings = function(v11, v12)
    return table.concat(v11, v12);
end;
local function _(v13)
    local v14 = {};
    for v15 in v13:gmatch("([^.]+)") do
        v14[#v14 + 1] = v15;
    end;
    return v14;
end;
local function _(v17, v18)
    if v17 == "Universe" then
        return v18.universeId;
    elseif v17 == "Place" then
        return v18.placeId or 0;
    else
        return v18.resourceId or 0;
    end;
end;
local function _(v20, v21)
    local l_status_0, l_result_0 = pcall(function()
        return DateTime.fromUnixTimestampMillis(v20):FormatLocalTime("MMM D, h:mm a", v21);
    end);
    if not l_status_0 then
        return "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143";
    else
        return l_result_0;
    end;
end;
local v25 = {
    "Computer", 
    "Phone", 
    "Tablet", 
    "Console", 
    "VR"
};
local v26 = {
    Computer = "DeviceType.Desktop", 
    Phone = "DeviceType.Mobile", 
    Tablet = "DeviceType.Tablet", 
    Console = "DeviceType.Console", 
    VR = "DeviceType.VR"
};
return {
    translateEvent = function(v27, v28, v29)
        local v30 = v28:getLocale();
        local v31 = v2 .. "dashboard/creations/experiences/" .. tostring(v29.universeId);
        local _ = v2 .. "dashboard/creations/experiences/" .. tostring(v29.universeId) .. "/places/" .. tostring(v29.placeId);
        local _ = v2 .. "dashboard/creations/experiences/" .. tostring(v29.universeId) .. "/badges/" .. tostring(v29.resourceId) .. "/overview";
        local _ = v2 .. "dashboard/creations/experiences/" .. tostring(v29.universeId) .. "/developer-products/" .. tostring(v29.resourceId) .. "/configure";
        local _ = v2 .. "dashboard/creations/experiences/" .. tostring(v29.universeId) .. "/passes/" .. tostring(v29.resourceId) .. "/configure";
        local _ = v1 .. "users/" .. tostring(v29.userId) .. "/profile";
        local v37 = v1 .. "users/" .. tostring(v29.resourceId) .. "/profile";
        local v38 = v1 .. "groups/" .. tostring(v29.resourceId);
        local function v44(v39, v40)
            local v41 = {};
            for v42 in v39:gmatch("([^.]+)") do
                v41[#v41 + 1] = v42;
            end;
            local l_v41_0 = v41;
            if not (l_v41_0[1] ~= nil) or l_v41_0[2] == nil then
                return "";
            else
                if v40 == nil then
                    v40 = {};
                end;
                return v28:getText(l_v41_0[1], l_v41_0[2], v40);
            end;
        end;
        local _ = function(v45)
            local v46 = "";
            local _, _ = pcall(function()
                local v47 = game:GetService("HttpService"):JSONDecode(v45.PlayableDevices);
                local v48 = {};
                for _, v50 in pairs(v47) do
                    if v25[v50] ~= nil and v26[v25[v50]] ~= nil then
                        local v51 = v26[v25[v50]];
                        local v52 = nil;
                        local v53 = {};
                        for v54 in v51:gmatch("([^.]+)") do
                            v53[#v53 + 1] = v54;
                        end;
                        local l_v53_0 = v53;
                        local v56;
                        if not (l_v53_0[1] ~= nil) or l_v53_0[2] == nil then
                            v56 = "";
                        else
                            if v52 == nil then
                                v52 = {};
                            end;
                            v56 = v28:getText(l_v53_0[1], l_v53_0[2], v52);
                        end;
                        table.insert(v48, "<b>" .. v56 .. "</b>");
                    end;
                end;
                if #v48 > 0 then
                    v46 = v44("Description.MonetizationSettingsPlayableDevices", {
                        playableDevices = joinStrings(v48, ", ")
                    });
                    return ;
                else
                    local v57 = nil;
                    local v58 = {};
                    for v59 in ("Description.MonetizationSettingsPlayableDevicesEmpty"):gmatch("([^.]+)") do
                        v58[#v58 + 1] = v59;
                    end;
                    local l_v58_0 = v58;
                    local v61;
                    if not (l_v58_0[1] ~= nil) or l_v58_0[2] == nil then
                        v61 = "";
                    else
                        if v57 == nil then
                            v57 = {};
                        end;
                        v61 = v28:getText(l_v58_0[1], l_v58_0[2], v57);
                    end;
                    v46 = v61;
                    return ;
                end;
            end);
            return v46;
        end;
        if v29.eventType == 0 then
            local v65 = {
                id = v29.id, 
                eventType = "Init", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_0 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_0_0 = l_createdUnixTimeMs_0 --[[ copy: 16 -> 77 ]];
            local l_status_2, l_result_2 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_0_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v65.date = not l_status_2 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_2;
            l_createdUnixTimeMs_0 = nil;
            l_result_2 = {};
            for v70 in ("Description.Init"):gmatch("([^.]+)") do
                l_result_2[#l_result_2 + 1] = v70;
            end;
            l_status_2 = l_result_2;
            local v71;
            if not (l_status_2[1] ~= nil) or l_status_2[2] == nil then
                v71 = "";
            else
                if l_createdUnixTimeMs_0 == nil then
                    l_createdUnixTimeMs_0 = {};
                end;
                v71 = v28:getText(l_status_2[1], l_status_2[2], l_createdUnixTimeMs_0);
            end;
            v65.translation = v71;
            v65.actorId = v29.userId;
            v65.actorName = v27(v29.userId);
            v65.iconType = "Universe";
            v65.iconId = v29.universeId;
            v65.universeId = v29.universeId;
            return v65;
        elseif v29.eventType == 1 then
            local v72 = {
                id = v29.id, 
                eventType = "ArchivedExperience", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_1 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_1_0 = l_createdUnixTimeMs_1 --[[ copy: 16 -> 76 ]];
            local l_status_3, l_result_3 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_1_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v72.date = not l_status_3 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_3;
            local v77;
            if string.lower(v29.metaData.Action) == "true" then
                l_createdUnixTimeMs_1 = nil;
                l_result_3 = {};
                for v78 in ("Description.ArchivedExperience"):gmatch("([^.]+)") do
                    l_result_3[#l_result_3 + 1] = v78;
                end;
                l_status_3 = l_result_3;
                if not (l_status_3[1] ~= nil) or l_status_3[2] == nil then
                    v77 = "";
                else
                    if l_createdUnixTimeMs_1 == nil then
                        l_createdUnixTimeMs_1 = {};
                    end;
                    v77 = v28:getText(l_status_3[1], l_status_3[2], l_createdUnixTimeMs_1);
                end;
                if v77 then
                    goto label0;
                end;
            end;
            l_createdUnixTimeMs_1 = nil;
            l_result_3 = {};
            for v79 in ("Description.RestoredExperience"):gmatch("([^.]+)") do
                l_result_3[#l_result_3 + 1] = v79;
            end;
            l_status_3 = l_result_3;
            if not (l_status_3[1] ~= nil) or l_status_3[2] == nil then
                v77 = "";
            else
                if l_createdUnixTimeMs_1 == nil then
                    l_createdUnixTimeMs_1 = {};
                end;
                v77 = v28:getText(l_status_3[1], l_status_3[2], l_createdUnixTimeMs_1);
            end;
            ::label0::;
            v72.translation = v77;
            v72.actorId = v29.userId;
            v72.actorName = v27(v29.userId);
            v72.iconType = "Universe";
            v72.iconId = v29.universeId;
            v72.universeId = v29.universeId;
            return v72;
        elseif v29.eventType == 2 then
            local v80 = {
                id = v29.id, 
                eventType = "PlayabilityChanged", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_2 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_2_0 = l_createdUnixTimeMs_2 --[[ copy: 16 -> 75 ]];
            local l_status_4, l_result_4 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_2_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v80.date = not l_status_4 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_4;
            local l_v44_0 = v44;
            l_createdUnixTimeMs_2 = "Description.PlayabilityChanged";
            l_status_4 = {};
            local v86, v87, v88, v89;
            if v29.metaData.Playability == "Public" then
                v86 = nil;
                v87 = {};
                for v90 in ("Description.ActionPublic"):gmatch("([^.]+)") do
                    v87[#v87 + 1] = v90;
                end;
                v88 = v87;
                if not (v88[1] ~= nil) or v88[2] == nil then
                    v89 = "";
                else
                    if v86 == nil then
                        v86 = {};
                    end;
                    v89 = v28:getText(v88[1], v88[2], v86);
                end;
                if v89 then
                    goto label1;
                end;
            end;
            if v29.metaData.Playability == "Private" then
                v86 = nil;
                v87 = {};
                for v91 in ("Description.ActionPrivate"):gmatch("([^.]+)") do
                    v87[#v87 + 1] = v91;
                end;
                v88 = v87;
                if not (v88[1] ~= nil) or v88[2] == nil then
                    v89 = "";
                else
                    if v86 == nil then
                        v86 = {};
                    end;
                    v89 = v28:getText(v88[1], v88[2], v86);
                end;
                if v89 then
                    goto label1;
                end;
            end;
            v86 = nil;
            v87 = {};
            for v92 in ("Description.ActionFriends"):gmatch("([^.]+)") do
                v87[#v87 + 1] = v92;
            end;
            v88 = v87;
            if not (v88[1] ~= nil) or v88[2] == nil then
                v89 = "";
            else
                if v86 == nil then
                    v86 = {};
                end;
                v89 = v28:getText(v88[1], v88[2], v86);
            end;
            ::label1::;
            l_status_4.playability = "<b>" .. v89 .. "</b>";
            v80.translation = l_v44_0(l_createdUnixTimeMs_2, l_status_4);
            v80.actorId = v29.userId;
            v80.actorName = v27(v29.userId);
            v80.iconType = "Universe";
            v80.iconId = v29.universeId;
            v80.universeId = v29.universeId;
            v80.viewBasicSettingsLink = "" .. tostring(v31) .. "/configure";
            return v80;
        elseif v29.eventType == 3 then
            local v93 = {
                id = v29.id, 
                eventType = "NotificationStringCreated", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_3 = v29.createdUnixTimeMs;
            local l_status_5, l_result_5 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_3):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v93.date = not l_status_5 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_5;
            v93.translation = v44("Description.NotificationStringCreated", {
                stringName = "<b>" .. v29.metaData.StringName .. "</b>"
            });
            v93.actorId = v29.userId;
            v93.actorName = v27(v29.userId);
            v93.iconType = "Universe";
            v93.iconId = v29.universeId;
            v93.universeId = v29.universeId;
            v93.viewBasicSettingsLink = "" .. tostring(v31) .. "/notifications";
            return v93;
        elseif v29.eventType == 4 then
            local v97 = {
                id = v29.id, 
                eventType = "NotificationStringDeleted", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_4 = v29.createdUnixTimeMs;
            local l_status_6, l_result_6 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_4):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v97.date = not l_status_6 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_6;
            v97.translation = v44("Description.NotificationStringDeleted", {
                stringName = "<b>" .. v29.metaData.StringName .. "</b>"
            });
            v97.actorId = v29.userId;
            v97.actorName = v27(v29.userId);
            v97.iconType = "Universe";
            v97.iconId = v29.universeId;
            v97.universeId = v29.universeId;
            v97.viewBasicSettingsLink = "" .. tostring(v31) .. "/notifications";
            return v97;
        elseif v29.eventType == 5 then
            local v101 = {
                id = v29.id, 
                eventType = "NotificationStringUpdated", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_5 = v29.createdUnixTimeMs;
            local l_status_7, l_result_7 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_5):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v101.date = not l_status_7 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_7;
            v101.translation = v44("Description.NotificationStringUpdated", {
                stringName = "<b>" .. v29.metaData.StringName .. "</b>"
            });
            v101.actorId = v29.userId;
            v101.actorName = v27(v29.userId);
            v101.iconType = "Universe";
            v101.iconId = v29.universeId;
            v101.universeId = v29.universeId;
            v101.viewBasicSettingsLink = "" .. tostring(v31) .. "/notifications";
            return v101;
        elseif v29.eventType == 6 then
            local v105 = {
                id = v29.id, 
                eventType = "AvatarSettingsAvatarType", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_6 = v29.createdUnixTimeMs;
            local l_status_8, l_result_8 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_6):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v105.date = not l_status_8 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_8;
            v105.translation = v44("Description.AvatarSettingsAvatarType", {
                avatarType = "<b>" .. v29.metaData.AvatarType .. "</b>"
            });
            v105.actorId = v29.userId;
            v105.actorName = v27(v29.userId);
            v105.iconType = "Universe";
            v105.iconId = v29.universeId;
            v105.universeId = v29.universeId;
            return v105;
        elseif v29.eventType == 7 then
            local v109 = {
                id = v29.id, 
                eventType = "AvatarSettingsAnimation", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_7 = v29.createdUnixTimeMs;
            local l_status_9, l_result_9 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_7):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v109.date = not l_status_9 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_9;
            v109.translation = v44("Description.AvatarSettingsAnimation", {
                animation = "<b>" .. v29.metaData.Animation .. "</b>"
            });
            v109.actorId = v29.userId;
            v109.actorName = v27(v29.userId);
            v109.iconType = "Universe";
            v109.iconId = v29.universeId;
            v109.universeId = v29.universeId;
            return v109;
        elseif v29.eventType == 8 then
            local v113 = {
                id = v29.id, 
                eventType = "AvatarSettingsCollision", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_8 = v29.createdUnixTimeMs;
            local l_status_10, l_result_10 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_8):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v113.date = not l_status_10 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_10;
            v113.translation = v44("Description.AvatarSettingsCollision", {
                collision = "<b>" .. v29.metaData.Collision .. "</b>"
            });
            v113.actorId = v29.userId;
            v113.actorName = v27(v29.userId);
            v113.iconType = "Universe";
            v113.iconId = v29.universeId;
            v113.universeId = v29.universeId;
            return v113;
        elseif v29.eventType == 9 then
            local v117 = {
                id = v29.id, 
                eventType = "AvatarSettingsScaleHeight", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_9 = v29.createdUnixTimeMs;
            local l_status_11, l_result_11 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_9):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v117.date = not l_status_11 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_11;
            v117.translation = v44("Description.AvatarSettingsScaleHeight", {
                scale = "<b>" .. v29.metaData.Scale .. "</b>"
            });
            v117.actorId = v29.userId;
            v117.actorName = v27(v29.userId);
            v117.iconType = "Universe";
            v117.iconId = v29.universeId;
            v117.universeId = v29.universeId;
            return v117;
        elseif v29.eventType == 10 then
            local v121 = {
                id = v29.id, 
                eventType = "AvatarSettingsScaleWidth", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_10 = v29.createdUnixTimeMs;
            local l_status_12, l_result_12 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_10):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v121.date = not l_status_12 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_12;
            v121.translation = v44("Description.AvatarSettingsScaleWidth", {
                scale = "<b>" .. v29.metaData.Scale .. "</b>"
            });
            v121.actorId = v29.userId;
            v121.actorName = v27(v29.userId);
            v121.iconType = "Universe";
            v121.iconId = v29.universeId;
            v121.universeId = v29.universeId;
            return v121;
        elseif v29.eventType == 11 then
            local v125 = {
                id = v29.id, 
                eventType = "AvatarSettingsScaleHead", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_11 = v29.createdUnixTimeMs;
            local l_status_13, l_result_13 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_11):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v125.date = not l_status_13 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_13;
            v125.translation = v44("Description.AvatarSettingsScaleHead", {
                scale = "<b>" .. v29.metaData.Scale .. "</b>"
            });
            v125.actorId = v29.userId;
            v125.actorName = v27(v29.userId);
            v125.iconType = "Universe";
            v125.iconId = v29.universeId;
            v125.universeId = v29.universeId;
            return v125;
        elseif v29.eventType == 12 then
            local v129 = {
                id = v29.id, 
                eventType = "AvatarSettingsScaleBodyType", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_12 = v29.createdUnixTimeMs;
            local l_status_14, l_result_14 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_12):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v129.date = not l_status_14 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_14;
            v129.translation = v44("Description.AvatarSettingsScaleBodyType", {
                scale = "<b>" .. v29.metaData.Scale .. "</b>"
            });
            v129.actorId = v29.userId;
            v129.actorName = v27(v29.userId);
            v129.iconType = "Universe";
            v129.iconId = v29.universeId;
            v129.universeId = v29.universeId;
            return v129;
        elseif v29.eventType == 13 then
            local v133 = {
                id = v29.id, 
                eventType = "AvatarSettingsScaleProportions", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_13 = v29.createdUnixTimeMs;
            local l_status_15, l_result_15 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_13):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v133.date = not l_status_15 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_15;
            v133.translation = v44("Description.AvatarSettingsScaleProportions", {
                scale = "<b>" .. v29.metaData.Scale .. "</b>"
            });
            v133.actorId = v29.userId;
            v133.actorName = v27(v29.userId);
            v133.iconType = "Universe";
            v133.iconId = v29.universeId;
            v133.universeId = v29.universeId;
            return v133;
        elseif v29.eventType == 14 then
            local v137 = {
                id = v29.id, 
                eventType = "AvatarSettingsBodyParts", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_14 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_14_0 = l_createdUnixTimeMs_14 --[[ copy: 16 -> 74 ]];
            local l_status_16, l_result_16 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_14_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v137.date = not l_status_16 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_16;
            l_createdUnixTimeMs_14 = nil;
            l_result_16 = {};
            for v142 in ("Description.AvatarSettingsBodyParts"):gmatch("([^.]+)") do
                l_result_16[#l_result_16 + 1] = v142;
            end;
            l_status_16 = l_result_16;
            local v143;
            if not (l_status_16[1] ~= nil) or l_status_16[2] == nil then
                v143 = "";
            else
                if l_createdUnixTimeMs_14 == nil then
                    l_createdUnixTimeMs_14 = {};
                end;
                v143 = v28:getText(l_status_16[1], l_status_16[2], l_createdUnixTimeMs_14);
            end;
            v137.translation = v143;
            v137.actorId = v29.userId;
            v137.actorName = v27(v29.userId);
            v137.iconType = "Universe";
            v137.iconId = v29.universeId;
            v137.universeId = v29.universeId;
            return v137;
        elseif v29.eventType == 15 then
            local v144 = {
                id = v29.id, 
                eventType = "AvatarSettingsClothing", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_15 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_15_0 = l_createdUnixTimeMs_15 --[[ copy: 16 -> 73 ]];
            local l_status_17, l_result_17 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_15_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v144.date = not l_status_17 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_17;
            l_createdUnixTimeMs_15 = nil;
            l_result_17 = {};
            for v149 in ("Description.AvatarSettingsClothing"):gmatch("([^.]+)") do
                l_result_17[#l_result_17 + 1] = v149;
            end;
            l_status_17 = l_result_17;
            local v150;
            if not (l_status_17[1] ~= nil) or l_status_17[2] == nil then
                v150 = "";
            else
                if l_createdUnixTimeMs_15 == nil then
                    l_createdUnixTimeMs_15 = {};
                end;
                v150 = v28:getText(l_status_17[1], l_status_17[2], l_createdUnixTimeMs_15);
            end;
            v144.translation = v150;
            v144.actorId = v29.userId;
            v144.actorName = v27(v29.userId);
            v144.iconType = "Universe";
            v144.iconId = v29.universeId;
            v144.universeId = v29.universeId;
            return v144;
        elseif v29.eventType == 16 then
            local v151 = {
                id = v29.id, 
                eventType = "ExperienceName", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_16 = v29.createdUnixTimeMs;
            local l_status_18, l_result_18 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_16):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v151.date = not l_status_18 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_18;
            v151.translation = v44("Description.ExperienceName", {
                newName = "<b><u>" .. v29.metaData.NewName .. "</u></b>", 
                oldName = "<b><u>" .. v29.metaData.OldName .. "</u></b>"
            });
            v151.actorId = v29.userId;
            v151.actorName = v27(v29.userId);
            v151.iconType = "Universe";
            v151.iconId = v29.universeId;
            v151.universeId = v29.universeId;
            v151.viewBasicSettingsLink = "" .. tostring(v31) .. "/configure";
            return v151;
        elseif v29.eventType == 17 then
            local v155 = {
                id = v29.id, 
                eventType = "ExperienceDescription", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_17 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_17_0 = l_createdUnixTimeMs_17 --[[ copy: 16 -> 72 ]];
            local l_status_19, l_result_19 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_17_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v155.date = not l_status_19 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_19;
            l_createdUnixTimeMs_17 = nil;
            l_result_19 = {};
            for v160 in ("Description.ExperienceDescription"):gmatch("([^.]+)") do
                l_result_19[#l_result_19 + 1] = v160;
            end;
            l_status_19 = l_result_19;
            local v161;
            if not (l_status_19[1] ~= nil) or l_status_19[2] == nil then
                v161 = "";
            else
                if l_createdUnixTimeMs_17 == nil then
                    l_createdUnixTimeMs_17 = {};
                end;
                v161 = v28:getText(l_status_19[1], l_status_19[2], l_createdUnixTimeMs_17);
            end;
            v155.translation = v161;
            v155.actorId = v29.userId;
            v155.actorName = v27(v29.userId);
            v155.iconType = "Universe";
            v155.iconId = v29.universeId;
            v155.universeId = v29.universeId;
            v155.viewBasicSettingsLink = "" .. tostring(v31) .. "/configure";
            return v155;
        elseif v29.eventType == 18 then
            local v162 = {
                id = v29.id, 
                eventType = "ExperienceGenre", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_18 = v29.createdUnixTimeMs;
            local l_status_20, l_result_20 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_18):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v162.date = not l_status_20 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_20;
            v162.translation = v44("Description.ExperienceGenre", {
                genre = "<b>" .. v29.metaData.Genre .. "</b>"
            });
            v162.actorId = v29.userId;
            v162.actorName = v27(v29.userId);
            v162.iconType = "Universe";
            v162.iconId = v29.universeId;
            v162.universeId = v29.universeId;
            v162.viewBasicSettingsLink = "" .. tostring(v31) .. "/configure";
            return v162;
        elseif v29.eventType == 19 then
            local v166 = {
                id = v29.id, 
                eventType = "SecuritySettingsHTTPRequests", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_19 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_19_0 = l_createdUnixTimeMs_19 --[[ copy: 16 -> 71 ]];
            local l_status_21, l_result_21 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_19_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v166.date = not l_status_21 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_21;
            local l_v44_1 = v44;
            l_createdUnixTimeMs_19 = "Description.SecuritySettingsHTTPRequests";
            l_status_21 = {};
            local v172, v173, v174, v175;
            if string.lower(v29.metaData.Action) == "true" then
                v173 = nil;
                v174 = {};
                for v176 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v174[#v174 + 1] = v176;
                end;
                v175 = v174;
                if not (v175[1] ~= nil) or v175[2] == nil then
                    v172 = "";
                else
                    if v173 == nil then
                        v173 = {};
                    end;
                    v172 = v28:getText(v175[1], v175[2], v173);
                end;
                if v172 then
                    goto label2;
                end;
            end;
            v173 = nil;
            v174 = {};
            for v177 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v174[#v174 + 1] = v177;
            end;
            v175 = v174;
            if not (v175[1] ~= nil) or v175[2] == nil then
                v172 = "";
            else
                if v173 == nil then
                    v173 = {};
                end;
                v172 = v28:getText(v175[1], v175[2], v173);
            end;
            ::label2::;
            l_status_21.action = "<b>" .. v172 .. "</b>";
            v166.translation = l_v44_1(l_createdUnixTimeMs_19, l_status_21);
            v166.actorId = v29.userId;
            v166.actorName = v27(v29.userId);
            v166.iconType = "Universe";
            v166.iconId = v29.universeId;
            v166.universeId = v29.universeId;
            return v166;
        elseif v29.eventType == 20 then
            local v178 = {
                id = v29.id, 
                eventType = "SecuritySettingsStudioAccessToAPI", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_20 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_20_0 = l_createdUnixTimeMs_20 --[[ copy: 16 -> 70 ]];
            local l_status_22, l_result_22 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_20_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v178.date = not l_status_22 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_22;
            local l_v44_2 = v44;
            l_createdUnixTimeMs_20 = "Description.SecuritySettingsStudioAccessToAPI";
            l_status_22 = {};
            local v184, v185, v186, v187;
            if string.lower(v29.metaData.Action) == "true" then
                v185 = nil;
                v186 = {};
                for v188 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v186[#v186 + 1] = v188;
                end;
                v187 = v186;
                if not (v187[1] ~= nil) or v187[2] == nil then
                    v184 = "";
                else
                    if v185 == nil then
                        v185 = {};
                    end;
                    v184 = v28:getText(v187[1], v187[2], v185);
                end;
                if v184 then
                    goto label3;
                end;
            end;
            v185 = nil;
            v186 = {};
            for v189 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v186[#v186 + 1] = v189;
            end;
            v187 = v186;
            if not (v187[1] ~= nil) or v187[2] == nil then
                v184 = "";
            else
                if v185 == nil then
                    v185 = {};
                end;
                v184 = v28:getText(v187[1], v187[2], v185);
            end;
            ::label3::;
            l_status_22.action = "<b>" .. v184 .. "</b>";
            v178.translation = l_v44_2(l_createdUnixTimeMs_20, l_status_22);
            v178.actorId = v29.userId;
            v178.actorName = v27(v29.userId);
            v178.iconType = "Universe";
            v178.iconId = v29.universeId;
            v178.universeId = v29.universeId;
            v178.viewBasicSettingsLink = "" .. tostring(v31) .. "/configure";
            return v178;
        elseif v29.eventType == 21 then
            local v190 = {
                id = v29.id, 
                eventType = "SecuritySettingsThirdPartySales", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_21 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_21_0 = l_createdUnixTimeMs_21 --[[ copy: 16 -> 69 ]];
            local l_status_23, l_result_23 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_21_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v190.date = not l_status_23 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_23;
            local l_v44_3 = v44;
            l_createdUnixTimeMs_21 = "Description.SecuritySettingsThirdPartySales";
            l_status_23 = {};
            local v196, v197, v198, v199;
            if string.lower(v29.metaData.Action) == "true" then
                v197 = nil;
                v198 = {};
                for v200 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v198[#v198 + 1] = v200;
                end;
                v199 = v198;
                if not (v199[1] ~= nil) or v199[2] == nil then
                    v196 = "";
                else
                    if v197 == nil then
                        v197 = {};
                    end;
                    v196 = v28:getText(v199[1], v199[2], v197);
                end;
                if v196 then
                    goto label4;
                end;
            end;
            v197 = nil;
            v198 = {};
            for v201 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v198[#v198 + 1] = v201;
            end;
            v199 = v198;
            if not (v199[1] ~= nil) or v199[2] == nil then
                v196 = "";
            else
                if v197 == nil then
                    v197 = {};
                end;
                v196 = v28:getText(v199[1], v199[2], v197);
            end;
            ::label4::;
            l_status_23.action = "<b>" .. v196 .. "</b>";
            v190.translation = l_v44_3(l_createdUnixTimeMs_21, l_status_23);
            v190.actorId = v29.userId;
            v190.actorName = v27(v29.userId);
            v190.iconType = "Universe";
            v190.iconId = v29.universeId;
            v190.universeId = v29.universeId;
            return v190;
        elseif v29.eventType == 22 then
            local v202 = {
                id = v29.id, 
                eventType = "SecuritySettingsThirdPartyTeleports", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_22 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_22_0 = l_createdUnixTimeMs_22 --[[ copy: 16 -> 68 ]];
            local l_status_24, l_result_24 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_22_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v202.date = not l_status_24 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_24;
            local l_v44_4 = v44;
            l_createdUnixTimeMs_22 = "Description.SecuritySettingsThirdPartyTeleports";
            l_status_24 = {};
            local v208, v209, v210, v211;
            if string.lower(v29.metaData.Action) == "true" then
                v209 = nil;
                v210 = {};
                for v212 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v210[#v210 + 1] = v212;
                end;
                v211 = v210;
                if not (v211[1] ~= nil) or v211[2] == nil then
                    v208 = "";
                else
                    if v209 == nil then
                        v209 = {};
                    end;
                    v208 = v28:getText(v211[1], v211[2], v209);
                end;
                if v208 then
                    goto label5;
                end;
            end;
            v209 = nil;
            v210 = {};
            for v213 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v210[#v210 + 1] = v213;
            end;
            v211 = v210;
            if not (v211[1] ~= nil) or v211[2] == nil then
                v208 = "";
            else
                if v209 == nil then
                    v209 = {};
                end;
                v208 = v28:getText(v211[1], v211[2], v209);
            end;
            ::label5::;
            l_status_24.action = "<b>" .. v208 .. "</b>";
            v202.translation = l_v44_4(l_createdUnixTimeMs_22, l_status_24);
            v202.actorId = v29.userId;
            v202.actorName = v27(v29.userId);
            v202.iconType = "Universe";
            v202.iconId = v29.universeId;
            v202.universeId = v29.universeId;
            return v202;
        elseif v29.eventType == 23 then
            local v214 = {
                id = v29.id, 
                eventType = "ExperienceShutDown", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_23 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_23_0 = l_createdUnixTimeMs_23 --[[ copy: 16 -> 67 ]];
            local l_status_25, l_result_25 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_23_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v214.date = not l_status_25 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_25;
            l_createdUnixTimeMs_23 = nil;
            l_result_25 = {};
            for v219 in ("Description.ExperienceShutDown"):gmatch("([^.]+)") do
                l_result_25[#l_result_25 + 1] = v219;
            end;
            l_status_25 = l_result_25;
            local v220;
            if not (l_status_25[1] ~= nil) or l_status_25[2] == nil then
                v220 = "";
            else
                if l_createdUnixTimeMs_23 == nil then
                    l_createdUnixTimeMs_23 = {};
                end;
                v220 = v28:getText(l_status_25[1], l_status_25[2], l_createdUnixTimeMs_23);
            end;
            v214.translation = v220;
            v214.actorId = v29.userId;
            v214.actorName = v27(v29.userId);
            v214.iconType = "Universe";
            v214.iconId = v29.universeId;
            v214.universeId = v29.universeId;
            return v214;
        elseif v29.eventType == 24 then
            local v221 = {
                id = v29.id, 
                eventType = "SocialLinksAdded", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_24 = v29.createdUnixTimeMs;
            local l_status_26, l_result_26 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_24):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v221.date = not l_status_26 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_26;
            v221.translation = v44("Description.SocialLinksAdded", {
                channel = "<b>" .. v29.metaData.Channel .. "</b>"
            });
            v221.actorId = v29.userId;
            v221.actorName = v27(v29.userId);
            v221.iconType = "Universe";
            v221.iconId = v29.universeId;
            v221.universeId = v29.universeId;
            v221.viewBasicSettingsLink = "" .. tostring(v31) .. "/social-links";
            return v221;
        elseif v29.eventType == 25 then
            local v225 = {
                id = v29.id, 
                eventType = "SocialLinksRemoved", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_25 = v29.createdUnixTimeMs;
            local l_status_27, l_result_27 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_25):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v225.date = not l_status_27 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_27;
            v225.translation = v44("Description.SocialLinksRemoved", {
                channel = "<b>" .. v29.metaData.Channel .. "</b>"
            });
            v225.actorId = v29.userId;
            v225.actorName = v27(v29.userId);
            v225.iconType = "Universe";
            v225.iconId = v29.universeId;
            v225.universeId = v29.universeId;
            v225.viewBasicSettingsLink = "" .. tostring(v31) .. "/social-links";
            return v225;
        elseif v29.eventType == 26 then
            local v229 = {
                id = v29.id, 
                eventType = "SocialLinksUpdated", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_26 = v29.createdUnixTimeMs;
            local l_status_28, l_result_28 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_26):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v229.date = not l_status_28 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_28;
            v229.translation = v44("Description.SocialLinksUpdated", {
                channel = "<b>" .. v29.metaData.Channel .. "</b>"
            });
            v229.actorId = v29.userId;
            v229.actorName = v27(v29.userId);
            v229.iconType = "Universe";
            v229.iconId = v29.universeId;
            v229.universeId = v29.universeId;
            v229.viewBasicSettingsLink = "" .. tostring(v31) .. "/social-links";
            return v229;
        elseif v29.eventType == 27 then
            local v233 = {
                id = v29.id, 
                eventType = "SpatialVoice", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_27 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_27_0 = l_createdUnixTimeMs_27 --[[ copy: 16 -> 66 ]];
            local l_status_29, l_result_29 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_27_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v233.date = not l_status_29 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_29;
            local l_v44_5 = v44;
            l_createdUnixTimeMs_27 = "Description.SpatialVoice";
            l_status_29 = {};
            local v239, v240, v241, v242;
            if string.lower(v29.metaData.Action) == "true" then
                v240 = nil;
                v241 = {};
                for v243 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v241[#v241 + 1] = v243;
                end;
                v242 = v241;
                if not (v242[1] ~= nil) or v242[2] == nil then
                    v239 = "";
                else
                    if v240 == nil then
                        v240 = {};
                    end;
                    v239 = v28:getText(v242[1], v242[2], v240);
                end;
                if v239 then
                    goto label6;
                end;
            end;
            v240 = nil;
            v241 = {};
            for v244 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v241[#v241 + 1] = v244;
            end;
            v242 = v241;
            if not (v242[1] ~= nil) or v242[2] == nil then
                v239 = "";
            else
                if v240 == nil then
                    v240 = {};
                end;
                v239 = v28:getText(v242[1], v242[2], v240);
            end;
            ::label6::;
            l_status_29.action = "<b>" .. v239 .. "</b>";
            v233.translation = l_v44_5(l_createdUnixTimeMs_27, l_status_29);
            v233.actorId = v29.userId;
            v233.actorName = v27(v29.userId);
            v233.iconType = "Universe";
            v233.iconId = v29.universeId;
            v233.universeId = v29.universeId;
            return v233;
        elseif v29.eventType == 28 then
            local v245 = {
                id = v29.id, 
                eventType = "WorldSettingsWorkSpaceGravity", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_28 = v29.createdUnixTimeMs;
            local l_status_30, l_result_30 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_28):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v245.date = not l_status_30 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_30;
            v245.translation = v44("Description.WorldSettingsWorkSpaceGravity", {
                gravity = "<b>" .. v29.metaData.Gravity .. "</b>"
            });
            v245.actorId = v29.userId;
            v245.actorName = v27(v29.userId);
            v245.iconType = "Universe";
            v245.iconId = v29.universeId;
            v245.universeId = v29.universeId;
            return v245;
        elseif v29.eventType == 29 then
            local v249 = {
                id = v29.id, 
                eventType = "WorldSettingsJumpHeight", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_29 = v29.createdUnixTimeMs;
            local l_status_31, l_result_31 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_29):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v249.date = not l_status_31 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_31;
            v249.translation = v44("Description.WorldSettingsJumpHeight", {
                jumpHeight = "<b>" .. v29.metaData.JumpHeight .. "</b>"
            });
            v249.actorId = v29.userId;
            v249.actorName = v27(v29.userId);
            v249.iconType = "Universe";
            v249.iconId = v29.universeId;
            v249.universeId = v29.universeId;
            return v249;
        elseif v29.eventType == 30 then
            local v253 = {
                id = v29.id, 
                eventType = "WorldSettingsJumpPower", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_30 = v29.createdUnixTimeMs;
            local l_status_32, l_result_32 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_30):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v253.date = not l_status_32 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_32;
            v253.translation = v44("Description.WorldSettingsJumpPower", {
                jumpPower = "<b>" .. v29.metaData.JumpPower .. "</b>"
            });
            v253.actorId = v29.userId;
            v253.actorName = v27(v29.userId);
            v253.iconType = "Universe";
            v253.iconId = v29.universeId;
            v253.universeId = v29.universeId;
            return v253;
        elseif v29.eventType == 31 then
            local v257 = {
                id = v29.id, 
                eventType = "WorldSettingsWalkSpeed", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_31 = v29.createdUnixTimeMs;
            local l_status_33, l_result_33 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_31):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v257.date = not l_status_33 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_33;
            v257.translation = v44("Description.WorldSettingsWalkSpeed", {
                walkSpeed = "<b>" .. v29.metaData.WalkSpeed .. "</b>"
            });
            v257.actorId = v29.userId;
            v257.actorName = v27(v29.userId);
            v257.iconType = "Universe";
            v257.iconId = v29.universeId;
            v257.universeId = v29.universeId;
            return v257;
        elseif v29.eventType == 32 then
            local v261 = {
                id = v29.id, 
                eventType = "WorldSettingsMaxSlopeAngle", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_32 = v29.createdUnixTimeMs;
            local l_status_34, l_result_34 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_32):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v261.date = not l_status_34 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_34;
            v261.translation = v44("Description.WorldSettingsMaxSlopeAngle", {
                maxSlopeAngle = "<b>" .. v29.metaData.MaxSlopeAngle .. "</b>"
            });
            v261.actorId = v29.userId;
            v261.actorName = v27(v29.userId);
            v261.iconType = "Universe";
            v261.iconId = v29.universeId;
            v261.universeId = v29.universeId;
            return v261;
        elseif v29.eventType == 33 then
            local v265 = {
                id = v29.id, 
                eventType = "SentUpdate", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_33 = v29.createdUnixTimeMs;
            local l_status_35, l_result_35 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_33):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v265.date = not l_status_35 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_35;
            v265.translation = v44("Description.SentUpdate", {
                update = "<b>" .. v29.metaData.Update .. "</b>"
            });
            v265.actorId = v29.userId;
            v265.actorName = v27(v29.userId);
            v265.iconType = "Universe";
            v265.iconId = v29.universeId;
            v265.universeId = v29.universeId;
            v265.viewBasicSettingsLink = "" .. tostring(v31) .. "/updates";
            return v265;
        elseif v29.eventType == 34 then
            local v269 = {
                id = v29.id, 
                eventType = "SupportedLanguages", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_34 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_34_0 = l_createdUnixTimeMs_34 --[[ copy: 16 -> 65 ]];
            local l_status_36, l_result_36 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_34_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v269.date = not l_status_36 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_36;
            local l_v44_6 = v44;
            l_createdUnixTimeMs_34 = "Description.SupportedLanguages";
            l_status_36 = {
                language = "<b>" .. v29.metaData.Language .. "</b>"
            };
            local v275, v276, v277, v278;
            if string.lower(v29.metaData.Action) == "true" then
                v276 = nil;
                v277 = {};
                for v279 in ("Description.ActionAdded"):gmatch("([^.]+)") do
                    v277[#v277 + 1] = v279;
                end;
                v278 = v277;
                if not (v278[1] ~= nil) or v278[2] == nil then
                    v275 = "";
                else
                    if v276 == nil then
                        v276 = {};
                    end;
                    v275 = v28:getText(v278[1], v278[2], v276);
                end;
                if v275 then
                    goto label7;
                end;
            end;
            v276 = nil;
            v277 = {};
            for v280 in ("Description.ActionRemoved"):gmatch("([^.]+)") do
                v277[#v277 + 1] = v280;
            end;
            v278 = v277;
            if not (v278[1] ~= nil) or v278[2] == nil then
                v275 = "";
            else
                if v276 == nil then
                    v276 = {};
                end;
                v275 = v28:getText(v278[1], v278[2], v276);
            end;
            ::label7::;
            l_status_36.action = "<b>" .. v275 .. "</b>";
            v269.translation = l_v44_6(l_createdUnixTimeMs_34, l_status_36);
            v269.actorId = v29.userId;
            v269.actorName = v27(v29.userId);
            v269.iconType = "Universe";
            v269.iconId = v29.universeId;
            v269.universeId = v29.universeId;
            v269.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization";
            return v269;
        elseif v29.eventType == 35 then
            local v281 = {
                id = v29.id, 
                eventType = "AutoTranslationExperienceInformation", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_35 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_35_0 = l_createdUnixTimeMs_35 --[[ copy: 16 -> 64 ]];
            local l_status_37, l_result_37 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_35_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v281.date = not l_status_37 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_37;
            local l_v44_7 = v44;
            l_createdUnixTimeMs_35 = "Description.AutoTranslationExperienceInformation";
            l_status_37 = {
                language = "<b>" .. v29.metaData.Language .. "</b>"
            };
            local v287, v288, v289, v290;
            if string.lower(v29.metaData.Action) == "true" then
                v288 = nil;
                v289 = {};
                for v291 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v289[#v289 + 1] = v291;
                end;
                v290 = v289;
                if not (v290[1] ~= nil) or v290[2] == nil then
                    v287 = "";
                else
                    if v288 == nil then
                        v288 = {};
                    end;
                    v287 = v28:getText(v290[1], v290[2], v288);
                end;
                if v287 then
                    goto label8;
                end;
            end;
            v288 = nil;
            v289 = {};
            for v292 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v289[#v289 + 1] = v292;
            end;
            v290 = v289;
            if not (v290[1] ~= nil) or v290[2] == nil then
                v287 = "";
            else
                if v288 == nil then
                    v288 = {};
                end;
                v287 = v28:getText(v290[1], v290[2], v288);
            end;
            ::label8::;
            l_status_37.action = "<b>" .. v287 .. "</b>";
            v281.translation = l_v44_7(l_createdUnixTimeMs_35, l_status_37);
            v281.actorId = v29.userId;
            v281.actorName = v27(v29.userId);
            v281.iconType = "Universe";
            v281.iconId = v29.universeId;
            v281.universeId = v29.universeId;
            v281.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization";
            return v281;
        elseif v29.eventType == 36 then
            local v293 = {
                id = v29.id, 
                eventType = "AutoTranslationExperienceStringsAndProducts", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_36 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_36_0 = l_createdUnixTimeMs_36 --[[ copy: 16 -> 63 ]];
            local l_status_38, l_result_38 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_36_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v293.date = not l_status_38 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_38;
            local l_v44_8 = v44;
            l_createdUnixTimeMs_36 = "Description.AutoTranslationExperienceStringsAndProducts";
            l_status_38 = {
                language = "<b>" .. v29.metaData.Language .. "</b>"
            };
            local v299, v300, v301, v302;
            if string.lower(v29.metaData.Action) == "true" then
                v300 = nil;
                v301 = {};
                for v303 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v301[#v301 + 1] = v303;
                end;
                v302 = v301;
                if not (v302[1] ~= nil) or v302[2] == nil then
                    v299 = "";
                else
                    if v300 == nil then
                        v300 = {};
                    end;
                    v299 = v28:getText(v302[1], v302[2], v300);
                end;
                if v299 then
                    goto label9;
                end;
            end;
            v300 = nil;
            v301 = {};
            for v304 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v301[#v301 + 1] = v304;
            end;
            v302 = v301;
            if not (v302[1] ~= nil) or v302[2] == nil then
                v299 = "";
            else
                if v300 == nil then
                    v300 = {};
                end;
                v299 = v28:getText(v302[1], v302[2], v300);
            end;
            ::label9::;
            l_status_38.action = "<b>" .. v299 .. "</b>";
            v293.translation = l_v44_8(l_createdUnixTimeMs_36, l_status_38);
            v293.actorId = v29.userId;
            v293.actorName = v27(v29.userId);
            v293.iconType = "Universe";
            v293.iconId = v29.universeId;
            v293.universeId = v29.universeId;
            v293.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization";
            return v293;
        elseif v29.eventType == 37 then
            local v305 = {
                id = v29.id, 
                eventType = "LocalizationSettingsAutomaticTextCapture", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_37 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_37_0 = l_createdUnixTimeMs_37 --[[ copy: 16 -> 62 ]];
            local l_status_39, l_result_39 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_37_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v305.date = not l_status_39 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_39;
            local l_v44_9 = v44;
            l_createdUnixTimeMs_37 = "Description.LocalizationSettingsAutomaticTextCapture";
            l_status_39 = {};
            local v311, v312, v313, v314;
            if string.lower(v29.metaData.Action) == "true" then
                v312 = nil;
                v313 = {};
                for v315 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v313[#v313 + 1] = v315;
                end;
                v314 = v313;
                if not (v314[1] ~= nil) or v314[2] == nil then
                    v311 = "";
                else
                    if v312 == nil then
                        v312 = {};
                    end;
                    v311 = v28:getText(v314[1], v314[2], v312);
                end;
                if v311 then
                    goto label10;
                end;
            end;
            v312 = nil;
            v313 = {};
            for v316 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v313[#v313 + 1] = v316;
            end;
            v314 = v313;
            if not (v314[1] ~= nil) or v314[2] == nil then
                v311 = "";
            else
                if v312 == nil then
                    v312 = {};
                end;
                v311 = v28:getText(v314[1], v314[2], v312);
            end;
            ::label10::;
            l_status_39.action = "<b>" .. v311 .. "</b>";
            v305.translation = l_v44_9(l_createdUnixTimeMs_37, l_status_39);
            v305.actorId = v29.userId;
            v305.actorName = v27(v29.userId);
            v305.iconType = "Universe";
            v305.iconId = v29.universeId;
            v305.universeId = v29.universeId;
            v305.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization";
            return v305;
        elseif v29.eventType == 38 then
            local v317 = {
                id = v29.id, 
                eventType = "LocalizationSettingsUserTranslatedContent", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_38 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_38_0 = l_createdUnixTimeMs_38 --[[ copy: 16 -> 61 ]];
            local l_status_40, l_result_40 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_38_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v317.date = not l_status_40 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_40;
            local l_v44_10 = v44;
            l_createdUnixTimeMs_38 = "Description.LocalizationSettingsUserTranslatedContent";
            l_status_40 = {};
            local v323, v324, v325, v326;
            if string.lower(v29.metaData.Action) == "true" then
                v324 = nil;
                v325 = {};
                for v327 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v325[#v325 + 1] = v327;
                end;
                v326 = v325;
                if not (v326[1] ~= nil) or v326[2] == nil then
                    v323 = "";
                else
                    if v324 == nil then
                        v324 = {};
                    end;
                    v323 = v28:getText(v326[1], v326[2], v324);
                end;
                if v323 then
                    goto label11;
                end;
            end;
            v324 = nil;
            v325 = {};
            for v328 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v325[#v325 + 1] = v328;
            end;
            v326 = v325;
            if not (v326[1] ~= nil) or v326[2] == nil then
                v323 = "";
            else
                if v324 == nil then
                    v324 = {};
                end;
                v323 = v28:getText(v326[1], v326[2], v324);
            end;
            ::label11::;
            l_status_40.action = "<b>" .. v323 .. "</b>";
            v317.translation = l_v44_10(l_createdUnixTimeMs_38, l_status_40);
            v317.actorId = v29.userId;
            v317.actorName = v27(v29.userId);
            v317.iconType = "Universe";
            v317.iconId = v29.universeId;
            v317.universeId = v29.universeId;
            v317.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization";
            return v317;
        elseif v29.eventType == 39 then
            local v329 = {
                id = v29.id, 
                eventType = "ClearUnmodifiedAutoCaptureEntries", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_39 = v29.createdUnixTimeMs;
            local l_status_41, l_result_41 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_39):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v329.date = not l_status_41 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_41;
            v329.translation = "";
            v329.actorId = v29.userId;
            v329.actorName = v27(v29.userId);
            v329.iconType = "Universe";
            v329.iconId = v29.universeId;
            v329.universeId = v29.universeId;
            return v329;
        elseif v29.eventType == 40 then
            local v333 = {
                id = v29.id, 
                eventType = "AnalyticsReport", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_40 = v29.createdUnixTimeMs;
            local l_status_42, l_result_42 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_40):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v333.date = not l_status_42 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_42;
            v333.translation = "";
            v333.actorId = v29.userId;
            v333.actorName = v27(v29.userId);
            v333.iconType = "Universe";
            v333.iconId = v29.universeId;
            v333.universeId = v29.universeId;
            return v333;
        elseif v29.eventType == 41 then
            local v337 = {
                id = v29.id, 
                eventType = "TranslationIconAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_41 = v29.createdUnixTimeMs;
            local l_status_43, l_result_43 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_41):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v337.date = not l_status_43 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_43;
            v337.translation = v44("Description.TranslationIconAdded", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                iconName = "<b>" .. v29.metaData.IconName .. "</b>"
            });
            v337.actorId = v29.userId;
            v337.actorName = v27(v29.userId);
            v337.iconType = "Universe";
            v337.iconId = v29.universeId;
            v337.universeId = v29.universeId;
            v337.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            v337.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v337;
        elseif v29.eventType == 42 then
            local v341 = {
                id = v29.id, 
                eventType = "TranslationIconDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_42 = v29.createdUnixTimeMs;
            local l_status_44, l_result_44 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_42):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v341.date = not l_status_44 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_44;
            v341.translation = v44("Description.TranslationIconDeleted", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                iconName = "<b>" .. v29.metaData.IconName .. "</b>"
            });
            v341.actorId = v29.userId;
            v341.actorName = v27(v29.userId);
            v341.iconType = "Universe";
            v341.iconId = v29.universeId;
            v341.universeId = v29.universeId;
            v341.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            v341.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v341;
        elseif v29.eventType == 43 then
            local v345 = {
                id = v29.id, 
                eventType = "TranslationExperienceName", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_43 = v29.createdUnixTimeMs;
            local l_status_45, l_result_45 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_43):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v345.date = not l_status_45 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_45;
            v345.translation = v44("Description.TranslationExperienceName", {
                language = "<b>" .. v29.metaData.Language .. "</b>"
            });
            v345.actorId = v29.userId;
            v345.actorName = v27(v29.userId);
            v345.iconType = "Universe";
            v345.iconId = v29.universeId;
            v345.universeId = v29.universeId;
            v345.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            return v345;
        elseif v29.eventType == 44 then
            local v349 = {
                id = v29.id, 
                eventType = "TranslationExperienceDescription", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_44 = v29.createdUnixTimeMs;
            local l_status_46, l_result_46 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_44):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v349.date = not l_status_46 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_46;
            v349.translation = v44("Description.TranslationExperienceDescription", {
                language = "<b>" .. v29.metaData.Language .. "</b>"
            });
            v349.actorId = v29.userId;
            v349.actorName = v27(v29.userId);
            v349.iconType = "Universe";
            v349.iconId = v29.universeId;
            v349.universeId = v29.universeId;
            v349.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            return v349;
        elseif v29.eventType == 45 then
            local v353 = {
                id = v29.id, 
                eventType = "TranslationThumbnailAltText", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_45 = v29.createdUnixTimeMs;
            local l_status_47, l_result_47 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_45):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v353.date = not l_status_47 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_47;
            v353.translation = v44("Description.TranslationThumbnailAltText", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                thumbnailName = "<b>" .. v29.metaData.ThumbnailName .. "</b>"
            });
            v353.actorId = v29.userId;
            v353.actorName = v27(v29.userId);
            v353.iconType = "Universe";
            v353.iconId = v29.universeId;
            v353.universeId = v29.universeId;
            v353.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            return v353;
        elseif v29.eventType == 46 then
            local v357 = {
                id = v29.id, 
                eventType = "TranslationThumbnailAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_46 = v29.createdUnixTimeMs;
            local l_status_48, l_result_48 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_46):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v357.date = not l_status_48 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_48;
            v357.translation = v44("Description.TranslationThumbnailAdded", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                thumbnailName = "<b>" .. v29.metaData.ThumbnailName .. "</b>"
            });
            v357.actorId = v29.userId;
            v357.actorName = v27(v29.userId);
            v357.iconType = "Universe";
            v357.iconId = v29.universeId;
            v357.universeId = v29.universeId;
            v357.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            return v357;
        elseif v29.eventType == 47 then
            local v361 = {
                id = v29.id, 
                eventType = "TranslationThumbnailDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_47 = v29.createdUnixTimeMs;
            local l_status_49, l_result_49 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_47):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v361.date = not l_status_49 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_49;
            v361.translation = v44("Description.TranslationThumbnailDeleted", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                thumbnailName = "<b>" .. v29.metaData.ThumbnailName .. "</b>"
            });
            v361.actorId = v29.userId;
            v361.actorName = v27(v29.userId);
            v361.iconType = "Universe";
            v361.iconId = v29.universeId;
            v361.universeId = v29.universeId;
            v361.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            return v361;
        elseif v29.eventType == 48 then
            local v365 = {
                id = v29.id, 
                eventType = "TranslationThumbnailOrder", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_48 = v29.createdUnixTimeMs;
            local l_status_50, l_result_50 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_48):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v365.date = not l_status_50 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_50;
            v365.translation = "";
            v365.actorId = v29.userId;
            v365.actorName = v27(v29.userId);
            v365.iconType = "Universe";
            v365.iconId = v29.universeId;
            v365.universeId = v29.universeId;
            return v365;
        elseif v29.eventType == 49 then
            local v369 = {
                id = v29.id, 
                eventType = "TranslationStringAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_49 = v29.createdUnixTimeMs;
            local l_status_51, l_result_51 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_49):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v369.date = not l_status_51 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_51;
            v369.translation = v44("Description.TranslationStringAdded", {
                stringKey = "<b>" .. v29.metaData.StringKey .. "</b>", 
                language = "<b>" .. v29.metaData.Language .. "</b>"
            });
            v369.actorId = v29.userId;
            v369.actorName = v27(v29.userId);
            v369.iconType = "Universe";
            v369.iconId = v29.universeId;
            v369.universeId = v29.universeId;
            v369.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            return v369;
        elseif v29.eventType == 50 then
            local v373 = {
                id = v29.id, 
                eventType = "TranslationStringDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_50 = v29.createdUnixTimeMs;
            local l_status_52, l_result_52 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_50):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v373.date = not l_status_52 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_52;
            v373.translation = v44("Description.TranslationStringDeleted", {
                stringKey = "<b>" .. v29.metaData.StringKey .. "</b>", 
                language = "<b>" .. v29.metaData.Language .. "</b>"
            });
            v373.actorId = v29.userId;
            v373.actorName = v27(v29.userId);
            v373.iconType = "Universe";
            v373.iconId = v29.universeId;
            v373.universeId = v29.universeId;
            v373.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            return v373;
        elseif v29.eventType == 51 then
            local v377 = {
                id = v29.id, 
                eventType = "TranslationStringUpdated", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_51 = v29.createdUnixTimeMs;
            local l_status_53, l_result_53 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_51):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v377.date = not l_status_53 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_53;
            v377.translation = v44("Description.TranslationStringUpdated", {
                stringKey = "<b>" .. v29.metaData.StringKey .. "</b>", 
                language = "<b>" .. v29.metaData.Language .. "</b>"
            });
            v377.actorId = v29.userId;
            v377.actorName = v27(v29.userId);
            v377.iconType = "Universe";
            v377.iconId = v29.universeId;
            v377.universeId = v29.universeId;
            v377.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            return v377;
        elseif v29.eventType == 52 then
            local v381 = {
                id = v29.id, 
                eventType = "TranslationBadgeIconDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_52 = v29.createdUnixTimeMs;
            local l_status_54, l_result_54 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_52):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v381.date = not l_status_54 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_54;
            v381.translation = v44("Description.TranslationBadgeIconDeleted", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                badgeName = "<b>" .. v29.metaData.BadgeName .. "</b>"
            });
            v381.actorId = v29.userId;
            v381.actorName = v27(v29.userId);
            v381.iconType = "Badge";
            v381.iconId = v29.resourceId or 0;
            v381.universeId = v29.universeId;
            v381.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            v381.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v381;
        elseif v29.eventType == 53 then
            local v385 = {
                id = v29.id, 
                eventType = "TranslationBadgeDescription", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_53 = v29.createdUnixTimeMs;
            local l_status_55, l_result_55 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_53):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v385.date = not l_status_55 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_55;
            v385.translation = v44("Description.TranslationBadgeDescription", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                badgeName = "<b>" .. v29.metaData.BadgeName .. "</b>"
            });
            v385.actorId = v29.userId;
            v385.actorName = v27(v29.userId);
            v385.iconType = "Badge";
            v385.iconId = v29.resourceId or 0;
            v385.universeId = v29.universeId;
            v385.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            v385.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v385;
        elseif v29.eventType == 54 then
            local v389 = {
                id = v29.id, 
                eventType = "TranslationBadgeIconAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_54 = v29.createdUnixTimeMs;
            local l_status_56, l_result_56 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_54):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v389.date = not l_status_56 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_56;
            v389.translation = v44("Description.TranslationBadgeIconAdded", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                badgeName = "<b>" .. v29.metaData.BadgeName .. "</b>"
            });
            v389.actorId = v29.userId;
            v389.actorName = v27(v29.userId);
            v389.iconType = "Badge";
            v389.iconId = v29.resourceId or 0;
            v389.universeId = v29.universeId;
            v389.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            v389.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v389;
        elseif v29.eventType == 55 then
            local v393 = {
                id = v29.id, 
                eventType = "TranslationBadgeName", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_55 = v29.createdUnixTimeMs;
            local l_status_57, l_result_57 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_55):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v393.date = not l_status_57 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_57;
            v393.translation = v44("Description.TranslationBadgeName", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                badgeName = "<b>" .. v29.metaData.BadgeName .. "</b>"
            });
            v393.actorId = v29.userId;
            v393.actorName = v27(v29.userId);
            v393.iconType = "Badge";
            v393.iconId = v29.resourceId or 0;
            v393.universeId = v29.universeId;
            v393.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization/translation";
            v393.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v393;
        elseif v29.eventType == 56 then
            local v397 = {
                id = v29.id, 
                eventType = "TranslationDeveloperProductIconDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_56 = v29.createdUnixTimeMs;
            local l_status_58, l_result_58 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_56):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v397.date = not l_status_58 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_58;
            v397.translation = v44("Description.TranslationDeveloperProductIconDeleted", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                productName = "<b>" .. v29.metaData.ProductName .. "</b>"
            });
            v397.actorId = v29.userId;
            v397.actorName = v27(v29.userId);
            v397.iconType = "DeveloperProduct";
            v397.iconId = v29.resourceId or 0;
            v397.universeId = v29.universeId;
            v397.viewBasicSettingsLink = "" .. tostring(v31) .. "/monetization/developer-products";
            v397.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v397;
        elseif v29.eventType == 57 then
            local v401 = {
                id = v29.id, 
                eventType = "TranslationDeveloperProductDescription", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_57 = v29.createdUnixTimeMs;
            local l_status_59, l_result_59 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_57):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v401.date = not l_status_59 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_59;
            v401.translation = v44("Description.TranslationDeveloperProductDescription", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                productName = "<b>" .. v29.metaData.ProductName .. "</b>"
            });
            v401.actorId = v29.userId;
            v401.actorName = v27(v29.userId);
            v401.iconType = "DeveloperProduct";
            v401.iconId = v29.resourceId or 0;
            v401.universeId = v29.universeId;
            v401.viewBasicSettingsLink = "" .. tostring(v31) .. "/monetization/developer-products";
            v401.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v401;
        elseif v29.eventType == 58 then
            local v405 = {
                id = v29.id, 
                eventType = "TranslationDeveloperProductIconAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_58 = v29.createdUnixTimeMs;
            local l_status_60, l_result_60 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_58):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v405.date = not l_status_60 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_60;
            v405.translation = v44("Description.TranslationDeveloperProductIconAdded", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                productName = "<b>" .. v29.metaData.ProductName .. "</b>"
            });
            v405.actorId = v29.userId;
            v405.actorName = v27(v29.userId);
            v405.iconType = "DeveloperProduct";
            v405.iconId = v29.resourceId or 0;
            v405.universeId = v29.universeId;
            v405.viewBasicSettingsLink = "" .. tostring(v31) .. "/monetization/developer-products";
            v405.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v405;
        elseif v29.eventType == 59 then
            local v409 = {
                id = v29.id, 
                eventType = "TranslationDeveloperProductName", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_59 = v29.createdUnixTimeMs;
            local l_status_61, l_result_61 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_59):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v409.date = not l_status_61 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_61;
            v409.translation = v44("Description.TranslationDeveloperProductName", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                productName = "<b>" .. v29.metaData.ProductName .. "</b>"
            });
            v409.actorId = v29.userId;
            v409.actorName = v27(v29.userId);
            v409.iconType = "DeveloperProduct";
            v409.iconId = v29.resourceId or 0;
            v409.universeId = v29.universeId;
            v409.viewBasicSettingsLink = "" .. tostring(v31) .. "/monetization/developer-products";
            v409.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v409;
        elseif v29.eventType == 60 then
            local v413 = {
                id = v29.id, 
                eventType = "TranslationGamePassIconDeleted", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_60 = v29.createdUnixTimeMs;
            local l_status_62, l_result_62 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_60):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v413.date = not l_status_62 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_62;
            v413.translation = v44("Description.TranslationGamePassIconDeleted", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                passName = "<b>" .. v29.metaData.PassName .. "</b>"
            });
            v413.actorId = v29.userId;
            v413.actorName = v27(v29.userId);
            v413.iconType = "GamePass";
            v413.iconId = v29.resourceId or 0;
            v413.universeId = v29.universeId;
            v413.viewBasicSettingsLink = "" .. tostring(v31) .. "/monetization/passes";
            v413.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v413;
        elseif v29.eventType == 61 then
            local v417 = {
                id = v29.id, 
                eventType = "TranslationGamePassDescription", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_61 = v29.createdUnixTimeMs;
            local l_status_63, l_result_63 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_61):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v417.date = not l_status_63 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_63;
            v417.translation = v44("Description.TranslationGamePassDescription", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                passName = "<b>" .. v29.metaData.PassName .. "</b>"
            });
            v417.actorId = v29.userId;
            v417.actorName = v27(v29.userId);
            v417.iconType = "GamePass";
            v417.iconId = v29.resourceId or 0;
            v417.universeId = v29.universeId;
            v417.viewBasicSettingsLink = "" .. tostring(v31) .. "/monetization/passes";
            v417.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v417;
        elseif v29.eventType == 62 then
            local v421 = {
                id = v29.id, 
                eventType = "TranslationGamePassIconAdded", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_62 = v29.createdUnixTimeMs;
            local l_status_64, l_result_64 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_62):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v421.date = not l_status_64 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_64;
            v421.translation = v44("Description.TranslationGamePassIconAdded", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                passName = "<b>" .. v29.metaData.PassName .. "</b>"
            });
            v421.actorId = v29.userId;
            v421.actorName = v27(v29.userId);
            v421.iconType = "GamePass";
            v421.iconId = v29.resourceId or 0;
            v421.universeId = v29.universeId;
            v421.viewBasicSettingsLink = "" .. tostring(v31) .. "/monetization/passes";
            v421.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v421;
        elseif v29.eventType == 63 then
            local v425 = {
                id = v29.id, 
                eventType = "TranslationGamePassName", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_63 = v29.createdUnixTimeMs;
            local l_status_65, l_result_65 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_63):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v425.date = not l_status_65 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_65;
            v425.translation = v44("Description.TranslationGamePassName", {
                language = "<b>" .. v29.metaData.Language .. "</b>", 
                passName = "<b>" .. v29.metaData.PassName .. "</b>"
            });
            v425.actorId = v29.userId;
            v425.actorName = v27(v29.userId);
            v425.iconType = "GamePass";
            v425.iconId = v29.resourceId or 0;
            v425.universeId = v29.universeId;
            v425.viewBasicSettingsLink = "" .. tostring(v31) .. "/monetization/passes";
            v425.viewOnRobloxLink = "" .. tostring(v1) .. "/catalog/" .. tostring(v29.resourceId) .. "";
            return v425;
        elseif v29.eventType == 64 then
            local v429 = {
                id = v29.id, 
                eventType = "UserTranslator", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_64 = v29.createdUnixTimeMs;
            local l_status_66, l_result_66 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_64):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v429.date = not l_status_66 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_66;
            v429.translation = v44("Description.UserTranslator", {
                userName = "<b><u>" .. v27(not not v29.resourceId and v29.resourceId or -1) .. "</u></b>"
            });
            v429.actorId = v29.userId;
            v429.actorName = v27(v29.userId);
            v429.iconType = "User";
            v429.iconId = v29.resourceId or 0;
            v429.universeId = v29.universeId;
            v429.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization";
            v429.viewOnRobloxLink = v37;
            return v429;
        elseif v29.eventType == 65 then
            local v433 = {
                id = v29.id, 
                eventType = "GroupTranslator", 
                eventCategory = "Localization"
            };
            local l_createdUnixTimeMs_65 = v29.createdUnixTimeMs;
            local l_status_67, l_result_67 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_65):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v433.date = not l_status_67 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_67;
            v433.translation = v44("Description.GroupTranslator", {
                groupName = "<b>" .. v29.metaData.GroupName .. "</b>"
            });
            v433.actorId = v29.userId;
            v433.actorName = v27(v29.userId);
            v433.iconType = "Group";
            v433.iconId = v29.resourceId or 0;
            v433.universeId = v29.universeId;
            v433.viewBasicSettingsLink = "" .. tostring(v31) .. "/localization";
            v433.viewOnRobloxLink = v38;
            return v433;
        elseif v29.eventType == 66 then
            local v437 = {
                id = v29.id, 
                eventType = "ExperienceAdvertisement", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_66 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_66_0 = l_createdUnixTimeMs_66 --[[ copy: 16 -> 60 ]];
            local l_status_68, l_result_68 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_66_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v437.date = not l_status_68 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_68;
            local l_v44_11 = v44;
            l_createdUnixTimeMs_66 = "Description.ExperienceAdvertisement";
            l_status_68 = {};
            local v443, v444, v445, v446;
            if string.lower(v29.metaData.Action) == "true" then
                v444 = nil;
                v445 = {};
                for v447 in ("Description.ActionCreated"):gmatch("([^.]+)") do
                    v445[#v445 + 1] = v447;
                end;
                v446 = v445;
                if not (v446[1] ~= nil) or v446[2] == nil then
                    v443 = "";
                else
                    if v444 == nil then
                        v444 = {};
                    end;
                    v443 = v28:getText(v446[1], v446[2], v444);
                end;
                if v443 then
                    goto label12;
                end;
            end;
            v444 = nil;
            v445 = {};
            for v448 in ("Description.ActionRemoved"):gmatch("([^.]+)") do
                v445[#v445 + 1] = v448;
            end;
            v446 = v445;
            if not (v446[1] ~= nil) or v446[2] == nil then
                v443 = "";
            else
                if v444 == nil then
                    v444 = {};
                end;
                v443 = v28:getText(v446[1], v446[2], v444);
            end;
            ::label12::;
            l_status_68.action = "<b>" .. v443 .. "</b>";
            v437.translation = l_v44_11(l_createdUnixTimeMs_66, l_status_68);
            v437.actorId = v29.userId;
            v437.actorName = v27(v29.userId);
            v437.iconType = "Universe";
            v437.iconId = v29.universeId;
            v437.universeId = v29.universeId;
            return v437;
        elseif v29.eventType == 67 then
            local v449 = {
                id = v29.id, 
                eventType = "MonetizationSettingsAccessType", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_67 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_67_0 = l_createdUnixTimeMs_67 --[[ copy: 16 -> 59 ]];
            local l_status_69, l_result_69 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_67_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v449.date = not l_status_69 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_69;
            local l_v44_12 = v44;
            l_createdUnixTimeMs_67 = "Description.MonetizationSettingsAccessType";
            l_status_69 = {};
            local v455, v456, v457, v458;
            if string.lower(v29.metaData.Action) == "true" then
                v456 = nil;
                v457 = {};
                for v459 in ("Description.ActionFriends"):gmatch("([^.]+)") do
                    v457[#v457 + 1] = v459;
                end;
                v458 = v457;
                if not (v458[1] ~= nil) or v458[2] == nil then
                    v455 = "";
                else
                    if v456 == nil then
                        v456 = {};
                    end;
                    v455 = v28:getText(v458[1], v458[2], v456);
                end;
                if v455 then
                    goto label13;
                end;
            end;
            v456 = nil;
            v457 = {};
            for v460 in ("Description.ActionPublic"):gmatch("([^.]+)") do
                v457[#v457 + 1] = v460;
            end;
            v458 = v457;
            if not (v458[1] ~= nil) or v458[2] == nil then
                v455 = "";
            else
                if v456 == nil then
                    v456 = {};
                end;
                v455 = v28:getText(v458[1], v458[2], v456);
            end;
            ::label13::;
            l_status_69.action = "<b>" .. v455 .. "</b>";
            v449.translation = l_v44_12(l_createdUnixTimeMs_67, l_status_69);
            v449.actorId = v29.userId;
            v449.actorName = v27(v29.userId);
            v449.iconType = "Universe";
            v449.iconId = v29.universeId;
            v449.universeId = v29.universeId;
            v449.viewBasicSettingsLink = "" .. tostring(v31) .. "/access";
            return v449;
        elseif v29.eventType == 68 then
            local v461 = {
                id = v29.id, 
                eventType = "MonetizationSettingsRequiresRobux", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_68 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_68_0 = l_createdUnixTimeMs_68 --[[ copy: 16 -> 58 ]];
            local l_status_70, l_result_70 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_68_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v461.date = not l_status_70 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_70;
            local l_v44_13 = v44;
            l_createdUnixTimeMs_68 = "Description.MonetizationSettingsRequiresRobux";
            l_status_70 = {};
            local v467, v468, v469, v470;
            if string.lower(v29.metaData.Action) == "true" then
                v468 = nil;
                v469 = {};
                for v471 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v469[#v469 + 1] = v471;
                end;
                v470 = v469;
                if not (v470[1] ~= nil) or v470[2] == nil then
                    v467 = "";
                else
                    if v468 == nil then
                        v468 = {};
                    end;
                    v467 = v28:getText(v470[1], v470[2], v468);
                end;
                if v467 then
                    goto label14;
                end;
            end;
            v468 = nil;
            v469 = {};
            for v472 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v469[#v469 + 1] = v472;
            end;
            v470 = v469;
            if not (v470[1] ~= nil) or v470[2] == nil then
                v467 = "";
            else
                if v468 == nil then
                    v468 = {};
                end;
                v467 = v28:getText(v470[1], v470[2], v468);
            end;
            ::label14::;
            l_status_70.action = "<b>" .. v467 .. "</b>";
            v461.translation = l_v44_13(l_createdUnixTimeMs_68, l_status_70);
            v461.actorId = v29.userId;
            v461.actorName = v27(v29.userId);
            v461.iconType = "Universe";
            v461.iconId = v29.universeId;
            v461.universeId = v29.universeId;
            v461.viewBasicSettingsLink = "" .. tostring(v31) .. "/access";
            return v461;
        elseif v29.eventType == 69 then
            local v473 = {
                id = v29.id, 
                eventType = "MonetizationSettingsRobuxPrice", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_69 = v29.createdUnixTimeMs;
            local l_status_71, l_result_71 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_69):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v473.date = not l_status_71 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_71;
            v473.translation = v44("Description.MonetizationSettingsRobuxPrice", {
                price = "<b>" .. v29.metaData.Price .. "</b>"
            });
            v473.actorId = v29.userId;
            v473.actorName = v27(v29.userId);
            v473.iconType = "Universe";
            v473.iconId = v29.universeId;
            v473.universeId = v29.universeId;
            v473.viewBasicSettingsLink = "" .. tostring(v31) .. "/access";
            return v473;
        elseif v29.eventType == 70 then
            local v477 = {
                id = v29.id, 
                eventType = "MonetizationSettingsPlayableDevices", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_70 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_70_0 = l_createdUnixTimeMs_70 --[[ copy: 16 -> 57 ]];
            local l_status_72, l_result_72 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_70_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v477.date = not l_status_72 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_72;
            l_createdUnixTimeMs_70 = v29.metaData;
            l_status_72 = "";
            local v482;
            do
                local l_l_status_72_0 = l_status_72;
                local v484;
                l_result_72, v484 = pcall(function()
                    local v485 = game:GetService("HttpService"):JSONDecode(l_createdUnixTimeMs_70.PlayableDevices);
                    local v486 = {};
                    for _, v488 in pairs(v485) do
                        if v25[v488] ~= nil and v26[v25[v488]] ~= nil then
                            local v489 = v26[v25[v488]];
                            local v490 = nil;
                            local v491 = {};
                            for v492 in v489:gmatch("([^.]+)") do
                                v491[#v491 + 1] = v492;
                            end;
                            local l_v491_0 = v491;
                            local v494;
                            if not (l_v491_0[1] ~= nil) or l_v491_0[2] == nil then
                                v494 = "";
                            else
                                if v490 == nil then
                                    v490 = {};
                                end;
                                v494 = v28:getText(l_v491_0[1], l_v491_0[2], v490);
                            end;
                            table.insert(v486, "<b>" .. v494 .. "</b>");
                        end;
                    end;
                    if #v486 > 0 then
                        l_l_status_72_0 = v44("Description.MonetizationSettingsPlayableDevices", {
                            playableDevices = joinStrings(v486, ", ")
                        });
                        return ;
                    else
                        local v495 = nil;
                        local v496 = {};
                        for v497 in ("Description.MonetizationSettingsPlayableDevicesEmpty"):gmatch("([^.]+)") do
                            v496[#v496 + 1] = v497;
                        end;
                        local l_v496_0 = v496;
                        local v499;
                        if not (l_v496_0[1] ~= nil) or l_v496_0[2] == nil then
                            v499 = "";
                        else
                            if v495 == nil then
                                v495 = {};
                            end;
                            v499 = v28:getText(l_v496_0[1], l_v496_0[2], v495);
                        end;
                        l_l_status_72_0 = v499;
                        return ;
                    end;
                end);
                v482 = l_l_status_72_0;
            end;
            v477.translation = v482;
            v477.actorId = v29.userId;
            v477.actorName = v27(v29.userId);
            v477.iconType = "Universe";
            v477.iconId = v29.universeId;
            v477.universeId = v29.universeId;
            v477.viewBasicSettingsLink = "" .. tostring(v31) .. "/access";
            return v477;
        elseif v29.eventType == 71 then
            local v500 = {
                id = v29.id, 
                eventType = "MonetizationSettingsAllowPrivateServers", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_71 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_71_0 = l_createdUnixTimeMs_71 --[[ copy: 16 -> 56 ]];
            local l_status_73, l_result_73 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_71_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v500.date = not l_status_73 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_73;
            local l_v44_14 = v44;
            l_createdUnixTimeMs_71 = "Description.MonetizationSettingsAllowPrivateServers";
            l_status_73 = {};
            local v506, v507, v508, v509;
            if string.lower(v29.metaData.Action) == "true" then
                v507 = nil;
                v508 = {};
                for v510 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v508[#v508 + 1] = v510;
                end;
                v509 = v508;
                if not (v509[1] ~= nil) or v509[2] == nil then
                    v506 = "";
                else
                    if v507 == nil then
                        v507 = {};
                    end;
                    v506 = v28:getText(v509[1], v509[2], v507);
                end;
                if v506 then
                    goto label15;
                end;
            end;
            v507 = nil;
            v508 = {};
            for v511 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v508[#v508 + 1] = v511;
            end;
            v509 = v508;
            if not (v509[1] ~= nil) or v509[2] == nil then
                v506 = "";
            else
                if v507 == nil then
                    v507 = {};
                end;
                v506 = v28:getText(v509[1], v509[2], v507);
            end;
            ::label15::;
            l_status_73.action = "<b>" .. v506 .. "</b>";
            v500.translation = l_v44_14(l_createdUnixTimeMs_71, l_status_73);
            v500.actorId = v29.userId;
            v500.actorName = v27(v29.userId);
            v500.iconType = "Universe";
            v500.iconId = v29.universeId;
            v500.universeId = v29.universeId;
            v500.viewBasicSettingsLink = "" .. tostring(v31) .. "/access";
            return v500;
        elseif v29.eventType == 72 then
            local v512 = {
                id = v29.id, 
                eventType = "MonetizationSettingsPrivateServerPrice", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_72 = v29.createdUnixTimeMs;
            local l_status_74, l_result_74 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_72):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v512.date = not l_status_74 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_74;
            v512.translation = v44("Description.MonetizationSettingsPrivateServerPrice", {
                price = "<b>" .. v29.metaData.Price .. "</b>"
            });
            v512.actorId = v29.userId;
            v512.actorName = v27(v29.userId);
            v512.iconType = "Universe";
            v512.iconId = v29.universeId;
            v512.universeId = v29.universeId;
            v512.viewBasicSettingsLink = "" .. tostring(v31) .. "/access";
            return v512;
        elseif v29.eventType == 73 then
            local v516 = {
                id = v29.id, 
                eventType = "ExperienceSponsor", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_73 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_73_0 = l_createdUnixTimeMs_73 --[[ copy: 16 -> 55 ]];
            local l_status_75, l_result_75 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_73_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v516.date = not l_status_75 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_75;
            local l_v44_15 = v44;
            l_createdUnixTimeMs_73 = "Description.ExperienceSponsor";
            l_status_75 = {
                adName = "<b>" .. v29.metaData.AdName .. "</b>"
            };
            local v522, v523, v524, v525;
            if string.lower(v29.metaData.Action) == "true" then
                v523 = nil;
                v524 = {};
                for v526 in ("Description.ActionLaunched"):gmatch("([^.]+)") do
                    v524[#v524 + 1] = v526;
                end;
                v525 = v524;
                if not (v525[1] ~= nil) or v525[2] == nil then
                    v522 = "";
                else
                    if v523 == nil then
                        v523 = {};
                    end;
                    v522 = v28:getText(v525[1], v525[2], v523);
                end;
                if v522 then
                    goto label16;
                end;
            end;
            v523 = nil;
            v524 = {};
            for v527 in ("Description.ActionDiscontinued"):gmatch("([^.]+)") do
                v524[#v524 + 1] = v527;
            end;
            v525 = v524;
            if not (v525[1] ~= nil) or v525[2] == nil then
                v522 = "";
            else
                if v523 == nil then
                    v523 = {};
                end;
                v522 = v28:getText(v525[1], v525[2], v523);
            end;
            ::label16::;
            l_status_75.action = "<b>" .. v522 .. "</b>";
            v516.translation = l_v44_15(l_createdUnixTimeMs_73, l_status_75);
            v516.actorId = v29.userId;
            v516.actorName = v27(v29.userId);
            v516.iconType = "Universe";
            v516.iconId = v29.universeId;
            v516.universeId = v29.universeId;
            return v516;
        elseif v29.eventType == 74 then
            local v528 = {
                id = v29.id, 
                eventType = "BadgeName", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_74 = v29.createdUnixTimeMs;
            local l_status_76, l_result_76 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_74):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v528.date = not l_status_76 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_76;
            v528.translation = v44("Description.BadgeName", {
                newName = "<b><u>" .. v29.metaData.NewName .. "</u></b>", 
                oldName = "<b><u>" .. v29.metaData.OldName .. "</u></b>"
            });
            v528.actorId = v29.userId;
            v528.actorName = v27(v29.userId);
            v528.iconType = "Badge";
            v528.iconId = v29.resourceId or 0;
            v528.universeId = v29.universeId;
            v528.viewBasicSettingsLink = "" .. tostring(v31) .. "/badges/" .. tostring(v29.resourceId) .. "/configure";
            v528.viewOnRobloxLink = "" .. tostring(v1) .. "/badges/" .. tostring(v29.resourceId) .. "";
            return v528;
        elseif v29.eventType == 75 then
            local v532 = {
                id = v29.id, 
                eventType = "BadgeDescription", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_75 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_75_0 = l_createdUnixTimeMs_75 --[[ copy: 16 -> 54 ]];
            local l_status_77, l_result_77 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_75_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v532.date = not l_status_77 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_77;
            l_createdUnixTimeMs_75 = nil;
            l_result_77 = {};
            for v537 in ("Description.BadgeDescription"):gmatch("([^.]+)") do
                l_result_77[#l_result_77 + 1] = v537;
            end;
            l_status_77 = l_result_77;
            local v538;
            if not (l_status_77[1] ~= nil) or l_status_77[2] == nil then
                v538 = "";
            else
                if l_createdUnixTimeMs_75 == nil then
                    l_createdUnixTimeMs_75 = {};
                end;
                v538 = v28:getText(l_status_77[1], l_status_77[2], l_createdUnixTimeMs_75);
            end;
            v532.translation = v538;
            v532.actorId = v29.userId;
            v532.actorName = v27(v29.userId);
            v532.iconType = "Badge";
            v532.iconId = v29.resourceId or 0;
            v532.universeId = v29.universeId;
            v532.viewBasicSettingsLink = "" .. tostring(v31) .. "/badges/" .. tostring(v29.resourceId) .. "/configure";
            v532.viewOnRobloxLink = "" .. tostring(v1) .. "/badges/" .. tostring(v29.resourceId) .. "";
            return v532;
        elseif v29.eventType == 76 then
            local v539 = {
                id = v29.id, 
                eventType = "BadgeIcon", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_76 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_76_0 = l_createdUnixTimeMs_76 --[[ copy: 16 -> 53 ]];
            local l_status_78, l_result_78 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_76_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v539.date = not l_status_78 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_78;
            l_createdUnixTimeMs_76 = nil;
            l_result_78 = {};
            for v544 in ("Description.BadgeIcon"):gmatch("([^.]+)") do
                l_result_78[#l_result_78 + 1] = v544;
            end;
            l_status_78 = l_result_78;
            local v545;
            if not (l_status_78[1] ~= nil) or l_status_78[2] == nil then
                v545 = "";
            else
                if l_createdUnixTimeMs_76 == nil then
                    l_createdUnixTimeMs_76 = {};
                end;
                v545 = v28:getText(l_status_78[1], l_status_78[2], l_createdUnixTimeMs_76);
            end;
            v539.translation = v545;
            v539.actorId = v29.userId;
            v539.actorName = v27(v29.userId);
            v539.iconType = "Badge";
            v539.iconId = v29.resourceId or 0;
            v539.universeId = v29.universeId;
            v539.viewBasicSettingsLink = "" .. tostring(v31) .. "/badges/" .. tostring(v29.resourceId) .. "/configure";
            v539.viewOnRobloxLink = "" .. tostring(v1) .. "/badges/" .. tostring(v29.resourceId) .. "";
            return v539;
        elseif v29.eventType == 77 then
            local v546 = {
                id = v29.id, 
                eventType = "BadgeCreate", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_77 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_77_0 = l_createdUnixTimeMs_77 --[[ copy: 16 -> 52 ]];
            local l_status_79, l_result_79 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_77_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v546.date = not l_status_79 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_79;
            l_createdUnixTimeMs_77 = nil;
            l_result_79 = {};
            for v551 in ("Description.BadgeCreate"):gmatch("([^.]+)") do
                l_result_79[#l_result_79 + 1] = v551;
            end;
            l_status_79 = l_result_79;
            local v552;
            if not (l_status_79[1] ~= nil) or l_status_79[2] == nil then
                v552 = "";
            else
                if l_createdUnixTimeMs_77 == nil then
                    l_createdUnixTimeMs_77 = {};
                end;
                v552 = v28:getText(l_status_79[1], l_status_79[2], l_createdUnixTimeMs_77);
            end;
            v546.translation = v552;
            v546.actorId = v29.userId;
            v546.actorName = v27(v29.userId);
            v546.iconType = "Badge";
            v546.iconId = v29.resourceId or 0;
            v546.universeId = v29.universeId;
            v546.viewBasicSettingsLink = "" .. tostring(v31) .. "/badges/" .. tostring(v29.resourceId) .. "/overview";
            v546.viewOnRobloxLink = "" .. tostring(v1) .. "/badges/" .. tostring(v29.resourceId) .. "";
            return v546;
        elseif v29.eventType == 78 then
            local v553 = {
                id = v29.id, 
                eventType = "DeveloperProductName", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_78 = v29.createdUnixTimeMs;
            local l_status_80, l_result_80 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_78):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v553.date = not l_status_80 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_80;
            v553.translation = v44("Description.DeveloperProductName", {
                newName = "<b><u>" .. v29.metaData.NewName .. "</u></b>", 
                oldName = "<b><u>" .. v29.metaData.OldName .. "</u></b>"
            });
            v553.actorId = v29.userId;
            v553.actorName = v27(v29.userId);
            v553.iconType = "DeveloperProduct";
            v553.iconId = v29.resourceId or 0;
            v553.universeId = v29.universeId;
            v553.viewBasicSettingsLink = "" .. tostring(v31) .. "/developer-products/" .. tostring(v29.resourceId) .. "/configure";
            v553.viewOnRobloxLink = "" .. tostring(v1) .. "/developer-products/" .. tostring(v29.resourceId) .. "";
            return v553;
        elseif v29.eventType == 79 then
            local v557 = {
                id = v29.id, 
                eventType = "DeveloperProductDescription", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_79 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_79_0 = l_createdUnixTimeMs_79 --[[ copy: 16 -> 51 ]];
            local l_status_81, l_result_81 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_79_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v557.date = not l_status_81 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_81;
            l_createdUnixTimeMs_79 = nil;
            l_result_81 = {};
            for v562 in ("Description.DeveloperProductDescription"):gmatch("([^.]+)") do
                l_result_81[#l_result_81 + 1] = v562;
            end;
            l_status_81 = l_result_81;
            local v563;
            if not (l_status_81[1] ~= nil) or l_status_81[2] == nil then
                v563 = "";
            else
                if l_createdUnixTimeMs_79 == nil then
                    l_createdUnixTimeMs_79 = {};
                end;
                v563 = v28:getText(l_status_81[1], l_status_81[2], l_createdUnixTimeMs_79);
            end;
            v557.translation = v563;
            v557.actorId = v29.userId;
            v557.actorName = v27(v29.userId);
            v557.iconType = "DeveloperProduct";
            v557.iconId = v29.resourceId or 0;
            v557.universeId = v29.universeId;
            v557.viewBasicSettingsLink = "" .. tostring(v31) .. "/developer-products/" .. tostring(v29.resourceId) .. "/configure";
            v557.viewOnRobloxLink = "" .. tostring(v1) .. "/developer-products/" .. tostring(v29.resourceId) .. "";
            return v557;
        elseif v29.eventType == 80 then
            local v564 = {
                id = v29.id, 
                eventType = "DeveloperProductIcon", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_80 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_80_0 = l_createdUnixTimeMs_80 --[[ copy: 16 -> 50 ]];
            local l_status_82, l_result_82 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_80_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v564.date = not l_status_82 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_82;
            l_createdUnixTimeMs_80 = nil;
            l_result_82 = {};
            for v569 in ("Description.DeveloperProductIcon"):gmatch("([^.]+)") do
                l_result_82[#l_result_82 + 1] = v569;
            end;
            l_status_82 = l_result_82;
            local v570;
            if not (l_status_82[1] ~= nil) or l_status_82[2] == nil then
                v570 = "";
            else
                if l_createdUnixTimeMs_80 == nil then
                    l_createdUnixTimeMs_80 = {};
                end;
                v570 = v28:getText(l_status_82[1], l_status_82[2], l_createdUnixTimeMs_80);
            end;
            v564.translation = v570;
            v564.actorId = v29.userId;
            v564.actorName = v27(v29.userId);
            v564.iconType = "DeveloperProduct";
            v564.iconId = v29.resourceId or 0;
            v564.universeId = v29.universeId;
            v564.viewBasicSettingsLink = "" .. tostring(v31) .. "/developer-products/" .. tostring(v29.resourceId) .. "/configure";
            v564.viewOnRobloxLink = "" .. tostring(v1) .. "/developer-products/" .. tostring(v29.resourceId) .. "";
            return v564;
        elseif v29.eventType == 81 then
            local v571 = {
                id = v29.id, 
                eventType = "DeveloperProductPrice", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_81 = v29.createdUnixTimeMs;
            local l_status_83, l_result_83 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_81):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v571.date = not l_status_83 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_83;
            v571.translation = v44("Description.DeveloperProductPrice", {
                price = "<b>" .. v29.metaData.Price .. "</b>"
            });
            v571.actorId = v29.userId;
            v571.actorName = v27(v29.userId);
            v571.iconType = "DeveloperProduct";
            v571.iconId = v29.resourceId or 0;
            v571.universeId = v29.universeId;
            v571.viewBasicSettingsLink = "" .. tostring(v31) .. "/developer-products/" .. tostring(v29.resourceId) .. "/configure";
            v571.viewOnRobloxLink = "" .. tostring(v1) .. "/developer-products/" .. tostring(v29.resourceId) .. "";
            return v571;
        elseif v29.eventType == 82 then
            local v575 = {
                id = v29.id, 
                eventType = "DeveloperProductCreate", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_82 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_82_0 = l_createdUnixTimeMs_82 --[[ copy: 16 -> 49 ]];
            local l_status_84, l_result_84 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_82_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v575.date = not l_status_84 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_84;
            l_createdUnixTimeMs_82 = nil;
            l_result_84 = {};
            for v580 in ("Description.DeveloperProductCreate"):gmatch("([^.]+)") do
                l_result_84[#l_result_84 + 1] = v580;
            end;
            l_status_84 = l_result_84;
            local v581;
            if not (l_status_84[1] ~= nil) or l_status_84[2] == nil then
                v581 = "";
            else
                if l_createdUnixTimeMs_82 == nil then
                    l_createdUnixTimeMs_82 = {};
                end;
                v581 = v28:getText(l_status_84[1], l_status_84[2], l_createdUnixTimeMs_82);
            end;
            v575.translation = v581;
            v575.actorId = v29.userId;
            v575.actorName = v27(v29.userId);
            v575.iconType = "DeveloperProduct";
            v575.iconId = v29.resourceId or 0;
            v575.universeId = v29.universeId;
            v575.viewBasicSettingsLink = "" .. tostring(v31) .. "/developer-products/" .. tostring(v29.resourceId) .. "/configure";
            v575.viewOnRobloxLink = "" .. tostring(v1) .. "/developer-products/" .. tostring(v29.resourceId) .. "";
            return v575;
        elseif v29.eventType == 83 then
            local v582 = {
                id = v29.id, 
                eventType = "GamePassName", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_83 = v29.createdUnixTimeMs;
            local l_status_85, l_result_85 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_83):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v582.date = not l_status_85 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_85;
            v582.translation = v44("Description.GamePassName", {
                newName = "<b><u>" .. v29.metaData.NewName .. "</u></b>", 
                oldName = "<b><u>" .. v29.metaData.OldName .. "</u></b>"
            });
            v582.actorId = v29.userId;
            v582.actorName = v27(v29.userId);
            v582.iconType = "GamePass";
            v582.iconId = v29.resourceId or 0;
            v582.universeId = v29.universeId;
            v582.viewBasicSettingsLink = "" .. tostring(v31) .. "/passes/" .. tostring(v29.resourceId) .. "/configure";
            v582.viewOnRobloxLink = "" .. tostring(v1) .. "/game-pass/" .. tostring(v29.resourceId) .. "";
            return v582;
        elseif v29.eventType == 84 then
            local v586 = {
                id = v29.id, 
                eventType = "GamePassDescription", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_84 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_84_0 = l_createdUnixTimeMs_84 --[[ copy: 16 -> 48 ]];
            local l_status_86, l_result_86 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_84_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v586.date = not l_status_86 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_86;
            l_createdUnixTimeMs_84 = nil;
            l_result_86 = {};
            for v591 in ("Description.GamePassDescription"):gmatch("([^.]+)") do
                l_result_86[#l_result_86 + 1] = v591;
            end;
            l_status_86 = l_result_86;
            local v592;
            if not (l_status_86[1] ~= nil) or l_status_86[2] == nil then
                v592 = "";
            else
                if l_createdUnixTimeMs_84 == nil then
                    l_createdUnixTimeMs_84 = {};
                end;
                v592 = v28:getText(l_status_86[1], l_status_86[2], l_createdUnixTimeMs_84);
            end;
            v586.translation = v592;
            v586.actorId = v29.userId;
            v586.actorName = v27(v29.userId);
            v586.iconType = "GamePass";
            v586.iconId = v29.resourceId or 0;
            v586.universeId = v29.universeId;
            v586.viewBasicSettingsLink = "" .. tostring(v31) .. "/passes/" .. tostring(v29.resourceId) .. "/configure";
            v586.viewOnRobloxLink = "" .. tostring(v1) .. "/game-pass/" .. tostring(v29.resourceId) .. "";
            return v586;
        elseif v29.eventType == 85 then
            local v593 = {
                id = v29.id, 
                eventType = "GamePassIcon", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_85 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_85_0 = l_createdUnixTimeMs_85 --[[ copy: 16 -> 47 ]];
            local l_status_87, l_result_87 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_85_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v593.date = not l_status_87 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_87;
            l_createdUnixTimeMs_85 = nil;
            l_result_87 = {};
            for v598 in ("Description.GamePassIcon"):gmatch("([^.]+)") do
                l_result_87[#l_result_87 + 1] = v598;
            end;
            l_status_87 = l_result_87;
            local v599;
            if not (l_status_87[1] ~= nil) or l_status_87[2] == nil then
                v599 = "";
            else
                if l_createdUnixTimeMs_85 == nil then
                    l_createdUnixTimeMs_85 = {};
                end;
                v599 = v28:getText(l_status_87[1], l_status_87[2], l_createdUnixTimeMs_85);
            end;
            v593.translation = v599;
            v593.actorId = v29.userId;
            v593.actorName = v27(v29.userId);
            v593.iconType = "GamePass";
            v593.iconId = v29.resourceId or 0;
            v593.universeId = v29.universeId;
            v593.viewBasicSettingsLink = "" .. tostring(v31) .. "/passes/" .. tostring(v29.resourceId) .. "/configure";
            v593.viewOnRobloxLink = "" .. tostring(v1) .. "/game-pass/" .. tostring(v29.resourceId) .. "";
            return v593;
        elseif v29.eventType == 86 then
            local v600 = {
                id = v29.id, 
                eventType = "GamePassPrice", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_86 = v29.createdUnixTimeMs;
            local l_status_88, l_result_88 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_86):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v600.date = not l_status_88 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_88;
            v600.translation = v44("Description.GamePassPrice", {
                price = "<b>" .. v29.metaData.Price .. "</b>"
            });
            v600.actorId = v29.userId;
            v600.actorName = v27(v29.userId);
            v600.iconType = "GamePass";
            v600.iconId = v29.resourceId or 0;
            v600.universeId = v29.universeId;
            v600.viewBasicSettingsLink = "" .. tostring(v31) .. "/passes/" .. tostring(v29.resourceId) .. "/sales";
            v600.viewOnRobloxLink = "" .. tostring(v1) .. "/game-pass/" .. tostring(v29.resourceId) .. "";
            return v600;
        elseif v29.eventType == 87 then
            local v604 = {
                id = v29.id, 
                eventType = "GamePassCreate", 
                eventCategory = "Monetization"
            };
            local l_createdUnixTimeMs_87 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_87_0 = l_createdUnixTimeMs_87 --[[ copy: 16 -> 46 ]];
            local l_status_89, l_result_89 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_87_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v604.date = not l_status_89 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_89;
            l_createdUnixTimeMs_87 = nil;
            l_result_89 = {};
            for v609 in ("Description.GamePassCreate"):gmatch("([^.]+)") do
                l_result_89[#l_result_89 + 1] = v609;
            end;
            l_status_89 = l_result_89;
            local v610;
            if not (l_status_89[1] ~= nil) or l_status_89[2] == nil then
                v610 = "";
            else
                if l_createdUnixTimeMs_87 == nil then
                    l_createdUnixTimeMs_87 = {};
                end;
                v610 = v28:getText(l_status_89[1], l_status_89[2], l_createdUnixTimeMs_87);
            end;
            v604.translation = v610;
            v604.actorId = v29.userId;
            v604.actorName = v27(v29.userId);
            v604.iconType = "GamePass";
            v604.iconId = v29.resourceId or 0;
            v604.universeId = v29.universeId;
            v604.viewBasicSettingsLink = "" .. tostring(v31) .. "/passes/" .. tostring(v29.resourceId) .. "/configure";
            v604.viewOnRobloxLink = "" .. tostring(v1) .. "/game-pass/" .. tostring(v29.resourceId) .. "";
            return v604;
        elseif v29.eventType == 88 then
            local v611 = {
                id = v29.id, 
                eventType = "PermissionsUserAdded", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_88 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_88_0 = l_createdUnixTimeMs_88 --[[ copy: 16 -> 45 ]];
            local l_status_90, l_result_90 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_88_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v611.date = not l_status_90 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_90;
            local l_v44_16 = v44;
            l_createdUnixTimeMs_88 = "Description.PermissionsUserAdded";
            l_status_90 = {
                userName = "<b><u>" .. v27(v29.resourceId) .. "</u></b>"
            };
            local v617, v618, v619, v620;
            if v29.metaData.Action == "Edit" then
                v617 = nil;
                v618 = {};
                for v621 in ("Description.RoleEditor"):gmatch("([^.]+)") do
                    v618[#v618 + 1] = v621;
                end;
                v619 = v618;
                if not (v619[1] ~= nil) or v619[2] == nil then
                    v620 = "";
                else
                    if v617 == nil then
                        v617 = {};
                    end;
                    v620 = v28:getText(v619[1], v619[2], v617);
                end;
                if v620 then
                    goto label17;
                end;
            end;
            v617 = nil;
            v618 = {};
            for v622 in ("Description.RolePlayer"):gmatch("([^.]+)") do
                v618[#v618 + 1] = v622;
            end;
            v619 = v618;
            if not (v619[1] ~= nil) or v619[2] == nil then
                v620 = "";
            else
                if v617 == nil then
                    v617 = {};
                end;
                v620 = v28:getText(v619[1], v619[2], v617);
            end;
            ::label17::;
            l_status_90.role = "<b>" .. v620 .. "</b>";
            v611.translation = l_v44_16(l_createdUnixTimeMs_88, l_status_90);
            v611.actorId = v29.userId;
            v611.actorName = v27(v29.userId);
            v611.iconType = "User";
            v611.iconId = v29.resourceId or 0;
            v611.universeId = v29.universeId;
            v611.viewOnRobloxLink = v37;
            return v611;
        elseif v29.eventType == 89 then
            local v623 = {
                id = v29.id, 
                eventType = "PermissionsGroupAdded", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_89 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_89_0 = l_createdUnixTimeMs_89 --[[ copy: 16 -> 44 ]];
            local l_status_91, l_result_91 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_89_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v623.date = not l_status_91 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_91;
            local l_v44_17 = v44;
            l_createdUnixTimeMs_89 = "Description.PermissionsGroupAdded";
            l_status_91 = {
                groupRole = "<b>" .. v29.metaData.RolesetName .. "</b>", 
                groupName = "<b>" .. v29.metaData.GroupName .. "</b>"
            };
            local v629, v630, v631, v632;
            if v29.metaData.Action == "Edit" then
                v629 = nil;
                v630 = {};
                for v633 in ("Action.Edit"):gmatch("([^.]+)") do
                    v630[#v630 + 1] = v633;
                end;
                v631 = v630;
                if not (v631[1] ~= nil) or v631[2] == nil then
                    v632 = "";
                else
                    if v629 == nil then
                        v629 = {};
                    end;
                    v632 = v28:getText(v631[1], v631[2], v629);
                end;
                if v632 then
                    goto label18;
                end;
            end;
            v629 = nil;
            v630 = {};
            for v634 in ("Action.Play"):gmatch("([^.]+)") do
                v630[#v630 + 1] = v634;
            end;
            v631 = v630;
            if not (v631[1] ~= nil) or v631[2] == nil then
                v632 = "";
            else
                if v629 == nil then
                    v629 = {};
                end;
                v632 = v28:getText(v631[1], v631[2], v629);
            end;
            ::label18::;
            l_status_91.role = "<b>" .. v632 .. "</b>";
            v623.translation = l_v44_17(l_createdUnixTimeMs_89, l_status_91);
            v623.actorId = v29.userId;
            v623.actorName = v27(v29.userId);
            v623.iconType = "Group";
            v623.iconId = v29.resourceId or 0;
            v623.universeId = v29.universeId;
            v623.viewOnRobloxLink = "" .. tostring(v1) .. "/groups/" .. tostring(v29.resourceId) .. "";
            return v623;
        elseif v29.eventType == 90 then
            local v635 = {
                id = v29.id, 
                eventType = "PermissionsUserChanged", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_90 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_90_0 = l_createdUnixTimeMs_90 --[[ copy: 16 -> 43 ]];
            local l_status_92, l_result_92 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_90_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v635.date = not l_status_92 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_92;
            local l_v44_18 = v44;
            l_createdUnixTimeMs_90 = "Description.PermissionsUserChanged";
            l_status_92 = {
                userName = "<b><u>" .. v27(v29.resourceId) .. "</u></b>"
            };
            local v641, v642, v643, v644;
            if v29.metaData.Action == "Edit" then
                v641 = nil;
                v642 = {};
                for v645 in ("Action.Play"):gmatch("([^.]+)") do
                    v642[#v642 + 1] = v645;
                end;
                v643 = v642;
                if not (v643[1] ~= nil) or v643[2] == nil then
                    v644 = "";
                else
                    if v641 == nil then
                        v641 = {};
                    end;
                    v644 = v28:getText(v643[1], v643[2], v641);
                end;
                if v644 then
                    goto label19;
                end;
            end;
            v641 = nil;
            v642 = {};
            for v646 in ("Action.Edit"):gmatch("([^.]+)") do
                v642[#v642 + 1] = v646;
            end;
            v643 = v642;
            if not (v643[1] ~= nil) or v643[2] == nil then
                v644 = "";
            else
                if v641 == nil then
                    v641 = {};
                end;
                v644 = v28:getText(v643[1], v643[2], v641);
            end;
            ::label19::;
            l_status_92.oldRole = "<b>" .. v644 .. "</b>";
            if v29.metaData.Action == "Edit" then
                v641 = nil;
                v642 = {};
                for v647 in ("Action.Edit"):gmatch("([^.]+)") do
                    v642[#v642 + 1] = v647;
                end;
                v643 = v642;
                if not (v643[1] ~= nil) or v643[2] == nil then
                    v644 = "";
                else
                    if v641 == nil then
                        v641 = {};
                    end;
                    v644 = v28:getText(v643[1], v643[2], v641);
                end;
                if v644 then
                    goto label20;
                end;
            end;
            v641 = nil;
            v642 = {};
            for v648 in ("Action.Play"):gmatch("([^.]+)") do
                v642[#v642 + 1] = v648;
            end;
            v643 = v642;
            if not (v643[1] ~= nil) or v643[2] == nil then
                v644 = "";
            else
                if v641 == nil then
                    v641 = {};
                end;
                v644 = v28:getText(v643[1], v643[2], v641);
            end;
            ::label20::;
            l_status_92.newRole = "<b>" .. v644 .. "</b>";
            v635.translation = l_v44_18(l_createdUnixTimeMs_90, l_status_92);
            v635.actorId = v29.userId;
            v635.actorName = v27(v29.userId);
            v635.iconType = "User";
            v635.iconId = v29.resourceId or 0;
            v635.universeId = v29.universeId;
            v635.viewOnRobloxLink = v37;
            return v635;
        elseif v29.eventType == 91 then
            local v649 = {
                id = v29.id, 
                eventType = "PermissionsUserRemoved", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_91 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_91_0 = l_createdUnixTimeMs_91 --[[ copy: 16 -> 42 ]];
            local l_status_93, l_result_93 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_91_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v649.date = not l_status_93 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_93;
            local l_v44_19 = v44;
            l_createdUnixTimeMs_91 = "Description.PermissionsUserRemoved";
            l_status_93 = {
                userName = "<b><u>" .. v27(v29.resourceId) .. "</u></b>"
            };
            local v655, v656, v657, v658;
            if v29.metaData.Action == "Edit" then
                v655 = nil;
                v656 = {};
                for v659 in ("Description.RoleEditor"):gmatch("([^.]+)") do
                    v656[#v656 + 1] = v659;
                end;
                v657 = v656;
                if not (v657[1] ~= nil) or v657[2] == nil then
                    v658 = "";
                else
                    if v655 == nil then
                        v655 = {};
                    end;
                    v658 = v28:getText(v657[1], v657[2], v655);
                end;
                if v658 then
                    goto label21;
                end;
            end;
            v655 = nil;
            v656 = {};
            for v660 in ("Description.RolePlayer"):gmatch("([^.]+)") do
                v656[#v656 + 1] = v660;
            end;
            v657 = v656;
            if not (v657[1] ~= nil) or v657[2] == nil then
                v658 = "";
            else
                if v655 == nil then
                    v655 = {};
                end;
                v658 = v28:getText(v657[1], v657[2], v655);
            end;
            ::label21::;
            l_status_93.role = "<b>" .. v658 .. "</b>";
            v649.translation = l_v44_19(l_createdUnixTimeMs_91, l_status_93);
            v649.actorId = v29.userId;
            v649.actorName = v27(v29.userId);
            v649.iconType = "User";
            v649.iconId = v29.resourceId or 0;
            v649.universeId = v29.universeId;
            v649.viewOnRobloxLink = v37;
            return v649;
        elseif v29.eventType == 92 then
            local v661 = {
                id = v29.id, 
                eventType = "PermissionsGroupChanged", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_92 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_92_0 = l_createdUnixTimeMs_92 --[[ copy: 16 -> 41 ]];
            local l_status_94, l_result_94 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_92_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v661.date = not l_status_94 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_94;
            local l_v44_20 = v44;
            l_createdUnixTimeMs_92 = "Description.PermissionsGroupChanged";
            l_status_94 = {
                groupRole = "<b>" .. v29.metaData.RolesetName .. "</b>", 
                groupName = "<b>" .. v29.metaData.GroupName .. "</b>"
            };
            local v667, v668, v669, v670;
            if v29.metaData.Action == "Edit" then
                v667 = nil;
                v668 = {};
                for v671 in ("Action.Play"):gmatch("([^.]+)") do
                    v668[#v668 + 1] = v671;
                end;
                v669 = v668;
                if not (v669[1] ~= nil) or v669[2] == nil then
                    v670 = "";
                else
                    if v667 == nil then
                        v667 = {};
                    end;
                    v670 = v28:getText(v669[1], v669[2], v667);
                end;
                if v670 then
                    goto label22;
                end;
            end;
            v667 = nil;
            v668 = {};
            for v672 in ("Action.Edit"):gmatch("([^.]+)") do
                v668[#v668 + 1] = v672;
            end;
            v669 = v668;
            if not (v669[1] ~= nil) or v669[2] == nil then
                v670 = "";
            else
                if v667 == nil then
                    v667 = {};
                end;
                v670 = v28:getText(v669[1], v669[2], v667);
            end;
            ::label22::;
            l_status_94.oldRole = "<b>" .. v670 .. "</b>";
            if v29.metaData.Action == "Edit" then
                v667 = nil;
                v668 = {};
                for v673 in ("Action.Edit"):gmatch("([^.]+)") do
                    v668[#v668 + 1] = v673;
                end;
                v669 = v668;
                if not (v669[1] ~= nil) or v669[2] == nil then
                    v670 = "";
                else
                    if v667 == nil then
                        v667 = {};
                    end;
                    v670 = v28:getText(v669[1], v669[2], v667);
                end;
                if v670 then
                    goto label23;
                end;
            end;
            v667 = nil;
            v668 = {};
            for v674 in ("Action.Play"):gmatch("([^.]+)") do
                v668[#v668 + 1] = v674;
            end;
            v669 = v668;
            if not (v669[1] ~= nil) or v669[2] == nil then
                v670 = "";
            else
                if v667 == nil then
                    v667 = {};
                end;
                v670 = v28:getText(v669[1], v669[2], v667);
            end;
            ::label23::;
            l_status_94.newRole = "<b>" .. v670 .. "</b>";
            v661.translation = l_v44_20(l_createdUnixTimeMs_92, l_status_94);
            v661.actorId = v29.userId;
            v661.actorName = v27(v29.userId);
            v661.iconType = "Group";
            v661.iconId = v29.resourceId or 0;
            v661.universeId = v29.universeId;
            v661.viewOnRobloxLink = "" .. tostring(v1) .. "/groups/" .. tostring(v29.resourceId) .. "";
            return v661;
        elseif v29.eventType == 93 then
            local v675 = {
                id = v29.id, 
                eventType = "PermissionsGroupRemoved", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_93 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_93_0 = l_createdUnixTimeMs_93 --[[ copy: 16 -> 40 ]];
            local l_status_95, l_result_95 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_93_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v675.date = not l_status_95 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_95;
            local l_v44_21 = v44;
            l_createdUnixTimeMs_93 = "Description.PermissionsGroupRemoved";
            l_status_95 = {
                groupRole = "<b>" .. v29.metaData.RolesetName .. "</b>", 
                groupName = "<b>" .. v29.metaData.GroupName .. "</b>"
            };
            local v681, v682, v683, v684;
            if v29.metaData.Action == "Edit" then
                v681 = nil;
                v682 = {};
                for v685 in ("Description.RoleEditor"):gmatch("([^.]+)") do
                    v682[#v682 + 1] = v685;
                end;
                v683 = v682;
                if not (v683[1] ~= nil) or v683[2] == nil then
                    v684 = "";
                else
                    if v681 == nil then
                        v681 = {};
                    end;
                    v684 = v28:getText(v683[1], v683[2], v681);
                end;
                if v684 then
                    goto label24;
                end;
            end;
            v681 = nil;
            v682 = {};
            for v686 in ("Description.RolePlayer"):gmatch("([^.]+)") do
                v682[#v682 + 1] = v686;
            end;
            v683 = v682;
            if not (v683[1] ~= nil) or v683[2] == nil then
                v684 = "";
            else
                if v681 == nil then
                    v681 = {};
                end;
                v684 = v28:getText(v683[1], v683[2], v681);
            end;
            ::label24::;
            l_status_95.role = "<b>" .. v684 .. "</b>";
            v675.translation = l_v44_21(l_createdUnixTimeMs_93, l_status_95);
            v675.actorId = v29.userId;
            v675.actorName = v27(v29.userId);
            v675.iconType = "Group";
            v675.iconId = v29.resourceId or 0;
            v675.universeId = v29.universeId;
            v675.viewOnRobloxLink = "" .. tostring(v1) .. "/groups/" .. tostring(v29.resourceId) .. "";
            return v675;
        elseif v29.eventType == 94 then
            local v687 = {
                id = v29.id, 
                eventType = "TeamCreate", 
                eventCategory = "Permissions"
            };
            local l_createdUnixTimeMs_94 = v29.createdUnixTimeMs;
            local l_status_96, l_result_96 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_94):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v687.date = not l_status_96 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_96;
            v687.translation = v44("Description.TeamCreate", {
                userName = "<b><u>" .. v27(v29.resourceId) .. "</u></b>"
            });
            v687.actorId = v29.userId;
            v687.actorName = v27(v29.userId);
            v687.iconType = "Universe";
            v687.iconId = v29.universeId;
            v687.universeId = v29.universeId;
            return v687;
        elseif v29.eventType == 95 then
            local v691 = {
                id = v29.id, 
                eventType = "PlaceIconAutoGenerated", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_95 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_95_0 = l_createdUnixTimeMs_95 --[[ copy: 16 -> 39 ]];
            local l_status_97, l_result_97 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_95_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v691.date = not l_status_97 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_97;
            l_createdUnixTimeMs_95 = nil;
            l_result_97 = {};
            for v696 in ("Description.PlaceIconAutoGenerated"):gmatch("([^.]+)") do
                l_result_97[#l_result_97 + 1] = v696;
            end;
            l_status_97 = l_result_97;
            local v697;
            if not (l_status_97[1] ~= nil) or l_status_97[2] == nil then
                v697 = "";
            else
                if l_createdUnixTimeMs_95 == nil then
                    l_createdUnixTimeMs_95 = {};
                end;
                v697 = v28:getText(l_status_97[1], l_status_97[2], l_createdUnixTimeMs_95);
            end;
            v691.translation = v697;
            v691.actorId = v29.userId;
            v691.actorName = v27(v29.userId);
            v691.iconType = "Place";
            v691.iconId = v29.placeId or 0;
            v691.universeId = v29.universeId;
            v691.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/icon";
            v691.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v691;
        elseif v29.eventType == 96 then
            local v698 = {
                id = v29.id, 
                eventType = "PlaceIconChanged", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_96 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_96_0 = l_createdUnixTimeMs_96 --[[ copy: 16 -> 38 ]];
            local l_status_98, l_result_98 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_96_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v698.date = not l_status_98 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_98;
            l_createdUnixTimeMs_96 = nil;
            l_result_98 = {};
            for v703 in ("Description.PlaceIconChanged"):gmatch("([^.]+)") do
                l_result_98[#l_result_98 + 1] = v703;
            end;
            l_status_98 = l_result_98;
            local v704;
            if not (l_status_98[1] ~= nil) or l_status_98[2] == nil then
                v704 = "";
            else
                if l_createdUnixTimeMs_96 == nil then
                    l_createdUnixTimeMs_96 = {};
                end;
                v704 = v28:getText(l_status_98[1], l_status_98[2], l_createdUnixTimeMs_96);
            end;
            v698.translation = v704;
            v698.actorId = v29.userId;
            v698.actorName = v27(v29.userId);
            v698.iconType = "Place";
            v698.iconId = v29.placeId or 0;
            v698.universeId = v29.universeId;
            v698.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/icon";
            v698.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v698;
        elseif v29.eventType == 97 then
            local v705 = {
                id = v29.id, 
                eventType = "PlaceIconRemoved", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_97 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_97_0 = l_createdUnixTimeMs_97 --[[ copy: 16 -> 37 ]];
            local l_status_99, l_result_99 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_97_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v705.date = not l_status_99 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_99;
            l_createdUnixTimeMs_97 = nil;
            l_result_99 = {};
            for v710 in ("Description.PlaceIconRemoved"):gmatch("([^.]+)") do
                l_result_99[#l_result_99 + 1] = v710;
            end;
            l_status_99 = l_result_99;
            local v711;
            if not (l_status_99[1] ~= nil) or l_status_99[2] == nil then
                v711 = "";
            else
                if l_createdUnixTimeMs_97 == nil then
                    l_createdUnixTimeMs_97 = {};
                end;
                v711 = v28:getText(l_status_99[1], l_status_99[2], l_createdUnixTimeMs_97);
            end;
            v705.translation = v711;
            v705.actorId = v29.userId;
            v705.actorName = v27(v29.userId);
            v705.iconType = "Place";
            v705.iconId = v29.placeId or 0;
            v705.universeId = v29.universeId;
            v705.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/icon";
            v705.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v705;
        elseif v29.eventType == 98 then
            local v712 = {
                id = v29.id, 
                eventType = "PlaceGearGenresOnlyAllowFromExperiencesGenre", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_98 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_98_0 = l_createdUnixTimeMs_98 --[[ copy: 16 -> 36 ]];
            local l_status_100, l_result_100 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_98_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v712.date = not l_status_100 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_100;
            l_createdUnixTimeMs_98 = nil;
            l_result_100 = {};
            for v717 in ("Description.PlaceGearGenresOnlyAllowFromExperiencesGenre"):gmatch("([^.]+)") do
                l_result_100[#l_result_100 + 1] = v717;
            end;
            l_status_100 = l_result_100;
            local v718;
            if not (l_status_100[1] ~= nil) or l_status_100[2] == nil then
                v718 = "";
            else
                if l_createdUnixTimeMs_98 == nil then
                    l_createdUnixTimeMs_98 = {};
                end;
                v718 = v28:getText(l_status_100[1], l_status_100[2], l_createdUnixTimeMs_98);
            end;
            v712.translation = v718;
            v712.actorId = v29.userId;
            v712.actorName = v27(v29.userId);
            v712.iconType = "Place";
            v712.iconId = v29.placeId or 0;
            v712.universeId = v29.universeId;
            v712.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/permissions";
            v712.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v712;
        elseif v29.eventType == 99 then
            local v719 = {
                id = v29.id, 
                eventType = "PlaceGearGenresAllowAllGearGenres", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_99 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_99_0 = l_createdUnixTimeMs_99 --[[ copy: 16 -> 35 ]];
            local l_status_101, l_result_101 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_99_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v719.date = not l_status_101 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_101;
            l_createdUnixTimeMs_99 = nil;
            l_result_101 = {};
            for v724 in ("Description.PlaceGearGenresAllowAllGearGenres"):gmatch("([^.]+)") do
                l_result_101[#l_result_101 + 1] = v724;
            end;
            l_status_101 = l_result_101;
            local v725;
            if not (l_status_101[1] ~= nil) or l_status_101[2] == nil then
                v725 = "";
            else
                if l_createdUnixTimeMs_99 == nil then
                    l_createdUnixTimeMs_99 = {};
                end;
                v725 = v28:getText(l_status_101[1], l_status_101[2], l_createdUnixTimeMs_99);
            end;
            v719.translation = v725;
            v719.actorId = v29.userId;
            v719.actorName = v27(v29.userId);
            v719.iconType = "Place";
            v719.iconId = v29.placeId or 0;
            v719.universeId = v29.universeId;
            v719.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/permissions";
            v719.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v719;
        elseif v29.eventType == 100 then
            local v726 = {
                id = v29.id, 
                eventType = "PlaceGearTypes", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_100 = v29.createdUnixTimeMs;
            local l_status_102, l_result_102 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_100):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v726.date = not l_status_102 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_102;
            v726.translation = v44("Description.PlaceGearTypes", {
                gearTypes = "<b>" .. joinStrings(v29.metaData.GearTypes) .. "</b>"
            });
            v726.actorId = v29.userId;
            v726.actorName = v27(v29.userId);
            v726.iconType = "Place";
            v726.iconId = v29.placeId or 0;
            v726.universeId = v29.universeId;
            v726.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/permissions";
            v726.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v726;
        elseif v29.eventType == 101 then
            local v730 = {
                id = v29.id, 
                eventType = "PlaceDownloadPermission", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_101 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_101_0 = l_createdUnixTimeMs_101 --[[ copy: 16 -> 34 ]];
            local l_status_103, l_result_103 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_101_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v730.date = not l_status_103 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_103;
            local l_v44_22 = v44;
            l_createdUnixTimeMs_101 = "Description.PlaceDownloadPermission";
            l_status_103 = {};
            local v736, v737, v738, v739;
            if string.lower(v29.metaData.Action) == "true" then
                v737 = nil;
                v738 = {};
                for v740 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v738[#v738 + 1] = v740;
                end;
                v739 = v738;
                if not (v739[1] ~= nil) or v739[2] == nil then
                    v736 = "";
                else
                    if v737 == nil then
                        v737 = {};
                    end;
                    v736 = v28:getText(v739[1], v739[2], v737);
                end;
                if v736 then
                    goto label25;
                end;
            end;
            v737 = nil;
            v738 = {};
            for v741 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v738[#v738 + 1] = v741;
            end;
            v739 = v738;
            if not (v739[1] ~= nil) or v739[2] == nil then
                v736 = "";
            else
                if v737 == nil then
                    v737 = {};
                end;
                v736 = v28:getText(v739[1], v739[2], v737);
            end;
            ::label25::;
            l_status_103.action = "<b>" .. v736 .. "</b>";
            l_status_103.placeName = "<b><u>" .. v29.metaData.PlaceName .. "</u></b>";
            v730.translation = l_v44_22(l_createdUnixTimeMs_101, l_status_103);
            v730.actorId = v29.userId;
            v730.actorName = v27(v29.userId);
            v730.iconType = "Place";
            v730.iconId = v29.placeId or 0;
            v730.universeId = v29.universeId;
            v730.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/permissions";
            v730.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v730;
        elseif v29.eventType == 102 then
            local v742 = {
                id = v29.id, 
                eventType = "PlaceGenre", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_102 = v29.createdUnixTimeMs;
            local l_status_104, l_result_104 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_102):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v742.date = not l_status_104 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_104;
            v742.translation = v44("Description.PlaceGenre", {
                genre = "<b>" .. v29.metaData.Genre .. "</b>"
            });
            v742.actorId = v29.userId;
            v742.actorName = v27(v29.userId);
            v742.iconType = "Place";
            v742.iconId = v29.placeId or 0;
            v742.universeId = v29.universeId;
            v742.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/configure";
            v742.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v742;
        elseif v29.eventType == 103 then
            local v746 = {
                id = v29.id, 
                eventType = "PlaceName", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_103 = v29.createdUnixTimeMs;
            local l_status_105, l_result_105 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_103):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v746.date = not l_status_105 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_105;
            v746.translation = v44("Description.PlaceName", {
                newName = "<b><u>" .. v29.metaData.NewName .. "</u></b>", 
                oldName = "<b><u>" .. v29.metaData.OldName .. "</u></b>"
            });
            v746.actorId = v29.userId;
            v746.actorName = v27(v29.userId);
            v746.iconType = "Place";
            v746.iconId = v29.placeId or 0;
            v746.universeId = v29.universeId;
            v746.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/configure";
            v746.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v746;
        elseif v29.eventType == 104 then
            local v750 = {
                id = v29.id, 
                eventType = "PlaceDescription", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_104 = v29.createdUnixTimeMs;
            local l_status_106, l_result_106 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_104):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v750.date = not l_status_106 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_106;
            v750.translation = v44("Description.PlaceDescription", {
                placeName = "<b><u>" .. v29.metaData.PlaceName .. "</u></b>"
            });
            v750.actorId = v29.userId;
            v750.actorName = v27(v29.userId);
            v750.iconType = "Place";
            v750.iconId = v29.placeId or 0;
            v750.universeId = v29.universeId;
            v750.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/configure";
            v750.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v750;
        elseif v29.eventType == 105 then
            local v754 = {
                id = v29.id, 
                eventType = "PlaceMaxVisitorCount", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_105 = v29.createdUnixTimeMs;
            local l_status_107, l_result_107 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_105):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v754.date = not l_status_107 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_107;
            v754.translation = v44("Description.PlaceMaxVisitorCount", {
                count = "<b>" .. v29.metaData.Count .. "</b>"
            });
            v754.actorId = v29.userId;
            v754.actorName = v27(v29.userId);
            v754.iconType = "Place";
            v754.iconId = v29.placeId or 0;
            v754.universeId = v29.universeId;
            v754.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/access";
            v754.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v754;
        elseif v29.eventType == 106 then
            local v758 = {
                id = v29.id, 
                eventType = "PlaceSocialSlotsRobloxOptimized", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_106 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_106_0 = l_createdUnixTimeMs_106 --[[ copy: 16 -> 33 ]];
            local l_status_108, l_result_108 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_106_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v758.date = not l_status_108 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_108;
            l_createdUnixTimeMs_106 = nil;
            l_result_108 = {};
            for v763 in ("Description.PlaceSocialSlotsRobloxOptimized"):gmatch("([^.]+)") do
                l_result_108[#l_result_108 + 1] = v763;
            end;
            l_status_108 = l_result_108;
            local v764;
            if not (l_status_108[1] ~= nil) or l_status_108[2] == nil then
                v764 = "";
            else
                if l_createdUnixTimeMs_106 == nil then
                    l_createdUnixTimeMs_106 = {};
                end;
                v764 = v28:getText(l_status_108[1], l_status_108[2], l_createdUnixTimeMs_106);
            end;
            v758.translation = v764;
            v758.actorId = v29.userId;
            v758.actorName = v27(v29.userId);
            v758.iconType = "Place";
            v758.iconId = v29.placeId or 0;
            v758.universeId = v29.universeId;
            v758.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/access";
            v758.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v758;
        elseif v29.eventType == 107 then
            local v765 = {
                id = v29.id, 
                eventType = "PlaceSocialSlotsDisabled", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_107 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_107_0 = l_createdUnixTimeMs_107 --[[ copy: 16 -> 32 ]];
            local l_status_109, l_result_109 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_107_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v765.date = not l_status_109 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_109;
            l_createdUnixTimeMs_107 = nil;
            l_result_109 = {};
            for v770 in ("Description.PlaceSocialSlotsDisabled"):gmatch("([^.]+)") do
                l_result_109[#l_result_109 + 1] = v770;
            end;
            l_status_109 = l_result_109;
            local v771;
            if not (l_status_109[1] ~= nil) or l_status_109[2] == nil then
                v771 = "";
            else
                if l_createdUnixTimeMs_107 == nil then
                    l_createdUnixTimeMs_107 = {};
                end;
                v771 = v28:getText(l_status_109[1], l_status_109[2], l_createdUnixTimeMs_107);
            end;
            v765.translation = v771;
            v765.actorId = v29.userId;
            v765.actorName = v27(v29.userId);
            v765.iconType = "Place";
            v765.iconId = v29.placeId or 0;
            v765.universeId = v29.universeId;
            v765.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/access";
            v765.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v765;
        elseif v29.eventType == 108 then
            local v772 = {
                id = v29.id, 
                eventType = "PlaceSocialSlotsCustomize", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_108 = v29.createdUnixTimeMs;
            local l_status_110, l_result_110 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_108):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v772.date = not l_status_110 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_110;
            v772.translation = v44("Description.PlaceSocialSlotsCustomize", {
                count = "<b>" .. v29.metaData.Count .. "</b>"
            });
            v772.actorId = v29.userId;
            v772.actorName = v27(v29.userId);
            v772.iconType = "Place";
            v772.iconId = v29.placeId or 0;
            v772.universeId = v29.universeId;
            v772.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/access";
            v772.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v772;
        elseif v29.eventType == 109 then
            local v776 = {
                id = v29.id, 
                eventType = "PlacePermissionsCreatePlaceAPI", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_109 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_109_0 = l_createdUnixTimeMs_109 --[[ copy: 16 -> 31 ]];
            local l_status_111, l_result_111 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_109_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v776.date = not l_status_111 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_111;
            local l_v44_23 = v44;
            l_createdUnixTimeMs_109 = "Description.PlacePermissionsCreatePlaceAPI";
            l_status_111 = {};
            local v782, v783, v784, v785;
            if string.lower(v29.metaData.Action) == "true" then
                v783 = nil;
                v784 = {};
                for v786 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v784[#v784 + 1] = v786;
                end;
                v785 = v784;
                if not (v785[1] ~= nil) or v785[2] == nil then
                    v782 = "";
                else
                    if v783 == nil then
                        v783 = {};
                    end;
                    v782 = v28:getText(v785[1], v785[2], v783);
                end;
                if v782 then
                    goto label26;
                end;
            end;
            v783 = nil;
            v784 = {};
            for v787 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v784[#v784 + 1] = v787;
            end;
            v785 = v784;
            if not (v785[1] ~= nil) or v785[2] == nil then
                v782 = "";
            else
                if v783 == nil then
                    v783 = {};
                end;
                v782 = v28:getText(v785[1], v785[2], v783);
            end;
            ::label26::;
            l_status_111.action = "<b>" .. v782 .. "</b>";
            l_status_111.placeName = "<b><u>" .. v29.metaData.PlaceName .. "</u></b>";
            v776.translation = l_v44_23(l_createdUnixTimeMs_109, l_status_111);
            v776.actorId = v29.userId;
            v776.actorName = v27(v29.userId);
            v776.iconType = "Place";
            v776.iconId = v29.placeId or 0;
            v776.universeId = v29.universeId;
            v776.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/permissions";
            v776.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v776;
        elseif v29.eventType == 110 then
            local v788 = {
                id = v29.id, 
                eventType = "PlacePermissionsSavePlaceAPI", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_110 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_110_0 = l_createdUnixTimeMs_110 --[[ copy: 16 -> 30 ]];
            local l_status_112, l_result_112 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_110_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v788.date = not l_status_112 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_112;
            local l_v44_24 = v44;
            l_createdUnixTimeMs_110 = "Description.PlacePermissionsSavePlaceAPI";
            l_status_112 = {};
            local v794, v795, v796, v797;
            if string.lower(v29.metaData.Action) == "true" then
                v795 = nil;
                v796 = {};
                for v798 in ("Description.ActionEnabled"):gmatch("([^.]+)") do
                    v796[#v796 + 1] = v798;
                end;
                v797 = v796;
                if not (v797[1] ~= nil) or v797[2] == nil then
                    v794 = "";
                else
                    if v795 == nil then
                        v795 = {};
                    end;
                    v794 = v28:getText(v797[1], v797[2], v795);
                end;
                if v794 then
                    goto label27;
                end;
            end;
            v795 = nil;
            v796 = {};
            for v799 in ("Description.ActionDisabled"):gmatch("([^.]+)") do
                v796[#v796 + 1] = v799;
            end;
            v797 = v796;
            if not (v797[1] ~= nil) or v797[2] == nil then
                v794 = "";
            else
                if v795 == nil then
                    v795 = {};
                end;
                v794 = v28:getText(v797[1], v797[2], v795);
            end;
            ::label27::;
            l_status_112.action = "<b>" .. v794 .. "</b>";
            l_status_112.placeName = "<b><u>" .. v29.metaData.PlaceName .. "</u></b>";
            v788.translation = l_v44_24(l_createdUnixTimeMs_110, l_status_112);
            v788.actorId = v29.userId;
            v788.actorName = v27(v29.userId);
            v788.iconType = "Place";
            v788.iconId = v29.placeId or 0;
            v788.universeId = v29.universeId;
            v788.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/permissions";
            v788.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v788;
        elseif v29.eventType == 111 then
            local v800 = {
                id = v29.id, 
                eventType = "PlaceRevert", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_111 = v29.createdUnixTimeMs;
            local l_status_113, l_result_113 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_111):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v800.date = not l_status_113 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_113;
            v800.translation = v44("Description.PlaceRevert", {
                placeName = "<b><u>" .. v29.metaData.PlaceName .. "</u></b>", 
                oldVersion = "<b>" .. v29.metaData.OldVersion .. "</b>", 
                newVersion = "<b>" .. v29.metaData.NewVersion .. "</b>"
            });
            v800.actorId = v29.userId;
            v800.actorName = v27(v29.userId);
            v800.iconType = "Place";
            v800.iconId = v29.placeId or 0;
            v800.universeId = v29.universeId;
            v800.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/version-history";
            v800.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v800;
        elseif v29.eventType == 112 then
            local v804 = {
                id = v29.id, 
                eventType = "PlaceShutDown", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_112 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_112_0 = l_createdUnixTimeMs_112 --[[ copy: 16 -> 29 ]];
            local l_status_114, l_result_114 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_112_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v804.date = not l_status_114 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_114;
            l_createdUnixTimeMs_112 = nil;
            l_result_114 = {};
            for v809 in ("Description.PlaceShutDown"):gmatch("([^.]+)") do
                l_result_114[#l_result_114 + 1] = v809;
            end;
            l_status_114 = l_result_114;
            local v810;
            if not (l_status_114[1] ~= nil) or l_status_114[2] == nil then
                v810 = "";
            else
                if l_createdUnixTimeMs_112 == nil then
                    l_createdUnixTimeMs_112 = {};
                end;
                v810 = v28:getText(l_status_114[1], l_status_114[2], l_createdUnixTimeMs_112);
            end;
            v804.translation = v810;
            v804.actorId = v29.userId;
            v804.actorName = v27(v29.userId);
            v804.iconType = "Place";
            v804.iconId = v29.placeId or 0;
            v804.universeId = v29.universeId;
            v804.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v804;
        elseif v29.eventType == 113 then
            local v811 = {
                id = v29.id, 
                eventType = "PlaceRestart", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_113 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_113_0 = l_createdUnixTimeMs_113 --[[ copy: 16 -> 28 ]];
            local l_status_115, l_result_115 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_113_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v811.date = not l_status_115 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_115;
            l_createdUnixTimeMs_113 = nil;
            l_result_115 = {};
            for v816 in ("Description.PlaceRestart"):gmatch("([^.]+)") do
                l_result_115[#l_result_115 + 1] = v816;
            end;
            l_status_115 = l_result_115;
            local v817;
            if not (l_status_115[1] ~= nil) or l_status_115[2] == nil then
                v817 = "";
            else
                if l_createdUnixTimeMs_113 == nil then
                    l_createdUnixTimeMs_113 = {};
                end;
                v817 = v28:getText(l_status_115[1], l_status_115[2], l_createdUnixTimeMs_113);
            end;
            v811.translation = v817;
            v811.actorId = v29.userId;
            v811.actorName = v27(v29.userId);
            v811.iconType = "Place";
            v811.iconId = v29.placeId or 0;
            v811.universeId = v29.universeId;
            v811.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v811;
        elseif v29.eventType == 114 then
            local v818 = {
                id = v29.id, 
                eventType = "PlaceThumbnailAltText", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_114 = v29.createdUnixTimeMs;
            local l_status_116, l_result_116 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_114):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v818.date = not l_status_116 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_116;
            v818.translation = v44("Description.PlaceThumbnailAltText", {
                thumbnailName = "<b>" .. v29.metaData.ThumbnailName .. "</b>"
            });
            v818.actorId = v29.userId;
            v818.actorName = v27(v29.userId);
            v818.iconType = "Place";
            v818.iconId = v29.placeId or 0;
            v818.universeId = v29.universeId;
            v818.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/thumbnails";
            v818.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v818;
        elseif v29.eventType == 115 then
            local v822 = {
                id = v29.id, 
                eventType = "PlaceThumbnailAdded", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_115 = v29.createdUnixTimeMs;
            local l_status_117, l_result_117 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_115):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v822.date = not l_status_117 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_117;
            v822.translation = v44("Description.PlaceThumbnailAdded", {
                thumbnailName = "<b>" .. v29.metaData.ThumbnailName .. "</b>"
            });
            v822.actorId = v29.userId;
            v822.actorName = v27(v29.userId);
            v822.iconType = "Place";
            v822.iconId = v29.placeId or 0;
            v822.universeId = v29.universeId;
            v822.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/thumbnails";
            v822.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v822;
        elseif v29.eventType == 116 then
            local v826 = {
                id = v29.id, 
                eventType = "PlaceThumbnailOrder", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_116 = v29.createdUnixTimeMs;
            local l_status_118, l_result_118 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_116):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v826.date = not l_status_118 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_118;
            v826.translation = "";
            v826.actorId = v29.userId;
            v826.actorName = v27(v29.userId);
            v826.iconType = "Universe";
            v826.iconId = v29.universeId;
            v826.universeId = v29.universeId;
            return v826;
        elseif v29.eventType == 117 then
            local v830 = {
                id = v29.id, 
                eventType = "PlaceThumbnailDeleted", 
                eventCategory = "Place"
            };
            local l_createdUnixTimeMs_117 = v29.createdUnixTimeMs;
            local l_status_119, l_result_119 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_117):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v830.date = not l_status_119 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_119;
            v830.translation = v44("Description.PlaceThumbnailDeleted", {
                thumbnailName = "<b>" .. v29.metaData.ThumbnailName .. "</b>"
            });
            v830.actorId = v29.userId;
            v830.actorName = v27(v29.userId);
            v830.iconType = "Place";
            v830.iconId = v29.placeId or 0;
            v830.universeId = v29.universeId;
            v830.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/" .. tostring(v29.placeId) .. "/thumbnails";
            v830.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v830;
        elseif v29.eventType == 118 then
            local v834 = {
                id = v29.id, 
                eventType = "PlaceAdded", 
                eventCategory = "Publish"
            };
            local l_createdUnixTimeMs_118 = v29.createdUnixTimeMs;
            local l_status_120, l_result_120 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_118):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v834.date = not l_status_120 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_120;
            v834.translation = v44("Description.PlaceAdded", {
                placeName = "<b><u>" .. v29.metaData.PlaceName .. "</u></b>"
            });
            v834.actorId = v29.userId;
            v834.actorName = v27(v29.userId);
            v834.iconType = "Place";
            v834.iconId = v29.placeId or 0;
            v834.universeId = v29.universeId;
            v834.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/manage";
            v834.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v834;
        elseif v29.eventType == 119 then
            local v838 = {
                id = v29.id, 
                eventType = "PlaceRemoved", 
                eventCategory = "Publish"
            };
            local l_createdUnixTimeMs_119 = v29.createdUnixTimeMs;
            local l_status_121, l_result_121 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_119):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v838.date = not l_status_121 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_121;
            v838.translation = v44("Description.PlaceRemoved", {
                placeName = "<b><u>" .. v29.metaData.PlaceName .. "</u></b>"
            });
            v838.actorId = v29.userId;
            v838.actorName = v27(v29.userId);
            v838.iconType = "Place";
            v838.iconId = v29.placeId or 0;
            v838.universeId = v29.universeId;
            v838.viewBasicSettingsLink = "" .. tostring(v31) .. "/places/manage";
            v838.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v838;
        elseif v29.eventType == 120 then
            local v842 = {
                id = v29.id, 
                eventType = "PlacePublished", 
                eventCategory = "Publish"
            };
            local l_createdUnixTimeMs_120 = v29.createdUnixTimeMs;
            local l_status_122, l_result_122 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_120):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v842.date = not l_status_122 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_122;
            v842.translation = v44("Description.PlacePublished", {
                placeName = "<b><u>" .. v29.metaData.PlaceName .. "</u></b>"
            });
            v842.actorId = v29.userId;
            v842.actorName = v27(v29.userId);
            v842.iconType = "Place";
            v842.iconId = v29.placeId or 0;
            v842.universeId = v29.universeId;
            v842.viewOnRobloxLink = "" .. tostring(v1) .. "/games/" .. tostring(v29.placeId) .. "";
            return v842;
        elseif v29.eventType == 121 then
            local v846 = {
                id = v29.id, 
                eventType = "CompletedQuestionnaire", 
                eventCategory = "Experience"
            };
            local l_createdUnixTimeMs_121 = v29.createdUnixTimeMs;
            local l_l_createdUnixTimeMs_121_0 = l_createdUnixTimeMs_121 --[[ copy: 16 -> 27 ]];
            local l_status_123, l_result_123 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_l_createdUnixTimeMs_121_0):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v846.date = not l_status_123 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_123;
            l_createdUnixTimeMs_121 = nil;
            l_result_123 = {};
            for v851 in ("Description.CompletedQuestionnaire"):gmatch("([^.]+)") do
                l_result_123[#l_result_123 + 1] = v851;
            end;
            l_status_123 = l_result_123;
            local v852;
            if not (l_status_123[1] ~= nil) or l_status_123[2] == nil then
                v852 = "";
            else
                if l_createdUnixTimeMs_121 == nil then
                    l_createdUnixTimeMs_121 = {};
                end;
                v852 = v28:getText(l_status_123[1], l_status_123[2], l_createdUnixTimeMs_121);
            end;
            v846.translation = v852;
            v846.actorId = v29.userId;
            v846.actorName = v27(v29.userId);
            v846.iconType = "Universe";
            v846.iconId = v29.universeId;
            v846.universeId = v29.universeId;
            v846.viewBasicSettingsLink = "" .. tostring(v31) .. "/experience-questionnaire";
            return v846;
        elseif v29.eventType == 122 then
            local v853 = {
                id = v29.id, 
                eventType = "MonetizationSettingsPrivateServerRequiresRobux", 
                eventCategory = "Unknown"
            };
            local l_createdUnixTimeMs_122 = v29.createdUnixTimeMs;
            local l_status_124, l_result_124 = pcall(function()
                return DateTime.fromUnixTimestampMillis(l_createdUnixTimeMs_122):FormatLocalTime("MMM D, h:mm a", v30);
            end);
            v853.date = not l_status_124 and "\240\159\164\183\240\159\143\187\226\128\141\226\153\128\239\184\143" or l_result_124;
            v853.translation = v44("Description.MonetizationSettingsPrivateServerRequiresRobux", {
                price = "<b>" .. v29.metaData.Price .. "</b>"
            });
            v853.actorId = v29.userId;
            v853.actorName = v27(v29.userId);
            v853.iconType = "Universe";
            v853.iconId = v29.universeId;
            v853.universeId = v29.universeId;
            v853.viewBasicSettingsLink = "" .. tostring(v31) .. "/access";
            return v853;
        else
            return {
                id = tostring(math.random()), 
                universeId = 0, 
                eventType = "Unknown", 
                date = "", 
                translation = "unknown event", 
                actorId = 0, 
                actorName = "unknown", 
                iconId = 0, 
                iconType = "Unknown", 
                eventCategory = ""
            };
        end;
    end, 
    eventTypeToCategory = function(v857)
        if v857 == 0 then
            return "Unknown";
        elseif v857 == 1 then
            return "Experience";
        elseif v857 == 2 then
            return "Experience";
        elseif v857 == 3 then
            return "Experience";
        elseif v857 == 4 then
            return "Experience";
        elseif v857 == 5 then
            return "Experience";
        elseif v857 == 6 then
            return "Experience";
        elseif v857 == 7 then
            return "Experience";
        elseif v857 == 8 then
            return "Experience";
        elseif v857 == 9 then
            return "Experience";
        elseif v857 == 10 then
            return "Experience";
        elseif v857 == 11 then
            return "Experience";
        elseif v857 == 12 then
            return "Experience";
        elseif v857 == 13 then
            return "Experience";
        elseif v857 == 14 then
            return "Experience";
        elseif v857 == 15 then
            return "Experience";
        elseif v857 == 16 then
            return "Experience";
        elseif v857 == 17 then
            return "Experience";
        elseif v857 == 18 then
            return "Unknown";
        elseif v857 == 19 then
            return "Experience";
        elseif v857 == 20 then
            return "Experience";
        elseif v857 == 21 then
            return "Experience";
        elseif v857 == 22 then
            return "Experience";
        elseif v857 == 23 then
            return "Experience";
        elseif v857 == 24 then
            return "Experience";
        elseif v857 == 25 then
            return "Experience";
        elseif v857 == 26 then
            return "Experience";
        elseif v857 == 27 then
            return "Experience";
        elseif v857 == 28 then
            return "Experience";
        elseif v857 == 29 then
            return "Experience";
        elseif v857 == 30 then
            return "Experience";
        elseif v857 == 31 then
            return "Experience";
        elseif v857 == 32 then
            return "Experience";
        elseif v857 == 33 then
            return "Experience";
        elseif v857 == 34 then
            return "Localization";
        elseif v857 == 35 then
            return "Localization";
        elseif v857 == 36 then
            return "Localization";
        elseif v857 == 37 then
            return "Localization";
        elseif v857 == 38 then
            return "Localization";
        elseif v857 == 39 then
            return "Unknown";
        elseif v857 == 40 then
            return "Unknown";
        elseif v857 == 41 then
            return "Localization";
        elseif v857 == 42 then
            return "Localization";
        elseif v857 == 43 then
            return "Localization";
        elseif v857 == 44 then
            return "Localization";
        elseif v857 == 45 then
            return "Localization";
        elseif v857 == 46 then
            return "Localization";
        elseif v857 == 47 then
            return "Localization";
        elseif v857 == 48 then
            return "Unknown";
        elseif v857 == 49 then
            return "Localization";
        elseif v857 == 50 then
            return "Localization";
        elseif v857 == 51 then
            return "Localization";
        elseif v857 == 52 then
            return "Localization";
        elseif v857 == 53 then
            return "Localization";
        elseif v857 == 54 then
            return "Localization";
        elseif v857 == 55 then
            return "Localization";
        elseif v857 == 56 then
            return "Localization";
        elseif v857 == 57 then
            return "Localization";
        elseif v857 == 58 then
            return "Localization";
        elseif v857 == 59 then
            return "Localization";
        elseif v857 == 60 then
            return "Localization";
        elseif v857 == 61 then
            return "Localization";
        elseif v857 == 62 then
            return "Localization";
        elseif v857 == 63 then
            return "Localization";
        elseif v857 == 64 then
            return "Localization";
        elseif v857 == 65 then
            return "Localization";
        elseif v857 == 66 then
            return "Monetization";
        elseif v857 == 67 then
            return "Monetization";
        elseif v857 == 68 then
            return "Monetization";
        elseif v857 == 69 then
            return "Monetization";
        elseif v857 == 70 then
            return "Monetization";
        elseif v857 == 71 then
            return "Monetization";
        elseif v857 == 72 then
            return "Monetization";
        elseif v857 == 73 then
            return "Monetization";
        elseif v857 == 74 then
            return "Monetization";
        elseif v857 == 75 then
            return "Monetization";
        elseif v857 == 76 then
            return "Monetization";
        elseif v857 == 77 then
            return "Monetization";
        elseif v857 == 78 then
            return "Monetization";
        elseif v857 == 79 then
            return "Monetization";
        elseif v857 == 80 then
            return "Monetization";
        elseif v857 == 81 then
            return "Monetization";
        elseif v857 == 82 then
            return "Monetization";
        elseif v857 == 83 then
            return "Monetization";
        elseif v857 == 84 then
            return "Monetization";
        elseif v857 == 85 then
            return "Monetization";
        elseif v857 == 86 then
            return "Monetization";
        elseif v857 == 87 then
            return "Monetization";
        elseif v857 == 88 then
            return "Permissions";
        elseif v857 == 89 then
            return "Permissions";
        elseif v857 == 90 then
            return "Permissions";
        elseif v857 == 91 then
            return "Permissions";
        elseif v857 == 92 then
            return "Permissions";
        elseif v857 == 93 then
            return "Permissions";
        elseif v857 == 94 then
            return "Permissions";
        elseif v857 == 95 then
            return "Place";
        elseif v857 == 96 then
            return "Place";
        elseif v857 == 97 then
            return "Place";
        elseif v857 == 98 then
            return "Place";
        elseif v857 == 99 then
            return "Place";
        elseif v857 == 100 then
            return "Place";
        elseif v857 == 101 then
            return "Place";
        elseif v857 == 102 then
            return "Place";
        elseif v857 == 103 then
            return "Place";
        elseif v857 == 104 then
            return "Place";
        elseif v857 == 105 then
            return "Place";
        elseif v857 == 106 then
            return "Place";
        elseif v857 == 107 then
            return "Place";
        elseif v857 == 108 then
            return "Place";
        elseif v857 == 109 then
            return "Place";
        elseif v857 == 110 then
            return "Place";
        elseif v857 == 111 then
            return "Place";
        elseif v857 == 112 then
            return "Place";
        elseif v857 == 113 then
            return "Place";
        elseif v857 == 114 then
            return "Place";
        elseif v857 == 115 then
            return "Place";
        elseif v857 == 116 then
            return "Unknown";
        elseif v857 == 117 then
            return "Place";
        elseif v857 == 118 then
            return "Publish";
        elseif v857 == 119 then
            return "Publish";
        elseif v857 == 120 then
            return "Publish";
        elseif v857 == 121 then
            return "Experience";
        elseif v857 == 122 then
            return "Unknown";
        else
            return "Unknown";
        end;
    end
};
