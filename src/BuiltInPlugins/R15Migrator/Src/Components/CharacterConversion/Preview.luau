local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Src.Components.CharacterConversion.InstanceTree);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Util_0 = v1.Util;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Pane_0 = l_UI_0.Pane;
local v9 = v2.PureComponent:extend("CharacterPreview");
v9.init = function(v10, _)
    v10.onViewModelLoaded = function(v12)
        v12:MoveTo((Vector3.new()));
    end;
    v10.onSelectionChanged = function(v13)
        if v10.props.OnSelectionChange then
            v10.props.OnSelectionChange(v13);
        end;
    end;
    v10.getMatchingInstance = function(v14, v15)
        for _, v17 in v14:GetDescendants() do
            if not (not (v17.Name == v15) or not v3.isValidDisplayInstance(v17)) then
                return v17;
            end;
        end;
        return nil;
    end;
    local function v25(v18)
        local l_Parent_0 = v18.Parent;
        if l_Parent_0 then
            local l_SpecialMesh_0 = v18:FindFirstChildWhichIsA("SpecialMesh");
            if not l_SpecialMesh_0 then
                local v21 = v18.Name:gsub("%s+", "");
                for _, v23 in l_Parent_0:GetChildren() do
                    if v23:IsA("CharacterMesh") then
                        local l_BodyPart_0 = v23.BodyPart;
                        if l_BodyPart_0 and l_BodyPart_0.Name == v21 then
                            return v23;
                        end;
                    end;
                end;
                return nil;
            else
                return l_SpecialMesh_0;
            end;
        else
            return nil;
        end;
    end;
    v10.applySelectionEffect = function(v26)
        local l_SelectionColor_0 = v10.props.Stylizer.SelectionColor;
        if v26 then
            local function _(v28)
                v28.Color = l_SelectionColor_0;
                v28.Material = Enum.Material.Neon;
                v28.Transparency = 0.5;
                if v28:IsA("MeshPart") then
                    v28.TextureID = "";
                end;
            end;
            local function _(v30)
                local l_Part_0 = Instance.new("Part");
                l_Part_0.Name = "SelectionPart";
                l_Part_0.Anchored = true;
                l_Part_0.CanCollide = false;
                l_Part_0.CFrame = v30.CFrame;
                l_Part_0.Locked = true;
                l_Part_0.Size = v30.Size;
                l_Part_0.Parent = v30.Parent;
                l_Part_0.Color = l_SelectionColor_0;
                l_Part_0.Material = Enum.Material.Neon;
                l_Part_0.Transparency = 0.5;
                if l_Part_0:IsA("MeshPart") then
                    l_Part_0.TextureID = "";
                end;
            end;
            if not v26:IsA("MeshPart") then
                if not v26:IsA("BasePart") then
                    if v26:IsA("Accoutrement") then
                        local l_Handle_0 = v26:FindFirstChild("Handle");
                        if l_Handle_0 then
                            if not l_Handle_0:IsA("MeshPart") then
                                local l_Part_1 = Instance.new("Part");
                                l_Part_1.Name = "SelectionPart";
                                l_Part_1.Anchored = true;
                                l_Part_1.CanCollide = false;
                                l_Part_1.CFrame = l_Handle_0.CFrame;
                                l_Part_1.Locked = true;
                                l_Part_1.Size = l_Handle_0.Size;
                                l_Part_1.Parent = l_Handle_0.Parent;
                                l_Part_1.Color = l_SelectionColor_0;
                                l_Part_1.Material = Enum.Material.Neon;
                                l_Part_1.Transparency = 0.5;
                                if l_Part_1:IsA("MeshPart") then
                                    l_Part_1.TextureID = "";
                                end;
                            else
                                l_Handle_0.Color = l_SelectionColor_0;
                                l_Handle_0.Material = Enum.Material.Neon;
                                l_Handle_0.Transparency = 0.5;
                                if l_Handle_0:IsA("MeshPart") then
                                    l_Handle_0.TextureID = "";
                                    return ;
                                end;
                            end;
                        end;
                    end;
                elseif not v25(v26) then
                    v26.Color = l_SelectionColor_0;
                    v26.Material = Enum.Material.Neon;
                    v26.Transparency = 0.5;
                    if v26:IsA("MeshPart") then
                        v26.TextureID = "";
                        return ;
                    end;
                else
                    local l_Part_2 = Instance.new("Part");
                    l_Part_2.Name = "SelectionPart";
                    l_Part_2.Anchored = true;
                    l_Part_2.CanCollide = false;
                    l_Part_2.CFrame = v26.CFrame;
                    l_Part_2.Locked = true;
                    l_Part_2.Size = v26.Size;
                    l_Part_2.Parent = v26.Parent;
                    l_Part_2.Color = l_SelectionColor_0;
                    l_Part_2.Material = Enum.Material.Neon;
                    l_Part_2.Transparency = 0.5;
                    if l_Part_2:IsA("MeshPart") then
                        l_Part_2.TextureID = "";
                        return ;
                    end;
                end;
                return ;
            else
                v26.Color = l_SelectionColor_0;
                v26.Material = Enum.Material.Neon;
                v26.Transparency = 0.5;
                if v26:IsA("MeshPart") then
                    v26.TextureID = "";
                end;
                v26.Color = l_SelectionColor_0;
                v26.Material = Enum.Material.Neon;
                v26.TextureID = "";
                v26.Transparency = 0.5;
                return ;
            end;
        else
            return ;
        end;
    end;
    v10.setupAssetRenderModel = function(v36)
        if v36 then
            local l_Selection_0 = v10.props.Selection;
            local v38 = v36:Clone();
            for v39, v40 in l_Selection_0, nil, nil do
                if v40 then
                    v10.applySelectionEffect((v10.getMatchingInstance(v38, v39)));
                end;
            end;
            return v38;
        else
            return nil;
        end;
    end;
end;
v9.render = function(v41)
    local l_props_0 = v41.props;
    local l_Character_0 = l_props_0.Character;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createFragment({
        ViewPortPane = v2.createElement(l_Pane_0, {
            BackgroundColor3 = l_Stylizer_0.ViewportBackgroundColor, 
            BackgroundTransparency = 0, 
            LayoutOrder = l_Util_0.LayoutOrderIterator.new():getNextOrder(), 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.ViewportHeight)
        }, {
            Viewport = v2.createElement(l_AssetRenderModel_0, {
                DisablePan = true, 
                DisableZoom = true, 
                FocusDirection = Vector3.new(0, 0, -1), 
                Model = v41.setupAssetRenderModel(l_Character_0), 
                OnViewModelLoaded = v41.onViewModelLoaded, 
                RecenterModelOnUpdate = false, 
                Size = UDim2.fromScale(1, 1)
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
