# MMU Notes

## Purge volumes with CLEAN_NOZZLE

From Voron Discord #ercf_questions:

Dendrowen (mr. Blobifier) — 01/06/2024 11:57 AM
Yeah, I'm having problems with the retraction of filametrix, so I only retract 15mm which means around 40mm is still there. I have a purge command that purges 40mm + the flushing volumes

CLEAN_NOZZLE FINAL_RETRACT={retraction_length[0]} PURGE_LEN={40 + first_flush_volume + second_flush_volume} 

I use OrcaSlicer and have my flushing multiplier set to 0.40.



https://github.com/moggieuk/Happy-Hare/blob/variables/doc/gcode_preprocessing.md


https://github.com/moggieuk/Happy-Hare/blob/main/doc/slicer_setup.md#---start-g-code