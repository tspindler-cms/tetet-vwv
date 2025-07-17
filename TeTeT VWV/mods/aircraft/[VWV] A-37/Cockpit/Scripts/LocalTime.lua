-- "DeltaLocalTime" is added to the current mission time and
-- is used by all electronic indicators/systems and by the cockpit clock.
--
-- It is in minutes (+/-) relative to the mission time.
-- For example "DeltaLocalTime = -240.0" equals to the current 
-- mission time minus 4 hours.
-- This value will affect all missions and will not be recorded
-- into a track file. To play a track with different local time
-- (recorded with different DeltaLocalTime value setting) this value
-- have to be adjusted before accordingly.

DeltaLocalTime = 0.0
