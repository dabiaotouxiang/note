//
//  main.c
//  homework10
//
//  Created by db on 2021/12/24.
//

#include <stdio.h>
#include <stdlib.h>

void printMap(int rows, int cols, char arr[][cols]){
    for (int i = 0; i < rows ; i++){
        printf("%s\n", arr[i]);
    }
}

int main(int argc, const char * argv[]) {
    // insert code here...
    char arr[][9] = {
        "########",
        "#0##   #",
        "# ## # #",
        "#  # # #",
        "##   # #",
        "###### #"
    };
    int loc[] = {1, 1};
    while (1) {
        system("clear");
//        for (int i = 0; i < 6 ; i++){
//            printf("%s\n", arr[i]);
//        }
        printMap(6, 9, arr);
        if (loc[0] == 5 && loc[1] == 6){
            printf("恭喜您成功\n");
            break;
        }else{
            printf("请输入小人的前进方向 w.上 s.下 a.左 d.右 q.退出\n");
        }
        
        
        char choice;
        rewind(stdin);
        scanf("%c", &choice);
        if (choice == 'w'){
            if (arr[loc[0]-1][loc[1]] != '#'){
                arr[loc[0]-1][loc[1]] = '0';
                arr[loc[0]][loc[1]] = ' ';
                loc[0] = loc[0]-1;
            }
        }else if (choice == 's'){
            if (arr[loc[0]+1][loc[1]] != '#'){
                arr[loc[0]+1][loc[1]] = '0';
                arr[loc[0]][loc[1]] = ' ';
                loc[0] = loc[0]+1;
            }
        }else if (choice == 'a'){
            if (arr[loc[0]][loc[1]-1] != '#'){
                arr[loc[0]][loc[1]-1] = '0';
                arr[loc[0]][loc[1]] = ' ';
                loc[1] = loc[1]-1;
            }
        }else if (choice == 'd'){
            if (arr[loc[0]][loc[1]+1] != '#'){
                arr[loc[0]][loc[1]+1] = '0';
                arr[loc[0]][loc[1]] = ' ';
                loc[1] = loc[1]+1;
            }
        }else if (choice == 'q'){
            printf("再见\n");
        }
        
    }
    return 0;
}
