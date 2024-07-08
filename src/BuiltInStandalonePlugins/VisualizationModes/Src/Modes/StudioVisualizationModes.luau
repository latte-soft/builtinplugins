local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Modes.SettingVisualizationMode);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugStudioShowBrokenVisualizationModes);
local l_ContextServices_0 = v1.ContextServices;
return function()
    local v6 = settings();
    local v7 = l_ContextServices_0.Localization:use();
    return v2.createElement(v2.Fragment, {}, {
        GUI = v2.createElement("VisualizationModeCategory", {
            Title = v7:getText("VisualizationModeCategories", "GUI")
        }, {
            DeviceEmulation = v4() and v2.createElement(v3, {
                Title = v7:getText("StudioModes", "DeviceEmulation"), 
                ToolTip = v7:getText("StudioModes", "DeviceEmulationToolTip")
            }), 
            GUIOverlay = v2.createElement(v3, {
                Title = v7:getText("StudioModes", "GUIOverlay"), 
                ToolTip = v7:getText("StudioModes", "GUIOverlayToolTip"), 
                Setting = game.StarterGui, 
                Property = "ShowDevelopmentGui"
            }), 
            GUIGuides = v4() and v2.createElement(v3, {
                Title = v7:getText("StudioModes", "GUIGuides"), 
                ToolTip = v7:getText("StudioModes", "GUIGuidesToolTip")
            })
        }), 
        PhysicsGeometry = v2.createElement("VisualizationModeCategory", {
            Title = v7:getText("VisualizationModeCategories", "PhysicsGeometry")
        }, {
            AssemblyLabels = v2.createElement(v3, {
                Title = v7:getText("StudioModes", "AssemblyLabels"), 
                ToolTip = v7:getText("StudioModes", "AssemblyLabelsToolTip"), 
                Setting = v6.Physics, 
                Property = "AreAssembliesShown"
            }), 
            DecompositionGeometry = v2.createElement(v3, {
                Title = v7:getText("StudioModes", "DecompositionGeometry"), 
                ToolTip = v7:getText("StudioModes", "DecompositionGeometryToolTip"), 
                Setting = v6.Physics, 
                Property = "ShowDecompositionGeometry"
            }), 
            MechanismLabels = v2.createElement(v3, {
                Title = v7:getText("StudioModes", "MechanismLabels"), 
                ToolTip = v7:getText("StudioModes", "MechanismLabelsToolTip"), 
                Setting = v6.Physics, 
                Property = "AreMechanismsShown"
            }), 
            UnanchoredPartLabels = v2.createElement(v3, {
                Title = v7:getText("StudioModes", "UnanchoredPartLabels"), 
                ToolTip = v7:getText("StudioModes", "UnanchoredPartLabelsToolTip"), 
                Setting = v6.Physics, 
                Property = "AreAnchorsShown"
            })
        }), 
        Lighting = v2.createElement("VisualizationModeCategory", {
            Title = v7:getText("VisualizationModeCategories", "Lighting")
        }, {
            LightGuides = v2.createElement(v3, {
                Title = v7:getText("StudioModes", "LightGuides"), 
                ToolTip = v7:getText("StudioModes", "LightGuidesToolTip"), 
                Setting = v6.Studio, 
                Property = "Show Light Guides"
            })
        }), 
        Navigation = v2.createElement("VisualizationModeCategory", {
            Title = v7:getText("VisualizationModeCategories", "Navigation")
        }, {
            NavigationMesh = v2.createElement(v3, {
                Title = v7:getText("StudioModes", "NavigationMesh"), 
                ToolTip = v7:getText("StudioModes", "NavigationMeshToolTip"), 
                Setting = v6.Studio, 
                Property = "Show Navigation Mesh"
            }), 
            NavigationLabels = v2.createElement(v3, {
                Title = v7:getText("StudioModes", "NavigationLabels"), 
                ToolTip = v7:getText("StudioModes", "NavigationLabelsToolTip"), 
                Setting = v6.Studio, 
                Property = "Show Navigation Labels"
            }), 
            PathfindingLinks = v2.createElement(v3, {
                Title = v7:getText("StudioModes", "PathfindingLinks"), 
                ToolTip = v7:getText("StudioModes", "PathfindingLinksToolTip"), 
                Setting = v6.Studio, 
                Property = "Show Pathfinding Links"
            })
        }), 
        PhysicsConstraints = v2.createElement("VisualizationModeCategory", {
            Title = v7:getText("VisualizationModeCategories", "PhysicsConstraints")
        }, {
            Constraints = v4() and v2.createElement(v3, {
                Title = v7:getText("StudioModes", "Constraints"), 
                ToolTip = v7:getText("StudioModes", "ConstraintsToolTip")
            }), 
            ConstraintsOnTop = v4() and v2.createElement(v3, {
                Title = v7:getText("StudioModes", "ConstraintsOnTop"), 
                ToolTip = v7:getText("StudioModes", "ConstraintsOnTopToolTip")
            }), 
            ContactPoints = v4() and v2.createElement(v3, {
                Title = v7:getText("StudioModes", "ContactPoints"), 
                ToolTip = v7:getText("StudioModes", "ContactPointsToolTip")
            })
        }), 
        PhysicsSimulation = v2.createElement("VisualizationModeCategory", {
            Title = v7:getText("VisualizationModeCategories", "PhysicsSimulation")
        }, {
            AwakeParts = v2.createElement(v3, {
                Title = v7:getText("StudioModes", "HighlightAwakeParts"), 
                ToolTip = v7:getText("StudioModes", "HighlightAwakePartsToolTip"), 
                Setting = v6.Physics, 
                Property = "AreAwakePartsHighlighted"
            }), 
            NetworkOwner = v2.createElement(v3, {
                Title = v7:getText("StudioModes", "NetworkOwner"), 
                ToolTip = v7:getText("StudioModes", "NetworkOwnerToolTip"), 
                Setting = v6.Physics, 
                Property = "AreOwnersShown"
            }), 
            WindDirection = v4() and v2.createElement(v3, {
                Title = v7:getText("StudioModes", "WindDirection"), 
                ToolTip = v7:getText("StudioModes", "WindDirectionToolTip")
            })
        }), 
        View = v2.createElement("VisualizationModeCategory", {
            Title = v7:getText("VisualizationModeCategories", "View")
        }, {
            ViewSelector = v4() and v2.createElement(v3, {
                Title = v7:getText("StudioModes", "ViewSelector"), 
                ToolTip = v7:getText("StudioModes", "ViewSelectorToolTip")
            }), 
            CollaboratorHighlights = v4() and v2.createElement(v3, {
                Title = v7:getText("StudioModes", "CollaboratorHighlights"), 
                ToolTip = v7:getText("StudioModes", "CollaboratorHighlightsToolTip")
            })
        })
    });
end;
