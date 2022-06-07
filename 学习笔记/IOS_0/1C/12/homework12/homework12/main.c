//
//  main.c
//  homework12
//
//  Created by db on 2021/12/24.
//

#include <stdio.h>
#include <stdlib.h>
#define ROWS 10
#define LISTS 10

char map[ROWS][LISTS] = {
    {'#','#','#','#','#','#','#','#','#','#'},
    {'#',' ',' ','#','#','#','#',' ',' ','#'},
    {'#',' ','X','#','#','#','#',' ',' ','#'},
    {'#',' ','0',' ',' ',' ',' ',' ',' ','#'},
    {'#','#','#','#','#','#',' ',' ',' ','#'},
    {'#',' ',' ','#','#','#','#',' ',' ','#'},
    {'#',' ',' ',' ',' ',' ',' ',' ',' ','#'},
    {'#',' ',' ',' ','#','#','#','#','#','#'},
    {'#',' ',' ',' ',' ',' ',' ',' ',' ',' '},
    {'#','#','#','#','#','#','#','#','#','#'}
};
int loc_0[] = {3, 2};
int loc_case[] = {2, 2};

void mapPrint(void);

void movLoc(char choice);


int main(int argc, const char * argv[]) {
    // insert code here...
    while (1) {
        system("clear");
        mapPrint();
        if (loc_case[0] == 8 && loc_case[1] == 9){
            printf("恭喜成功\n");
            break;
        }
        printf("请输入小人的前进方向 a.左 s.下 w.上 d.右 q.结束游戏\n");
        char choice;
        rewind(stdin);
        scanf("%c", &choice);
        
        if (choice == 'q'){
            printf("结束\n");
            break;
        } else{
            movLoc(choice);
        }
    }
}

void mapPrint(void){
    for (int i = 0; i < ROWS ; i++){
        for (int j = 0; j < LISTS ; j++){
            printf("%c", map[i][j]);
        }
        printf("\n");
    }
}

void movLoc(char choice){
    if (choice == 'a'){
        if (map[loc_0[0]][loc_0[1] - 1] == 'X') {
            if (map[loc_case[0]][loc_case[1] - 1] != '#'){
                map[loc_case[0]][loc_case[1] - 1] = 'X';
                map[loc_case[0]][loc_case[1]] = '0';
                map[loc_0[0]][loc_0[1]] = ' ';
                loc_case[1] = loc_case[1] - 1;
                loc_0[1] = loc_0[1] - 1;
            }
        }else{
            if (map[loc_0[0]][loc_0[1] - 1] != '#'){
                map[loc_0[0]][loc_0[1] - 1] = '0';
                map[loc_0[0]][loc_0[1]] = ' ';
                loc_0[1] = loc_0[1] - 1;
            }
        }
    }else if (choice == 's'){
        if (map[loc_0[0] + 1][loc_0[1]] == 'X') {
            if (map[loc_case[0] + 1][loc_case[1]] != '#'){
                map[loc_case[0] + 1][loc_case[1]] = 'X';
                map[loc_case[0]][loc_case[1]] = '0';
                map[loc_0[0]][loc_0[1]] = ' ';
                loc_case[0] = loc_case[0] + 1;
                loc_0[0] = loc_0[0] + 1;
            }
        }else{
            if (map[loc_0[0] + 1][loc_0[1]] != '#'){
                map[loc_0[0] + 1][loc_0[1]] = '0';
                map[loc_0[0]][loc_0[1]] = ' ';
                loc_0[0] = loc_0[0] + 1;
            }
        }
    }else if (choice == 'w'){
        if (map[loc_0[0] - 1][loc_0[1]] == 'X') {
            if (map[loc_case[0] - 1][loc_case[1]] != '#'){
                map[loc_case[0] - 1][loc_case[1]] = 'X';
                map[loc_case[0]][loc_case[1]] = '0';
                map[loc_0[0]][loc_0[1]] = ' ';
                loc_case[0] = loc_case[0] - 1;
                loc_0[0] = loc_0[0] - 1;
            }
        }else{
            if (map[loc_0[0] - 1][loc_0[1]] != '#'){
                map[loc_0[0] - 1][loc_0[1]] = '0';
                map[loc_0[0]][loc_0[1]] = ' ';
                loc_0[0] = loc_0[0] - 1;
            }
        }
    }else if (choice == 'd'){
        if (map[loc_0[0]][loc_0[1] + 1] == 'X') {
            if (map[loc_case[0]][loc_case[1] + 1] != '#'){
                map[loc_case[0]][loc_case[1] + 1] = 'X';
                map[loc_case[0]][loc_case[1]] = '0';
                map[loc_0[0]][loc_0[1]] = ' ';
                loc_case[1] = loc_case[1] + 1;
                loc_0[1] = loc_0[1] + 1;
            }
        }else{
            if (map[loc_0[0]][loc_0[1] + 1] != '#'){
                map[loc_0[0]][loc_0[1] + 1] = '0';
                map[loc_0[0]][loc_0[1]] = ' ';
                loc_0[1] = loc_0[1] + 1;
            }
        }
    }
}
