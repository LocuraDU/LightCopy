---sof---
system.print("LightCopy Starting...")

local possibleLights = {copyTo_1, copyTo_2, copyTo_3, copyTo_4, copyTo_5, copyTo_6, copyTo_7, copyTo_8, copyTo_9}
LightsList = {}

for i = 1, 9, 1 do
  if possibleLights[i] then
    table.insert(LightsList, possibleLights[i])
    possibleLights[i].deactivate()
  end
end

copyFrom.activate()

for i = 1, #LightsList, 1 do
  system.print("... processing light #" .. i .. "...")
  local thisLight = LightsList[i]
  rgb_color = copyFrom.getColor()
  thisLight.setColor(rgb_color[1], rgb_color[2], rgb_color[3])
  thisLight.setBlinkingState(copyFrom.isBlinking())
  thisLight.setOnBlinkingDuration(copyFrom.getOnBlinkingDuration())
  thisLight.setOffBlinkingDuration(copyFrom.getOffBlinkingDuration())
  thisLight.setBlinkingTimeShift(copyFrom.getBlinkingTimeShift())

  thisLight.activate()
end

system.print("... *LightCopy Done!!")
unit.exit()
---eof---