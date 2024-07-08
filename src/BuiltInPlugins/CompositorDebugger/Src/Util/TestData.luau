local _ = require(script:FindFirstAncestor("CompositorDebugger").Src.Types);
local v1 = 0;
local v2;
do
    local l_v1_0 = v1;
    v2 = function()
        l_v1_0 = l_v1_0 + 1;
        return "ID" .. tostring(l_v1_0);
    end;
end;
v1 = {
    id = "{F9335871-7386-4AFA-B6B3-CF1A4FDB2BFE}", 
    name = "Mock Compositor 1", 
    children = {
        {
            children = {
                {
                    children = {
                        {
                            children = {}, 
                            className = "RestPose", 
                            name = "Debug B", 
                            id = "{20BFB42C-2D06-4E75-868D-0DA9AF1CBEB4}", 
                            linkData = {
                                position = 1
                            }, 
                            props = {}, 
                            weight = 0.5, 
                            watches = {
                                foo = "FOO", 
                                bar = "BAR"
                            }
                        }, 
                        {
                            children = {}, 
                            className = "ClipLayer", 
                            name = "Debug C", 
                            id = "{E577542C-2F20-4F2E-836B-0E5BC148CBE6}", 
                            linkData = {
                                position = 3
                            }, 
                            props = {
                                animationId = "rbxassetid://10921541949", 
                                isLooping = true, 
                                speed = 1
                            }, 
                            state = {
                                timePositionNormalized = 0, 
                                length = 5
                            }, 
                            weight = 0.3
                        }, 
                        {
                            children = {}, 
                            className = "ClipLayer", 
                            name = "Debug D", 
                            id = "{2321A81C-9EB4-4017-A496-87F0570B99F9}", 
                            linkData = {
                                position = 5
                            }, 
                            props = {
                                animationId = "rbxassetid://10899968825", 
                                isLooping = true, 
                                speed = 1
                            }, 
                            state = {
                                timePositionNormalized = 0.5, 
                                length = 4
                            }, 
                            watches = {
                                ["function"] = function()
                                end, 
                                table = {}
                            }
                        }
                    }, 
                    className = "Blend1D", 
                    name = "Debug A", 
                    id = "{275F34E0-57F4-4354-BC5A-38518EF2EB37}", 
                    props = {
                        targetPosition = 2, 
                        speed = 1
                    }, 
                    weight = 1
                }, 
                {
                    children = {
                        {
                            children = {}, 
                            className = "RestPose", 
                            name = "Debug G", 
                            id = "{FB02B42C-2D06-4E75-868D-0DA9AF1C4BEB}", 
                            linkData = {
                                position = Vector2.new(0, 0)
                            }, 
                            props = {}, 
                            weight = 0.5, 
                            watches = {
                                foo = "FOO", 
                                bar = "BAR"
                            }
                        }, 
                        {
                            children = {}, 
                            className = "ClipLayer", 
                            name = "Debug H", 
                            id = "{775E542C-2F20-4F2E-836B-0E5BC1486EBC}", 
                            linkData = {
                                position = Vector2.new(0, 2)
                            }, 
                            props = {
                                animationId = "rbxassetid://10921541949", 
                                isLooping = true, 
                                speed = 1
                            }, 
                            state = {
                                timePositionNormalized = 0, 
                                length = 5
                            }, 
                            weight = 0.3
                        }, 
                        {
                            children = {}, 
                            className = "ClipLayer", 
                            name = "Debug I", 
                            id = "{1231A81C-9EB4-4017-A496-87F0570B9F65}", 
                            linkData = {
                                position = Vector2.new(1, 1)
                            }, 
                            props = {
                                animationId = "rbxassetid://10899968825", 
                                isLooping = true, 
                                speed = 1
                            }, 
                            state = {
                                timePositionNormalized = 0.5, 
                                length = 4
                            }, 
                            watches = {
                                ["function"] = function()
                                end, 
                                table = {}
                            }
                        }
                    }, 
                    className = "Blend2D", 
                    name = "Debug F", 
                    id = "{F57234E0-57F4-4354-BC5A-38518EF273BE}", 
                    props = {
                        targetPosition = Vector2.new(0.5, 0.5), 
                        speed = 1
                    }, 
                    weight = 1
                }, 
                {
                    children = {}, 
                    className = "ClipLayer", 
                    name = "Debug E", 
                    id = "{B1A616DC-DBA5-4E75-ACFC-D073FBBF921F}", 
                    props = {
                        animationId = "rbxassetid://10921258489", 
                        isLooping = true, 
                        speed = 1
                    }, 
                    weight = 0
                }
            }, 
            className = "SelectLayer", 
            id = "{6F4A739B-8775-4B8E-9A89-1DBD43E9A4EF}", 
            props = {
                fadeInTimeSeconds = 0.2, 
                fadeOutTimeSeconds = 0.2, 
                selection = "Idle"
            }
        }
    }
};
return {
    mockPayload1 = v1, 
    mockPayload2 = {
        id = "{CF1A4FDB-7386-4AFA-B6B3-2BFEF9335871}", 
        name = "Mock Compositor 2", 
        children = {
            {
                children = {
                    {
                        children = {}, 
                        className = "ClipLayer", 
                        id = "{4017A81C-9EB4-4017-A496-87F0570B99F9}", 
                        name = "My Layer", 
                        props = {
                            animationId = "rbxassetid://10899968825", 
                            isLooping = true, 
                            speed = 1
                        }, 
                        state = {
                            length = 4, 
                            timePositionNormalized = 0.5
                        }, 
                        data = {
                            ["function"] = function()
                            end, 
                            table = {}
                        }
                    }
                }, 
                className = "ClipLayer", 
                name = "Debug F", 
                id = "{43E9A4EF-8775-4B8E-9A89-1DBD6F4A739B}", 
                props = {
                    animationId = "rbxassetid://10921258489", 
                    isLooping = true, 
                    speed = 1
                }
            }
        }
    }, 
    sortByIndex = {
        id = v2(), 
        name = "Sort by Index", 
        children = {
            {
                id = v2(), 
                name = "Third", 
                index = 3, 
                className = "ClipLayer", 
                children = {}
            }, 
            {
                id = v2(), 
                name = "First", 
                index = 1, 
                className = "ClipLayer", 
                children = {}
            }, 
            {
                id = v2(), 
                name = "Second", 
                index = 2, 
                className = "ClipLayer", 
                children = {}
            }
        }
    }, 
    sortByName = {
        id = v2(), 
        name = "Sort by Name", 
        children = {
            {
                id = v2(), 
                name = "[C] Third", 
                className = "ClipLayer", 
                children = {}
            }, 
            {
                id = v2(), 
                name = "[B] Second", 
                className = "ClipLayer", 
                children = {}
            }, 
            {
                id = v2(), 
                name = "[A] First", 
                className = "ClipLayer", 
                children = {}
            }
        }
    }, 
    sortByClassName = {
        id = v2(), 
        name = "Sort by Classname", 
        children = {
            {
                id = v2(), 
                className = "SequenceLayer", 
                children = {}
            }, 
            {
                id = v2(), 
                className = "Blend1D", 
                children = {}
            }, 
            {
                id = v2(), 
                className = "ClipLayer", 
                children = {}
            }
        }
    }, 
    sortById = {
        id = v2(), 
        name = "Sort by Id", 
        children = {
            {
                id = v2(), 
                className = "ClipLayer", 
                children = {}
            }, 
            {
                id = v2(), 
                className = "ClipLayer", 
                children = {}
            }, 
            {
                id = v2(), 
                className = "ClipLayer", 
                children = {}
            }
        }
    }, 
    clipLayerView = {
        ExpandedSections = {
            LayerDetails = true, 
            Properties = true, 
            State = false, 
            Watches = true
        }, 
        LayerData = v1.children[1].children[1].children[3]
    }, 
    blend1DLayerView = {
        ExpandedSections = {
            LayerDetails = true, 
            Properties = true
        }, 
        LayerData = v1.children[1].children[1]
    }, 
    blend1DLayerViewWrongType = {
        ExpandedSections = {
            LayerDetails = true, 
            Properties = true
        }, 
        LayerData = {
            children = {
                {
                    linkData = {
                        position = Vector2.new(1, 1)
                    }
                }, 
                {
                    linkData = {
                        position = Vector3.new(3, 0, 0)
                    }
                }, 
                {
                    linkData = {
                        position = {
                            X = 5
                        }
                    }
                }, 
                {
                    linkData = {
                        position = "FOO"
                    }
                }
            }, 
            className = "Blend1D", 
            name = "WrongTargets", 
            id = "{275F34E0-57F4-4534-A5CB-38518EF2EB37}", 
            props = {
                targetPosition = 2, 
                speed = 1
            }, 
            weight = 1
        }
    }, 
    blend2DLayerViewWrongType = {
        ExpandedSections = {
            LayerDetails = true, 
            Properties = true
        }, 
        LayerData = {
            children = {
                {
                    linkData = {
                        position = 1
                    }
                }, 
                {
                    linkData = {
                        position = Vector3.new(3, 2, 0)
                    }
                }, 
                {
                    linkData = {
                        position = {
                            X = 5, 
                            Y = 1
                        }
                    }
                }, 
                {
                    linkData = {
                        position = "FOO"
                    }
                }
            }, 
            className = "Blend2D", 
            name = "WrongTargets", 
            id = "{275F34E0-57F4-4534-A5CB-38518EF2EB37}", 
            props = {
                targetPosition = Vector2.new(0.5, 0.5), 
                speed = 1
            }, 
            weight = 1
        }
    }, 
    blend2DLayerView = {
        ExpandedSections = {
            LayerDetails = true, 
            Properties = true
        }, 
        LayerData = v1.children[1].children[2]
    }, 
    state = {
        timePositionNormalized = 0.5, 
        length = 4
    }
};
