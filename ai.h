#ifndef __AI_H___
#define __AI_H___

#include "common.h"
#include <stdio.h>

AI_PLAYER default_ai ();

int board_position_weight (BOARD b, PLAYER P, PLAYER O);
int board_count_score (AI_PLAYER ai, BOARD b, PLAYER P, PLAYER O);

int get_move_ai1 (AI_PLAYER ai, BOARD b, PLAYER P, PLAYER O, COORD* move);
int get_move_ai2 (AI_PLAYER ai, BOARD b, PLAYER P, PLAYER O, COORD* move);

void print_ai (FILE* fp, AI_PLAYER ai);
#endif
