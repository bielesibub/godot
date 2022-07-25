# thanks -  https://clintbellanger.net/articles/isometric_tiles/
#           https://www.youtube.com/watch?v=vIKJ1AqfI0Q


import bpy
from math import radians

angle = -45
axis = 2 # z-axis

resolution_x = 640
resolution_y = 640

freestyle_line_thickness = 0.250
use_freestyle = True
simplify_gpencil_antialiasing = True

platform = bpy.data.collections["RenderPlatform"]

original_path = bpy.data.scenes[0].render.filepath

for i in range(0,8):

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