wall_col = true
if(abs(y - other.y) < (x - other.x))
{
	if(other.y < y){
		y = other.y + (other.image_yscale * other.sprite_height) + (other.sprite_width * other.image_xscale)
	} else {
		y = (other.y - (other.sprite_width * other.image_xscale)) - (image_yscale * sprite_height)
	}
} else {

	if(other.x < x){
		x = (other.x + (other.sprite_width * other.image_xscale) + 32) + sprite_width
	} else {
		x = (other.x - (other.sprite_width * other.image_xscale) - 32) -sprite_width
	}
}