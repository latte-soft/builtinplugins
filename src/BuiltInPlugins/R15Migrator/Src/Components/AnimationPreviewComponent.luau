local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local v5 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Signal_0 = v1.Util.Signal;
local v12 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local v13 = require(l_script_FirstAncestor_0.Src.Modules.NpcIdManager);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v15 = require(l_Components_0.DisplayAvatarsComponent);
local v16 = require(l_Components_0.MediaPlayerControls);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetPreviewSpeed);
local v18 = require(l_script_FirstAncestor_0.Src.Thunks.CreateWorldModels);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local v20 = require(l_AnimationConversion_0.resetCharacter);
local v21 = require(l_AnimationConversion_0.AnimationConversionManager);
local v22 = require(l_script_FirstAncestor_0.Src.Util.sanitizeString);
local l_PreviewSpeeds_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).PreviewSpeeds;
local v24 = v2.PureComponent:extend("AnimationPreviewComponent");
local function v31(v25)
    local v26 = v5.Dictionary.values(v25.props.characters);
    local v27 = v5.Dictionary.values(v25.props.convertedCharacters);
    v25.selectionModels = v5.List.join(v25.defaultSelections, v26, v27);
    local v28 = #v25.defaultSelections + #v26;
    for v29, v30 in v27, nil, nil do
        if v12.IsR15Complete((v13.GetNpcFromId(v30.key))) then
            coroutine.wrap(function()
                v25.props.CreateWorldModels(v30.key, v30.model);
                v25:setState({
                    currentIndex = v28 + v29
                });
            end)();
            return ;
        end;
    end;
    v25:setState({
        currentIndex = 1
    });
end;
local function v33()
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    l_HumanoidDescription_0.HeadColor = BrickColor.new("Bright yellow").Color;
    l_HumanoidDescription_0.TorsoColor = BrickColor.new("Bright blue").Color;
    l_HumanoidDescription_0.LeftArmColor = BrickColor.new("Bright yellow").Color;
    l_HumanoidDescription_0.LeftLegColor = BrickColor.new("Bright yellow").Color;
    l_HumanoidDescription_0.RightLegColor = BrickColor.new("Bright yellow").Color;
    l_HumanoidDescription_0.RightArmColor = BrickColor.new("Bright yellow").Color;
    return l_HumanoidDescription_0;
end;
v24.init = function(v34)
    v34.state = {
        currentIndex = 0, 
        isPlaying = false, 
        isLoaded = false, 
        currentTime = 0, 
        length = 1
    };
    v34.selectionModels = {};
    v34.selectSpeed = function(v35)
        v34.props.SetPreviewSpeed(v35.Id);
    end;
    v34.selectItem = function(_, v37)
        if v34.state.currentIndex == v37 then
            return ;
        else
            coroutine.wrap(function()
                if v34.selectionModels[v37].key then
                    local v38 = v34.selectionModels[v37];
                    v34.props.CreateWorldModels(v38.key, v38.model);
                end;
                v34:setState({
                    currentIndex = v37
                });
            end)();
            return ;
        end;
    end;
    v34.loaded = l_Signal_0.new();
    v34.tracks = {};
    v34.animators = {};
    v34.loaded:Connect(function(v39, v40, v41)
        if not v34.isUnmounting then
            if not v39 then
                if not (v34.tracks[1] ~= v40) or v34.tracks[2] == v40 then
                    v34:unload();
                end;
            else
                table.insert(v34.tracks, v40);
                table.insert(v34.animators, v41);
                if #v34.tracks > 1 then
                    for _, v43 in v34.tracks, nil, nil do
                        v43:Play();
                    end;
                    v34:load();
                    return ;
                end;
            end;
            return ;
        else
            return ;
        end;
    end);
    task.spawn(function()
        local v44 = {
            0, 
            320912307
        };
        v34.defaultSelections = {};
        for _, v46 in v44, nil, nil do
            local l_status_0, l_result_0 = pcall(function()
                if v46 == 0 then
                    return (v33());
                else
                    return game.Players:GetHumanoidDescriptionFromOutfitId(v46);
                end;
            end);
            if not l_status_0 then
                l_result_0 = v33();
            end;
            local l_HumanoidModelFromDescription_0 = game:GetService("Players"):CreateHumanoidModelFromDescription(l_result_0, Enum.HumanoidRigType.R6);
            local l_HumanoidModelFromDescription_1 = game:GetService("Players"):CreateHumanoidModelFromDescription(l_result_0, Enum.HumanoidRigType.R15);
            v20(l_HumanoidModelFromDescription_0);
            v20(l_HumanoidModelFromDescription_1);
            local l_WorldModel_0 = Instance.new("WorldModel");
            local l_WorldModel_1 = Instance.new("WorldModel");
            l_HumanoidModelFromDescription_0.Parent = l_WorldModel_0;
            l_HumanoidModelFromDescription_1.Parent = l_WorldModel_1;
            table.insert(v34.defaultSelections, {
                resetPreviewModel = l_WorldModel_0, 
                resetConvertedModel = l_WorldModel_1
            });
        end;
        if not v34.isUnmounting then
            v31(v34);
            return ;
        else
            return ;
        end;
    end);
end;
v24.start = function(v53)
    if not v53.runningConnection then
        v53.runningConnection = game:GetService("RunService").Heartbeat:Connect(function(v54)
            local v55 = v54 * v53.props.previewSpeed;
            for _, v57 in v53.animators, nil, nil do
                v57:StepAnimations(v55);
            end;
            v53:setState({
                currentTime = (v53.state.currentTime + v55) % v53.state.length
            });
        end);
        return ;
    else
        return ;
    end;
end;
v24.stop = function(v58)
    if v58.runningConnection then
        v58.runningConnection:Disconnect();
    end;
    v58.runningConnection = nil;
end;
v24.load = function(v59)
    v59:start();
    v59:setState({
        currentTime = 0, 
        isPlaying = true, 
        isLoaded = true, 
        length = v59.tracks[1].Length < 1.0E-5 and 1 or v59.tracks[1].Length
    });
end;
v24.play = function(v60)
    v60:start();
    v60:setState({
        isPlaying = true
    });
end;
v24.pause = function(v61)
    v61:stop();
    v61:setState({
        isPlaying = false
    });
end;
v24.unload = function(v62)
    v62.tracks = {};
    v62.animators = {};
    v62:stop();
    v62:setState({
        currentTime = 0, 
        length = 1, 
        isPlaying = false, 
        isLoaded = false
    });
end;
v24.scrub = function(v63, v64)
    if v63.state.isPlaying then
        v63:pause();
    end;
    local v65 = nil;
    v65 = if v63.state.currentTime <= v64 then v64 - v63.state.currentTime else (v63.state.length - v63.state.currentTime) + v64;
    for _, v67 in v63.animators, nil, nil do
        v67:StepAnimations(v65);
    end;
    v63:setState({
        currentTime = v64
    });
end;
v24.willUnmount = function(v68)
    v68.isUnmounting = true;
    v68:stop();
end;
v24.buildItems = function(v69)
    local l_Localization_0 = v69.props.Localization;
    local v71 = {};
    for v72, v73 in v69.selectionModels, nil, nil do
        if not v73.key then
            v71[v72] = l_Localization_0:getText("AvatarSelection", "DefaultAvatar") .. " " .. v72;
        else
            v71[v72] = string.sub(v73.fullName, (string.find(v73.fullName, ".[^.]*$") or 0) + 1, -1);
            v71[v72] = v22(v71[v72]);
        end;
    end;
    return v71;
end;
v24.buildSpeedItems = function(_)
    local v75 = {};
    for v76, v77 in l_PreviewSpeeds_0, nil, nil do
        v75[v76] = {
            Id = v77, 
            Label = string.format("%.2f", v77)
        };
    end;
    return v75;
end;
v24.getModels = function(v78, v79)
    local l_worldModels_0 = v78.props.worldModels;
    if v79 == 0 then
        return nil, nil;
    else
        local v81 = v78.selectionModels[v79];
        if not v81.key then
            return v81.resetPreviewModel, v81.resetConvertedModel;
        else
            local v82 = l_worldModels_0[v81.key];
            if v82 then
                return v82.resetPreviewModel, v82.resetConvertedModel;
            else
                return nil, nil;
            end;
        end;
    end;
end;
v24.didUpdate = function(v83, v84)
    if v84.characterMetadataLoadedVersion ~= v83.props.characterMetadataLoadedVersion then
        v31(v83);
    end;
end;
v24.render = function(v85)
    local l_props_0 = v85.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_previewSelection_0 = l_props_0.previewSelection;
    local l_previewSpeed_0 = l_props_0.previewSpeed;
    local l_Localization_1 = l_props_0.Localization;
    local v91 = if not l_previewSelection_0 then nil else v21.getAnimationAssetInfo(l_previewSelection_0);
    local v92 = if not v91 then nil else v91.url;
    local l_url_0 = v21.getConvertedAnimationAssetInfo(v91).url;
    local l_currentIndex_0 = v85.state.currentIndex;
    local v95, v96 = v85:getModels(l_currentIndex_0);
    local l_state_0 = v85.state;
    local l_isPlaying_0 = l_state_0.isPlaying;
    local l_isLoaded_0 = l_state_0.isLoaded;
    local l_currentTime_0 = l_state_0.currentTime;
    local l_length_0 = l_state_0.length;
    local v102 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Spacing = l_Stylizer_0.Spacing
    }, {
        PreviewContainer = v2.createElement(l_Pane_0, {
            LayoutOrder = v102:getNextOrder(), 
            Size = l_Stylizer_0.PreviewContainerSize
        }, {
            Avatars = v2.createElement(v15, {
                Animation1 = v92, 
                Animation2 = l_url_0, 
                Model1 = v95, 
                Model2 = v96, 
                Loaded = v85.loaded
            })
        }), 
        Controls = v2.createElement(v16, {
            LayoutOrder = v102:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 32), 
            CurrentTime = l_currentTime_0, 
            TimeLength = l_length_0, 
            IsPlaying = l_isPlaying_0, 
            IsLoaded = l_isLoaded_0, 
            OnPlay = function()
                v85:play();
            end, 
            OnPause = function()
                v85:pause();
            end, 
            OnScrub = function(v103)
                v85:scrub(v103);
            end
        }), 
        SelectContainer = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v102:getNextOrder()
        }, {
            Title = if not not v91 and v85.props.animations[v91.id] then v2.createElement(l_TextLabel_0, {
                Text = v85.props.animations[v91.id].name, 
                LayoutOrder = v102:getNextOrder(), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.fromScale(0.5, 0)
            }) else nil, 
            SelectContainer = v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(0.5, 0), 
                Spacing = l_Stylizer_0.Spacing, 
                LayoutOrder = v102:getNextOrder()
            }, {
                SpeedLabel = v2.createElement(l_TextLabel_0, {
                    Text = l_Localization_1:getText("AnimationPreview", "PreviewSpeed"), 
                    LayoutOrder = v102:getNextOrder(), 
                    AutomaticSize = Enum.AutomaticSize.XY
                }), 
                SpeedInput = v2.createElement(l_SelectInput_0, {
                    SelectedId = l_previewSpeed_0, 
                    Items = v85:buildSpeedItems(), 
                    OnItemActivated = v85.selectSpeed, 
                    LayoutOrder = v102:getNextOrder(), 
                    Width = 75
                }), 
                SelectLabel = v2.createElement(l_TextLabel_0, {
                    Text = l_Localization_1:getText("AvatarSelection", "Character"), 
                    LayoutOrder = v102:getNextOrder(), 
                    AutomaticSize = Enum.AutomaticSize.XY
                }), 
                SelectInput = v2.createElement(l_SelectInput_0, {
                    PlaceholderText = l_Localization_1:getText("AvatarSelection", "ChooseAvatarPlaceholder"), 
                    SelectedIndex = l_currentIndex_0, 
                    Items = v85:buildItems(), 
                    OnItemActivated = v85.selectItem, 
                    LayoutOrder = v102:getNextOrder(), 
                    Width = 150
                })
            })
        })
    });
end;
return v3.connect(function(v104, _)
    return {
        animations = v104.AnimationConversion.animations, 
        previewSelection = v104.AnimationConversion.previewSelection, 
        previewSpeed = v104.AnimationConversion.previewSpeed, 
        characters = v104.CharacterConversion.characters, 
        convertedCharacters = v104.CharacterConversion.convertedCharacters, 
        characterMetadataLoadedVersion = v104.CharacterConversion.characterMetadataLoadedVersion, 
        worldModels = v104.CharacterConversion.worldModels
    };
end, function(v106)
    return {
        CreateWorldModels = function(v107, v108)
            v106(v18(v107, v108));
        end, 
        SetPreviewSpeed = function(v109)
            v106(v17(v109));
        end
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v24)));
