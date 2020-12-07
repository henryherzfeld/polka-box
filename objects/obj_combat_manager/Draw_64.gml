/// @description Insert description here

draw_set_font(font_large);

if attack and polled_question {
	draw_text(xx, yy, curr_question[0] + " = ");
	draw_text(xx + string_width(curr_question[0]+ " = "), yy, curr_num);
	
}

//if draw draw_text_ext(50, 200, "Kill the Villies??? What!?\n Equip the pitchfork and use TAB key to attack. Type answers to the questions and press ENTER to submit them.", string_height("M"), game.gui_width/2);


draw_set_font(font_small);