/proc/calc_average_color(atom/color_item)
	var/total_pixels = 0
	var/icon/color_icon = icon(color_item.icon,color_item.icon_state)
	var/pixel_h = 0
	var/pixel_s = 0
	var/pixel_v = 0
	var/my_x_pixel = 0
	var/my_y_pixel = 0
	var/list/HSV_list
	while(my_x_pixel <= 32)
		my_x_pixel++
		while(my_y_pixel <= 32)
			my_y_pixel++
			var/pixel = color_icon.GetPixel(my_x_pixel, my_y_pixel)
			var/list/HSV_list = rgb2num(pixel, COLORSPACE_HSV)
			total_pixels++
			pixel_h += HSV_list[1]
			pixel_s += HSV_list[2]
			pixel_v += HSV_list[3]
	var/total_h = pixel_h / total_pixels
	var/total_s = pixel_s / total_pixels
	var/total_v = pixel_v / total_pixels
	return rgb(total_h, total_s, total_v, COLORSPACE_HSV)


//actual hellcode. Not touching this again.
