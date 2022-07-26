# thanks -  https://clintbellanger.net/articles/isometric_tiles/
#           https://www.youtube.com/watch?v=vIKJ1AqfI0Q
#           https://www.youtube.com/watch?v=g81mqJhBZ7I (add weapon)

# to make sprite transparent film -> check transparent 
# move weapon into place (shift + mouse to pan, 7 top view, 0,0,0 position to make things a bit easy for aligning)
# add bone to weapon, (ADD > armature) move into place (if you cant see it, set pos to 0,0,0) select bone then object (CTRL + P) select object
# now select armature of weapon, click object constraints -> Add Object Constraint -> Child Of 
# :: Target -> to armature of character then add bone (the one closest to where the weapon should be held)

# 3d to 2.5d blender script

# add your model to render, with / without animation as a child to the RenderCollection.
# it will render everything the camera sees to limit create a bounding box for the sprite (ctrl+b)
# press 0 to see what the camera sees, then ctrl+b
# if you want a border round the sprite use the freestyle and freestyle line thickness
# disable antialiasing for good old fashioned 8/16-bit style

import bpy
from math import radians

directions = 1 # number of directions the character can move in
angle = (360 / directions) * -1 #-45
axis = 2 # z-axis

resolution_x = 640
resolution_y = 640

freestyle_line_thickness = 0.250
use_freestyle = True
simplify_gpencil_antialiasing = True

platform = bpy.data.collections["RenderPlatform"]

original_path = bpy.data.scenes[0].render.filepath

for i in range(0,directions):

    # rotate the render platform and all children
    temp_rot = platform.objects["Armature"].rotation_euler
    temp_rot[axis] = temp_rot[axis] - radians(angle)
    platform.objects["Armature"].rotation_euler = temp_rot;

    # set resolution and other bits
 
    bpy.context.scene.render.resolution_x = resolution_x
    bpy.context.scene.render.resolution_y = resolution_y
    
    bpy.context.scene.render.use_freestyle = use_freestyle
    bpy.context.scene.render.simplify_gpencil_antialiasing = simplify_gpencil_antialiasing

    bpy.context.scene.render.line_thickness = freestyle_line_thickness

     # set the filename direction prefix
    bpy.data.scenes[0].render.filepath = original_path + str(i)

    # render animation for this direction
    bpy.ops.render.render(animation=True, write_still=True)
    

  

bpy.data.scenes[0].render.filepath = original_path