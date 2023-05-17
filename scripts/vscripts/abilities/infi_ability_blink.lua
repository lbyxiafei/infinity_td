infi_ability_blink  = class({})

function infi_ability_blink:OnSpellStart()
  local caster = self:GetCaster()
  local point = self:GetCursorPosition()
  FindClearSpaceForUnit(caster, point, true)
end