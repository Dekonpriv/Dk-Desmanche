local gate = createObject(980, 1535.329, -1451.502, 15, 0, 0, 0) 
local marker = createMarker(1534.948, -1451.238, 13.385, "cylinder", 5, 0, 0, 0, 0) 
  
function moveGate(thePlayer) 
     if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(thePlayer)) , aclGetGroup("DESMANCHE")) then 
          moveObject(gate, 3000, 1535.329, -1451.502, 9) 
     end 
end 
addEventHandler("onMarkerHit", marker, moveGate) 
  
function move_back_gate() 
     moveObject(gate, 3000, 1535.329, -1451.502, 15) 
end 
addEventHandler("onMarkerLeave", marker, move_back_gate) 
