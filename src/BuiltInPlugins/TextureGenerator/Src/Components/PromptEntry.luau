local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local l_TextureGenerationService_0 = game:GetService("TextureGenerationService");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_ContextServices_0 = v3.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedMeshParts);
local _ = v3.Style.Stylizer;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_TextInput_0 = l_UI_0.TextInput;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v17 = require(l_Util_0.createHashFromMeshParts);
local v18 = require(l_Util_0.fetchAndSetQuotas);
local v19 = require(l_Util_0.GenerationsContext);
local v20 = require(l_Util_0.OptionsContext);
local v21 = require(l_Util_0.PreviewsContext);
local v22 = require(l_Util_0.createOptionsFromContext);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetry);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetryIncludeLocalId);
local function v26(v25)
    return v2.createElement(l_Pane_0, {
        Size = v25.Size, 
        LayoutOrder = v25.LayoutOrder
    }, {
        SendButton = v2.createElement(l_Button_0, {
            AnchorPoint = Vector2.new(1, 0.5), 
            OnClick = v25.OnClick, 
            Position = UDim2.fromScale(1, 0.5), 
            Size = UDim2.fromOffset(100, 30), 
            Style = "RoundPrimary", 
            StyleModifier = if v25.Enabled then nil else l_StyleModifier_0.Disabled, 
            Text = v25.PreviewButtonText
        }, {
            QuotaTooltip = v2.createElement(l_Tooltip_0, {
                Text = v25.QuotaTooltipText, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    });
end;
return function(v27)
    local v28 = l_Analytics_0:use();
    local v29 = l_Localization_0:use();
    local v30 = v8();
    local v31 = v29:getText("General", "Preview");
    local v32 = v2.useContext(v20);
    local v33 = v2.useRef(v32.promptText);
    local v34, v35 = v2.useState(function()
        return v33.current ~= "";
    end);
    local v36, v37 = v2.useState(false);
    local v39 = v2.useCallback(function(v38)
        v33.current = v38;
        v32.setPromptText(v38);
    end);
    local v40 = v2.useContext(v19);
    local v41 = v2.useContext(v21);
    v2.useEffect(function()
        local l_promptText_0 = v32.promptText;
        local v43 = v32.validRotation and v32.validSeed;
        local l_v35_0 = v35;
        local v45 = false;
        if l_promptText_0 ~= "" then
            v45 = not v36 and v43;
        end;
        l_v35_0(v45);
    end, {
        v32.promptText, 
        v36, 
        v32.validRotation, 
        v32.validSeed, 
        v41.quota > 0
    });
    local v46 = string.format(v29:getText("General", "QuotaTooltip"), v41.quota, v41.total, v41.total);
    local v57 = v2.useCallback(function()
        if v34 then
            v35(false);
            v37(true);
            local l_current_0 = v33.current;
            local v48 = v22(v32);
            local v49 = v17(v30);
            local v50, v51, v52 = v32.rotation:ToEulerAnglesYXZ();
            local v53 = Vector3.new(math.deg(v50), math.deg(v51), (math.deg(v52)));
            if not (not v23() or v24()) then
                v28:report("GeneratedPreview", v30, l_current_0, v32.seed, v53, v32.smartUVUnwrap, v32.promptMasking, nil);
            end;
            local l_status_0, l_result_0 = pcall(function()
                local l_l_TextureGenerationService_0_PartGroup_0 = l_TextureGenerationService_0:CreatePartGroup(v30);
                if not l_l_TextureGenerationService_0_PartGroup_0 then
                    return v29:getText("PromptEntry", "PartGroupError");
                else
                    return l_TextureGenerationService_0:PreviewTexture(l_l_TextureGenerationService_0_PartGroup_0, l_current_0, v48);
                end;
            end);
            v35(true);
            v37(false);
            if not l_status_0 or typeof(l_result_0) == "string" then
                v41.addError(v49, l_result_0, v29:getText("EntryArea", "ErrorAlertTitle"), l_result_0, "error");
                return ;
            else
                l_result_0.meshParts = v30;
                l_result_0.rotation = v53;
                l_result_0.smartUVUnwrap = v32.smartUVUnwrap;
                l_result_0.promptMasking = v32.promptMasking;
                v41.addOrUpdatePreview(l_result_0);
                v41.addOrUpdateModelToPreview({
                    hash = v49, 
                    uuid = l_result_0.uuid
                });
                if not (not v23() or not v24()) then
                    v28:report("GeneratedPreview", v30, l_current_0, v32.seed, v53, v32.smartUVUnwrap, v32.promptMasking, l_result_0.uuid);
                end;
                v18(v40, v41);
                return ;
            end;
        else
            return ;
        end;
    end, {
        v34, 
        v30, 
        v41.addOrUpdatePreview, 
        v41.addOrUpdateModelToPreview, 
        v32
    });
    return v2.createElement(l_Pane_0, {
        LayoutOrder = v27.LayoutOrder, 
        Padding = 10, 
        Size = UDim2.new(1, 0, 0, 140)
    }, {
        TextInput = v2.createElement(l_TextInput_0, {
            BottomComponent = v26, 
            BottomComponentProps = {
                Enabled = v34, 
                OnClick = v57, 
                PreviewButtonText = v31, 
                QuotaTooltipText = v46, 
                Size = UDim2.new(1, 0, 0, 32)
            }, 
            Disabled = v36, 
            MultiLine = true, 
            OnEnter = v57, 
            OnTextChanged = v39, 
            Text = v33.current, 
            Size = UDim2.new(1, 0, 0, 120), 
            PlaceholderText = v29:getText("PromptEntry", "PromptPlaceholder")
        })
    });
end;
