#include "board.h"
#ifdef MICROBLAZE
	#include "xil_assert.h"
#else
	#include "assert.h"
#endif

ELEM get_square (BOARD b, int row, int col) {
    return b[row*BOARD_COLS + col];

}
void set_square (BOARD b, int row, int col, ELEM val) {
    b[row*BOARD_COLS + col] = val;
}

void assert_dims () {
	#ifdef MICROBLAZE
		Xil_AssertVoid(BOARD_ROWS == BOARD_COLS);
		Xil_AssertVoid(BOARD_ROWS*BOARD_COLS == BOARD_ELEMS);
	#else
    	assert (BOARD_ROWS == BOARD_COLS);
    	assert (BOARD_ROWS*BOARD_COLS == BOARD_ELEMS);
	#endif
}

void init_board (BOARD b) {
	int i;
	for (i = 0; i < BOARD_ELEMS; ++i)
		b[i] = STONE_NONE;
}

void copy_board (BOARD to, BOARD from) {
	int i;
	for (i = 0; i < BOARD_ELEMS; ++i)
		to[i] = from[i];
}

int check_board_full (BOARD b) {
	int i;
    for (i = 0; i < BOARD_ELEMS; ++i)
		if (b[i] != STONE_NONE)
			return 0;
	return 1;
}
    
void zero_counts (COUNTS* C) {
	C->p2[0] = C->p2[1] = C->p3[0] = C->p3[1] = 0;
	C->p4[0] = C->p4[1] = C->p5[0] = C->p5[1] = 0;
}
void add_counts (COUNTS* C1, COUNTS* C2) {
	C1->p2[0] += C2->p2[0]; C1->p3[0] += C2->p3[0]; 
	C1->p4[0] += C2->p4[0]; C1->p5[0] += C2->p5[0];	
	C1->p2[1] += C2->p2[1]; C1->p3[1] += C2->p3[1]; 
	C1->p4[1] += C2->p4[1]; C1->p5[1] += C2->p5[1];	
}

// traverse the board using a horizontal window of 5 squares.
// count the number of occurances of exactly n stones in the window,
// with no opposing stones in the same window
COUNTS count_horiz (ELEM b[BOARD_ELEMS]) {
	COUNTS result;
	zero_counts (&result);
	
	int row, col;
	int m;
	
	for (row = 0; row < BOARD_ROWS; ++row) {
		for (col = 0; col < BOARD_COLS-4; ++col) {
			int p1_count = 0;
			int p2_count = 0;

			for (m = 0; m < 5; ++m) {
				ELEM elem = get_square(b, row, col+m);
				p1_count += (elem == STONE_P1);
				p2_count += (elem == STONE_P2);
			}

			if (p2_count == 0) {
				result.p5[0] += (p1_count == 5);
				result.p4[0] += (p1_count == 4);
				result.p3[0] += (p1_count == 3);
				result.p2[0] += (p1_count == 2);
			}
			if (p1_count == 0) {
				result.p5[1] += (p2_count == 5);
				result.p4[1] += (p2_count == 4);
				result.p3[1] += (p2_count == 3);
				result.p2[1] += (p2_count == 2);
			}
		}
	}
	return result;
}

COUNTS count_vert (ELEM b[BOARD_ELEMS]) {
	COUNTS result;
	zero_counts (&result);
	
	int row, col;
	int m;

	for (col = 0; col < BOARD_COLS; ++col) {
		for (row = 0; row < BOARD_ROWS-4; ++row) {
			int p1_count = 0;
			int p2_count = 0;

			for (m = 0; m < 5; ++m) {
				ELEM elem = get_square(b, row+m, col);
				p1_count += (elem == STONE_P1);
				p2_count += (elem == STONE_P2);
			}

			if (p2_count == 0) {
				result.p5[0] += (p1_count == 5);
				result.p4[0] += (p1_count == 4);
				result.p3[0] += (p1_count == 3);
				result.p2[0] += (p1_count == 2);
			}
			if (p1_count == 0) {
				result.p5[1] += (p2_count == 5);
				result.p4[1] += (p2_count == 4);
				result.p3[1] += (p2_count == 3);
				result.p2[1] += (p2_count == 2);
			}
		}
	}
	return result;
}
COUNTS count_ne (ELEM b[BOARD_ELEMS]) {
	COUNTS result;
	zero_counts (&result);
	
	int row, col;
	int m;
	
	for (row = 4; row < BOARD_ROWS; ++row) {
		for (col = 0; col < BOARD_COLS-4; ++col) {
			int p1_count = 0;
			int p2_count = 0;

			for (m = 0; m < 5; ++m) {
				ELEM elem = get_square(b, row-m, col+m);
				p1_count += (elem == STONE_P1);
				p2_count += (elem == STONE_P2);
			}

			if (p2_count == 0) {
				result.p5[0] += (p1_count == 5);
				result.p4[0] += (p1_count == 4);
				result.p3[0] += (p1_count == 3);
				result.p2[0] += (p1_count == 2);
			}
			if (p1_count == 0) {
				result.p5[1] += (p2_count == 5);
				result.p4[1] += (p2_count == 4);
				result.p3[1] += (p2_count == 3);
				result.p2[1] += (p2_count == 2);
			}
		}
	}
	return result;
}
COUNTS count_se (ELEM b[BOARD_ELEMS]) {
	COUNTS result;
	zero_counts (&result);

	int row, col;
	int m;
	

	for (row = 0; row < BOARD_ROWS-4; ++row) {
		for (col = 0; col < BOARD_COLS-4; ++col) {
			int p1_count = 0;
			int p2_count = 0;

			for (m = 0; m < 5; ++m) {
				ELEM elem = get_square(b, row+m, col+m);
				p1_count += (elem == STONE_P1);
				p2_count += (elem == STONE_P2);
			}

			if (p2_count == 0) {
				result.p5[0] += (p1_count == 5);
				result.p4[0] += (p1_count == 4);
				result.p3[0] += (p1_count == 3);
				result.p2[0] += (p1_count == 2);
			}
			if (p1_count == 0) {
				result.p5[1] += (p2_count == 5);
				result.p4[1] += (p2_count == 4);
				result.p3[1] += (p2_count == 3);
				result.p2[1] += (p2_count == 2);
			}
		}
	}
	return result;
}
#ifdef MICROBLAZE
int initialize_accelerator(XGenerate_board_counts * accel, unsigned int accelerator_base_address){
	XGenerate_board_counts_Config AcceleratorConfig;
    AcceleratorConfig.Ctrl_BaseAddress = accelerator_base_address;
    int Status = XGenerate_board_counts_Initialize(accel, &AcceleratorConfig);

    return Status;
}

void hardened_generate_board_counts (ELEM b[BOARD_ELEMS], COUNTS * results){

	u32 * temp_board = (u32 *)( (void*) XPAR_MCB_DDR2_S0_AXI_BASEADDR + BOARD_OFFSET );
	COUNTS * accel_results = (COUNTS *)( (void*) XPAR_MCB_DDR2_S0_AXI_BASEADDR + RESULT_OFFSET);
	int i,j;
	for (i = 0; i < 8 ; i++){
		u32 temp = 0;
		for (j=0; j<16; j++){
			temp = temp | ((b[i*16 + j] & 3) << (j*2));
		}
		temp_board[i] = temp;
	}

	//set up accelerator
	XGenerate_board_counts_SetResult_addr(&board_count_accelerator, (u32) accel_results);
	XGenerate_board_counts_SetBoard_addr(&board_count_accelerator,  (u32) temp_board);
	XGenerate_board_counts_Start(&board_count_accelerator);
	while (!XGenerate_board_counts_IsDone(&board_count_accelerator));
	results->p2[0] = accel_results->p2[0];
	results->p2[1] = accel_results->p2[1];
	results->p3[0] = accel_results->p3[0];
	results->p3[1] = accel_results->p3[1];
	results->p4[0] = accel_results->p4[0];
	results->p4[1] = accel_results->p4[1];
	results->p5[0] = accel_results->p5[0];
	results->p5[1] = accel_results->p5[1];
}

#endif

void generate_board_counts (ELEM b[BOARD_ELEMS], COUNTS * result){

	zero_counts (result);
	
	COUNTS h = count_horiz (b);
	add_counts (result, &h);
	COUNTS v = count_vert (b);
	add_counts (result, &v);
	COUNTS ne = count_ne (b);
	add_counts (result, &ne);
	COUNTS se = count_se (b);
	add_counts (result, &se);
}

int check_board_win (BOARD b, PLAYER P) {
	COUNTS result;

#ifdef MICROBLAZE
	hardened_generate_board_counts(b, &result);
#else
	generate_board_counts(b, &result);
#endif
	if (result.p5[(int)P.num] > 0)
	    return 1;
	return 0;
}
