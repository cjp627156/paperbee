package com.definesys.bees.test;

public class SortMain {

    public static void main(String[] args) {
        int[] array = new int[]{7, 3, 9, 12, 45, 2, 8, 10, 1};
        // bubbleSort(array);
        selectionSort(array);

        for(int i:array){
            System.out.print(i+"/");
        }
    }

    //冒泡排序
    public static void bubbleSort(int[] array) {
        int size = array.length;
        if (size == 0) {
            return ;
        }
        for (int i = 0; i < size - 1; i++) {
            for (int j = 0; j < size - i - 1; j++) {
                if (array[j] > array[j + 1]) {
                    int temp = array[j + 1];
                    array[j + 1] = array[j];
                    array[j] = temp;
                }
            }
        }
//        return array;
    }

    //选择排序
    public static void selectionSort(int[] array){
        int size=array.length;
        if(size==0){
            return;
        }
        for(int i=0;i<size;i++){
            int minIndex=i;
            for(int j=i;j<size;j++){
                if(array[j]<array[minIndex]){
                    minIndex=j;
                }
            }
            int temp=array[i];
            array[i]=array[minIndex];
            array[minIndex]=temp;
        }
    }


}
