/// @description Villy Weeraway

event_inherited();

text = ds_map_create(); 

if(game.find_weeraway){
	text[? "GREET"] = ["Hi", ["A1", "A1_1", "A1_2", "GREET"]]
	text[? "A1"] = ["Why aren’t you giving the villagers enough food?", "VILLY WEERAWAY: What can I do? The crops are dying!", ["A2", "A2_1", "A2_2", "GREET"]]
	text[? "A1_1"] = ["Who are you?", "VILLY WEERAWAY: Just a miserable farmer whose… *sniff*... reputation is in ruins. But you can call me Villy Weeraway.", ["A1", "A1_1", "A1_2", "GREET"]]
	text[? "A1_2"] = ["Why are you crying?", "VILLY WEERAWAY: I promised my kids that we’d be having Thanksgiving this year. They were so happy! But it seems like I’ll have to break that promise.", ["A1", "A1_1", "A1_2", "GREET"]]
	text[? "A2"] = ["Why are the crops dying?", "VILLY WEERAWAY: The crops don’t have what they need to live. I don’t know why! This will be the only year we haven’t celebrated Thanksgiving if this problem isn’t solved. My children might not even have enough to eat if we can’t grow food!", ["EXIT", "GREET"]]
	text[? "A2_1"] = ["How long have they been dying?", "VILLY WEERAWAY: I first noticed some of them dying a few weeks ago. The problem got worse. I tried to stop them from dying. Nothing I did worked.", ["A2", "A2_1", "A2_2", "GREET"]]
	text[? "A2_2"] = ["What kinds of crops do you grow?", "VILLY WEERAWAY: For 30 years, I’ve worked on this farm. Since I was little and I farmed with my father, I’ve always grown corn, potatoes, carrots, turnips, and other vegetables.", ["A2", "A2_1", "A2_2", "GREET"]]
	text[? "EXIT"] = ["Ok", []]
} else{
	text[? "GREET"] = ["Hi", "VILLY WEERAWAY: Go away!", ["EXIT", "GREET"]]
	text[? "EXIT"] = ["Hm, okay.", []]
}

name = "Villy Weeraway";
portrait = spr_portrait;

crying = true;