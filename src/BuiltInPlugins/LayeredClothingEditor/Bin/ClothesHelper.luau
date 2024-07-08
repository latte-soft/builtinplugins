local _ = game:GetService("ChangeHistoryService");
local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent;
local l_ConfirmDialog_0 = require(l_Parent_0.Packages.AvatarToolsShared).Components.ConfirmDialog;
local l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 = game:GetFastFlag("FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds");
local v5 = require(l_Parent_0.Src.Util.ShowDialog);
local function _(v6, v7)
    local v8 = true;
    if v7 ~= "" then
        v8 = v6:sub(-#v7) == v7;
    end;
    return v8;
end;
local function _(v10)
    if not (v10.Name:sub(-10) == "Attachment") then
        v10.Name = tostring(v10.Name) .. "Attachment";
    end;
end;
local function v27(v12, v13)
    local v14 = 0;
    if v12:IsA("Model") then
        local v15 = {};
        for _, v17 in pairs(v12:GetDescendants()) do
            if v17:IsA("WrapLayer") then
                table.insert(v15, v17);
            end;
        end;
        if #v15 == 0 then
            table.insert(v13.NoWrapLayerError, v12.Name);
            return v14;
        else
            for _, v19 in ipairs(v15) do
                local l_Parent_1 = v19.Parent;
                if not (not l_Parent_1 or not l_Parent_1:IsA("MeshPart")) then
                    local l_Accessory_0 = Instance.new("Accessory");
                    local v22 = string.lower(l_Parent_1.Name);
                    if not string.match(v22, "left") then
                        if not string.match(v22, "right") then
                            l_Accessory_0.Name = v12.Name;
                        else
                            l_Accessory_0.Name = v12.Name .. "_Right";
                        end;
                    else
                        l_Accessory_0.Name = v12.Name .. "_Left";
                    end;
                    local v23 = l_Parent_1:Clone();
                    local v24 = 0;
                    for _, v26 in pairs(v23:GetDescendants()) do
                        if not ((v26:IsA("WrapLayer") or v26:IsA("SurfaceAppearance")) or v26:IsA("Attachment")) then
                            v26:Destroy();
                        end;
                        if v26:IsA("Attachment") then
                            v24 = v24 + 1;
                            if not (v26.Name:sub(-10) == "Attachment") then
                                v26.Name = tostring(v26.Name) .. "Attachment";
                            end;
                        end;
                    end;
                    v23.Name = "Handle";
                    v23.Parent = l_Accessory_0;
                    l_Accessory_0.Parent = v12.Parent;
                    if v24 == 0 then
                        table.insert(v13.NoAttachmentsError, l_Parent_1.Name);
                        l_Accessory_0:Destroy();
                    else
                        v14 = v14 + 1;
                    end;
                end;
            end;
            return v14;
        end;
    else
        table.insert(v13.IncorrectTypeError, v12.Name);
        return v14;
    end;
end;
local function v32(v28)
    if not v28 or #v28 == 0 then
        return "";
    else
        local v29 = ":\n";
        for v30, v31 in ipairs(v28) do
            v29 = v29 .. v31;
            if v30 ~= #v28 then
                v29 = v29 .. ",\n";
            end;
        end;
        return v29;
    end;
end;
local function v37(v33, v34, v35, v36)
    if not v36 or #v36 > 0 then
        v5(v33, v34, l_ConfirmDialog_0, {
            Text = v35 .. v32(v36), 
            Resizable = true
        });
    end;
end;
local function v48(v38, v39, v40)
    local v41 = l_Selection_0:Get();
    if #v41 == 0 then
        v37(v38, v39, v39:getText("ClothesHelper", "NoSelectionError"));
        return ;
    else
        local v42 = {
            NoAttachmentsError = {}, 
            NoWrapLayerError = {}, 
            IncorrectTypeError = {}
        };
        local v43 = 0;
        for _, v45 in ipairs(v41) do
            v43 = v43 + v27(v45, v42);
        end;
        v40:getHandler("CreateAccessory")(v43);
        for v46, v47 in pairs(v42) do
            v37(v38, v39, v39:getText("ClothesHelper", v46), v47);
        end;
        return ;
    end;
end;
return {
    init = function(_, v50, v51, v52, v53)
        local l_v51_Button_0 = v51:CreateButton(if not l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then v52:getText("ClothesHelper", "CreateAccessory") else "CreateAccessory", v52:getText("ClothesHelper", "CreateAccessoryTooltip"), "rbxlocaltheme://CreateAccessory");
        l_v51_Button_0.ClickableWhenViewportHidden = true;
        l_v51_Button_0.Click:connect(function()
            v48(v50, v52, v53);
        end);
    end
};
