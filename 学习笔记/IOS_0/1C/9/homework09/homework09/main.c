//
//  main.c
//  homework09
//
//  Created by lsb on 2021/12/23.
//

#include <stdio.h>
#include <limits.h>
int max(int* arr, int size){
    int max = INT_MIN;
    for (int i = 0; i < size; i++){
        if (arr[i] > max){
            max = arr[i];
        }
    }
    return max;
}

int min(int* arr, int size){
    int min = INT_MAX;
    for (int i = 0; i < size; i++){
        if (arr[i] < min){
            min = arr[i];
        }
    }
    return min;
}

int sum(int arr[], int size){
    int sum = 0;
    for (int i = 0; i < size; i++){
        sum = sum + arr[i];
    }
    return sum;
}

int avrage(int arr[], int size){
    int sum = 0;
    for (int i = 0; i < size; i++){
        sum = sum + arr[i];
    }
    return sum/ size;
}

int index_num(int arr[], int size, int num){
    for (int i = 0; i < size; i++){
        if (arr[i] == num){
            return i;
        }
    }
    return -1;
}

int reverse(int arr[], int size){
    int tmp = 0;
    for (int i = 0; i < size/2; i++){
        tmp = arr[i];
        arr[i] = arr[size - i - 1];
        arr[size -i -1 ] = tmp;
    }
    return 0;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    int arr[] = {23,56,745,346,34256,435,32};
    reverse(arr, sizeof(arr)/sizeof(int));
    for (int i = 0; i < sizeof(arr)/sizeof(int); i++){
        printf("%d\n", arr[i]);
    }
//    printf("index是%d\n", num);
    return 0;
}
