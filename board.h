#ifndef __BOARD_H___
#define __BOARD_H___

#include "common.h"

extern ELEM FULL_MASK[6];
extern ELEM BIT_MASK[6];

// check some assumptions we made about the dimensions
void assert_dims ();

void init_board (BOARD b);
void init_board_set (BOARD_SET S);

void copy_board (BOARD to, BOARD from);
void copy_board_set (BOARD_SET to, BOARD_SET from);

inline int get_square (BOARD b, int row, int col) {
	return b[row] & (1 << col);
}
inline int get_square_set (BOARD_SET S, int row, int col) {
	if (get_square (S[0],row,col))
		return 1;
	if (get_square (S[1],row,col))
		return 1;
	return 0;
}
inline void set_square (BOARD b, int row, int col) {
	b[row] |= (1 << col);
}
inline void unset_square (BOARD b, int row, int col) {
	b[row] &= ~(1 << col);
}

int count_horiz (BOARD_SET S, int p, int n);
int count_vert (BOARD_SET S, int p, int n);
int count_ne (BOARD_SET S, int p, int n);
int count_se (BOARD_SET S, int p, int n);

int check_board_full (BOARD_SET S);
int check_board_win (BOARD_SET S, PLAYER player);

#endif