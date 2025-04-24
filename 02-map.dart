void main(){
    Map<String, dynamic> student = {
        "id": 1,
        "name": "John Doe",
        "age": 30,
        "isStudent": false,
        "courses": ["Math", "Science"],
        "address": {
            "street": "123 Main St",
            "city": "New York"
        }
    }; 

// menampilkan student use key
    print(student["name"]); // John Doe
    print(student["age"]); // 30
    print(student["isStudent"]); // false
    print(student["courses"]); // [Math, Science]
    print(student["address"]["street"]); // 123 Main St
    print(student["address"]["city"]); // New York

    // menambahkan key/value pair baru
    student["phone"] = "123-456-7890";
    print(student);

    // mengupdate value dari key yang sudah ada
    student["age"] = 31;
    print(student);

// printah untuk menampilkan isi map
//     student.forEach((key, value) {
//         print("$key: $value");
//     });

//     // remove the phone key/value pair
//     student.clear();
}