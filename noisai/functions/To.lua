local Values = require(workspace.Values)

return (function(Noisai)
        
    function Noisai:To(to=nil)
        local noiseMax = Values:Get("placeholder");

        local rand = math.random(1, 20);
        local chance = rand - ( noiseMax/10 )
        local move = chance <= level;

        if not to then to = self.At + 1 end;

        if move then
        
                local cur = self:Cur();
                local next = self:Get(to);
                    
                cur.__sprite.Transparency = 1
                next.__sprite.Transparency = 0
        
                next:PlaySFX();
                    
                self.At = to
                self.Moving:Fire(self.At, to);
        else
                self.Stuck:Fire(self.At, to);
        end
    end
    
        
end)