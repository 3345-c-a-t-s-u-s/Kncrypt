local st,kl,tg,ka = loadstring,rawget,game.HttpGet,"https://raw.githubusercontent.com/3345-c-a-t-s-u-s/Kncrypt/refs/heads/main/sources/";
local Ua,ctx,dir = setmetatable({[994732206]="BloxFruit.lua",[2440500124]="Doors.lua",[4367208330]="Pressure.lua",[5750914919]="Fisch.lua",[2440500124]="Doors.lua"},{__newindex = function(self,a,d)print('failed!');end,__metatable="The metatable is locked"}),game.GameId,error;
if kl(Ua,ctx) then
     if not getgenv().fastfetch then
          return st(tg(game,ka..kl(Ua,ctx)))({auth=true,RunOnLoader=true,Version="0.1.1"});
     end;
     return kl(Ua,ctx);
else
    dir("Failed to Execute\nUnsupported");
end;
