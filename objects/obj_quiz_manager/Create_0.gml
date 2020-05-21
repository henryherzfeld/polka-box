/// @description Insert description here
// You can write your code in this editor

questions = noone;

quizzer_id = noone;

question_idx = 0;
prog = 0;

initial = true;
question_change = false;

question_dialogue = noone;
no_match_response = false;
match_response = false;
response = false;

pending_choice = false;
choice = noone;
evi_choice = noone;
target = noone;
match = false;

submitted = false;

n_questions = 0;

enum enum_question_type {
	evidence,
	evidence_multi,
	evidence_checkbox,
	multi,
	checkbox,
}