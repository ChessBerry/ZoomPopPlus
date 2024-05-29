do
   local oldToggleZoomPop = ToggleZoomPop
   function ToggleZoomPop(arguments)
      ---- preserve original behavior or another mod's changes
      --oldToggleZoomPop(arguments)

      local cam = GetCamera('WorldCamera')
      --local zoomRatio = (cam:GetTargetZoom() / cam:GetMaxZoom()) -- 0.5 is a good level for 'zoomed most of the way out'
      --reprsl(cam:GetTargetZoom())
      --reprsl(cam:GetMaxZoom())

      --local current_zoom = cam:GetTargetZoom()
      --local max_possible_zoom = cam:GetMaxZoom()

      local zoom_pop_distance_min = import("/lua/user/prefs.lua").GetFromCurrentProfile('options').gui_zoom_pop_distance
      if zoom_pop_distance_min == nil then
         zoom_pop_distance_min = 80
      end

      --local zoom_pop_distance_max = max_possible_zoom
      --if zoom_pop_distance_max == nil then
      --   zoom_pop_distance_max = max_possible_zoom
      --end

      local zoom_pop_distance_target
      --reprsl(current_zoom)
      --reprsl(zoom_pop_distance_min)
      --reprsl(zoom_pop_distance_max)
      --if current_zoom > zoom_pop_distance_min - 1 then
      --   -- if zoomed out, pop in
      --   reprsl("pop in")
      --   zoom_pop_distance_target = zoom_pop_distance_min
      --else
      --   -- if zoomed in, pop out
      --   reprsl("pop out")
      --   zoom_pop_distance_target = zoom_pop_distance_max
      --end
      zoom_pop_distance_target = zoom_pop_distance_min

      local hpr = Vector(3.14159, (1 - 20 / 90) * 1.5708, 0) -- I don't know the actual formula for the camera orientation but this is close
      cam:SnapTo(GetMouseWorldPos(), hpr, zoom_pop_distance_target)
      cam:RevertRotation() -- Revert to basic rotation scheme after popping in. Will move the camera unless the camera tilt is already correct
   end
end
