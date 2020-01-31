 /// @description Villy Weeraway

event_inherited();
 
text = ds_map_create(); 

if(flags.find_weeraway){
	text[? "GREET"] = ["Hi", ["A1", "A1_1", "A1_2", "GREET"], [polka]]
	text[? "A1"] = ["Why aren't you giving the villagers enough food?", "What can I do? The crops are dying!", ["A2", "A2_1", "A2_2", "GREET"], [polka, id]]
	text[? "A1_1"] = ["Who are you?", "Just a miserable farmer whose… *sniff*... reputation is in ruins. But you can call me Villy Weeraway.", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]
	text[? "A1_2"] = ["Why are you crying?", "I promised my kids that we'd be having Thanksgiving this year. They were so happy! But it seems like I'll have to break that promise.", ["A1", "A1_1", "A1_2", "GREET"], [polka, id]]
	text[? "A2"] = ["Why are the crops dying?", "The crops don't have what they need to live. I don't know why! This will be the only year we haven't celebrated Thanksgiving if this problem isn't solved. My children might not even have enough to eat if we can't grow food!", ["A3", "A3_1", "A3_2", "GREET"], [polka, id]]
	text[? "A2_1"] = ["How long have they been dying?", "I first noticed some of them dying a few weeks ago. The problem got worse. I tried to stop them from dying. Nothing I did worked.", ["A2", "A2_1", "A2_2", "GREET"], [polka, id]]
	text[? "A2_2"] = ["What kinds of crops do you grow?", "For 30 years, I've worked on this farm. Since I was little and I farmed with my father, I've always grown corn, potatoes, carrots, turnips, and other vegetables.", ["A2", "A2_1", "A2_2", "GREET"], [polka, id]]
	text[? "A3"] = ["What do plants need in order to live?", "I would ask someone who knows all about plants. I do not know what else to do...You have to help me!", ["EXIT", "GREET"], [polka, id]]
	text[? "A3_1"] = ["Where are your crops?", "In the fields beside the house.", ["A3", "A3_1", "A3_2", "GREET"], [polka, id]] 
	text[? "A3_2"] = ["What are you giving your crops?", "Water and fresh soil. And a bucket of love and prayers. But those don't seem to be working...", ["A3", "A3_1", "A3_2", "GREET"], [polka, id]] 
	
	text[? "EXIT"] = ["Ok", [], [polka]]
	
	scripts = [
	[scr_change_variable, flags.id, "find_poppy", true],                                
	[scr_change_variable, flags.id, "find_weeraway", false]
]

} else{
	text[? "GREET"] = ["Hi", "Leave me alone, please!", ["EXIT", "GREET"], [polka, id]]
	text[? "EXIT"] = ["Hm, okay.", [], [polka]]
}

name = "Villy Weeraway";
portrait = spr_portrait;

crying = true;