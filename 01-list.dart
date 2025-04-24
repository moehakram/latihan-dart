void main(){

    List<int> myList = [1, 3, 5, 1, 5, 8, 9];

    myList.removeAt(5);
    myList.sort();

    myList.forEach((element) {
        print(element);
    });
}