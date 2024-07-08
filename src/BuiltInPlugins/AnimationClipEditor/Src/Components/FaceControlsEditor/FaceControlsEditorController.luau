local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Button_0 = v3.UI.Button;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Components.FaceControlsEditor.FaceControlsEditorWindow);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.ToggleFaceControlsEditorEnabled);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.ToggleShowFaceControlsEditorPanel);
local v11 = require(l_script_FirstAncestor_0.Src.Actions.SetFaceControlsEditorEnabled);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetShowFaceControlsEditorPanel);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedTracks);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.SetSelectedTracks);
local v15 = require(l_script_FirstAncestor_0.Src.Components.TeachingCallout);
local v16 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v17 = v1.PureComponent:extend("FaceControlsEditorController");
local l_GetTextSize_0 = v3.Util.GetTextSize;
v17.init = function(v19)
    v19.state = {
        showMenu = false, 
        showFaceControlsEditorPanel = false
    };
    v19.showMenu = function()
        v19:setState({
            showMenu = true
        });
    end;
    v19.hideMenu = function()
        v19:setState({
            showMenu = false
        });
    end;
    v19.setShowFaceControlsEditorPanel = function(v20)
        v19:setState({
            showFaceControlsEditorPanel = v20
        });
    end;
    v19.getLastSelectedTrack = function()
        if not v19.props.SelectedTracks then
            return ;
        else
            return v19.props.SelectedTracks[#v19.props.SelectedTracks];
        end;
    end;
    v19.toggleFaceControlsEditorEnabledHandler = function()
        return v19.props.ToggleFaceControlsEditorEnabled(v19.props.Analytics);
    end;
end;
v17.didUpdate = function(v21)
    local l_props_0 = v21.props;
    if l_props_0.ShowFaceControlsEditorPanel ~= v21.state.showFaceControlsEditorPanel then
        if l_props_0.ShowFaceControlsEditorPanel ~= nil then
            spawn(function()
                v21.setShowFaceControlsEditorPanel(l_props_0.ShowFaceControlsEditorPanel);
            end);
            return ;
        else
            v21.setShowFaceControlsEditorPanel(l_props_0.ShowFaceControlsEditorPanel);
        end;
    end;
end;
v17.render = function(v23)
    local l_Localization_0 = v23.props.Localization;
    local l_props_1 = v23.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v27 = v23.getLastSelectedTrack();
    local l_button_0 = l_Stylizer_0.button;
    local l_state_0 = v23.state;
    return v23.props.RootInstance and v1.createElement("Frame", {
        Position = l_props_1.Position, 
        Size = UDim2.new(0, l_GetTextSize_0(l_Localization_0:getText("Title", "FACE"), l_Stylizer_0.ikTheme.textSize, l_Stylizer_0.font, Vector2.new(1000, 1000)).X + 10, 0, 18), 
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 0.5), 
        LayoutOrder = 2
    }, {
        FaceControlsEditorButton = (l_props_1.RootInstance and v7.canUseFaceControlsEditor(l_props_1.RootInstance)) and v1.createElement(l_Button_0, {
            Style = not not l_state_0.showFaceControlsEditorPanel and l_button_0.FaceControlsEditorActive or l_button_0.FaceControlsEditorDefault, 
            Size = UDim2.new(1, 0, 1, 0), 
            OnClick = l_props_1.ToggleShowFaceControlsEditorPanel
        }, {
            Label = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = l_Stylizer_0.ikTheme.textSize, 
                Text = l_Localization_0:getText("Title", "FACE"), 
                Font = l_Stylizer_0.font, 
                TextColor3 = l_Stylizer_0.ikTheme.textColor
            }, {
                TeachingCallout = v1.createElement(v15, {
                    Offset = Vector2.new(0, 6), 
                    DefinitionId = "FaceControlsEditorCallout", 
                    LocationId = "FaceControlsEditorButton"
                })
            })
        }), 
        FaceControlsEditorWindow = (l_props_1.ShowFaceControlsEditorPanel and l_state_0.showFaceControlsEditorPanel) and v1.createElement(v8, {
            RootInstance = l_props_1.RootInstance, 
            FaceControlsEditorEnabled = l_props_1.FaceControlsEditorEnabled, 
            ShowFaceControlsEditorPanel = l_props_1.ShowFaceControlsEditorPanel, 
            SelectedTrack = v27, 
            SetSelectedTracks = l_props_1.SetSelectedTracks, 
            ToggleFaceControlsEditorEnabled = v23.toggleFaceControlsEditorEnabledHandler, 
            SetShowFaceControlsEditorPanel = l_props_1.SetShowFaceControlsEditorPanel, 
            SetFaceControlsEditorEnabled = l_props_1.SetFaceControlsEditorEnabled
        })
    });
end;
return v2.connect(function(v30, _)
    return {
        ShowFaceControlsEditorPanel = v30.Status.ShowFaceControlsEditorPanel, 
        FaceControlsEditorEnabled = v30.Status.FaceControlsEditorEnabled, 
        RootInstance = v30.Status.RootInstance, 
        SelectedTracks = v30.Status.SelectedTracks
    };
end, function(v32)
    return {
        ToggleShowFaceControlsEditorPanel = function()
            v32(v10());
        end, 
        SetFaceControlsEditorEnabled = function(v33)
            v32(v11(v33));
        end, 
        ToggleFaceControlsEditorEnabled = function(v34)
            v32(v9(v34));
        end, 
        SetShowFaceControlsEditorPanel = function(v35)
            v32(v12(v35));
        end, 
        SetSelectedTracks = function(v36)
            if not v16() then
                v32(v13(v36));
                return ;
            else
                v32(v14(v36));
                return ;
            end;
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Analytics = l_ContextServices_0.Analytics
})(v17)));
