-- workspace setup
--[[

workspace [
    Noisai: module { ... }

    Character: folder [
        ns_level: number
        ns_path: folder [
            First: part { 
                ns_index: number
                ns_sfx: sound
                Sprite: decal/texture
            }

            Second: part { 
                ns_index: number
                ns_sfx: sound
                Sprite: decal/texture
            }

            Last: part { 
                 ns_index: number
                 ns_sfx: sound
                 Sprite: decal/texture
            }
        ]
    ]
]

]]


-- code example
--[[

local Noisai = require('workspace.Noisai');
local char = workspace.Character

Noisai.new(char);

]]


local Signal = require(script.Parent.Parent.Signal);


return (function(Noisai)
        
    function Noisai.new(Character)
        local self = setmetatable( {

            Character = Character,
            At = 1,

            --[[ data ]]
            Level = Character.ns_level.Value,
            Path = Character.ns_path,

            --[[ signals ]]
            Moving = Signal.new(),
            Stuck = Signal.new(),
            Active = Signal.new()
            
        }, Noisai )
            
        return self;
    end
        
end)