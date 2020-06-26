////@description scr_dia_line_script
///@arg0 script
///@arg arg1...

var temp = ["SCRIPT", argument0];

if argument_count > 1 {

	var i = 0; repeat(argument_count-1){
		temp[i+2] = argument[i+1];
		i++;
	}
}

scr_dia_string_mods(temp);
