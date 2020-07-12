draw_text_transformed(gdva(1350,0),gdva(30,1),"Score: " + string(round(global.currentScore)),gdva(3,0),gdva(3,1),0)
draw_text_transformed(gdva(1350,0),gdva(60,1),"Highscore: " + string(round(global.highscore)),gdva(3,0),gdva(3,1),0)

if (!surface_exists(surfPing)) surfPing = surface_create(guiW_*surfScale,guiH_*surfScale)
if (!surface_exists(surfPong)) surfPong = surface_create(guiW_*surfScale,guiH_*surfScale)

if (surfScale != PFsurfScale)
{
	surface_resize(surfPing,guiW_*surfScale,guiH_*surfScale)
	surface_resize(surfPong,guiW_*surfScale,guiH_*surfScale)
}

gpu_set_tex_filter(true)
//Luminance filter
shader_set(shBloomPass)
    shader_set_uniform_f(u_bloomThresholdTop,bloomThresholdTop)
    shader_set_uniform_f(u_bloomRange,bloomRange)

    surface_set_target(surfPing)
        draw_clear_alpha(0,0)
        draw_surface_stretched(application_surface,0,0,round(guiW_),round(guiH_))
    surface_reset_target()

//Blur
shader_set(shBlur)
    shader_set_uniform_f(u_blurSteps,blurSteps)
    shader_set_uniform_f(u_sigma,sigma)
    shader_set_uniform_f(u_texelSize,texelW/surfScale,texelH/surfScale)

    //Horizontal pass
    shader_set_uniform_f(u_blurVector,1,0)
    surface_set_target(surfPong)
        draw_clear_alpha(0,0)
        draw_surface(surfPing,0,0)
    surface_reset_target()

    //Vertical pass
    shader_set_uniform_f(u_blurVector,0,1)
    surface_set_target(surfPing)
        draw_surface(surfPong,0,0)
    surface_reset_target()
shader_reset()

//Add bloom
//draw_surface(application_surface,0,0)

gpu_set_blendmode(bm_add)
draw_surface_stretched(surfPing,0,0,guiW_,guiH_)
gpu_set_blendmode(bm_normal)
gpu_set_tex_filter(false)