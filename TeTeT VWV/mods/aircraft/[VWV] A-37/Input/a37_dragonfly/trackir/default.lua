function layout()
return {
axisCommands = {
{combos = {{key = 'TRACKIR_PITCH'}}, action = iCommandViewVerticalAbs, name = 'Absolute Camera Vertical View'},
{combos = {{key = 'TRACKIR_YAW'}}, action = iCommandViewHorizontalAbs, name = 'Absolute Camera Horizontal View'},
{combos = {{key = 'TRACKIR_X'}}, action = iCommandViewHorTransAbs, name = 'Absolute Horizontal Shift Camera View'},
{combos = {{key = 'TRACKIR_Y'}}, action = iCommandViewVertTransAbs, name = 'Absolute Vertical Shift Camera View'},
{combos = {{key = 'TRACKIR_Z'}}, action = iCommandViewLongitudeTransAbs, name = 'Absolute Longitude Shift Camera View'},
{combos = {{key = 'TRACKIR_ROLL'}}, action = iCommandViewRollAbs, name = 'Absolute Roll Shift Camera View'},
{combos = nil, action = iCommandViewZoomAbs, name = 'Zoom View'},
},
}
end
