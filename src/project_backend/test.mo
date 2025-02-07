import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Float "mo:base/Float";
import Debug "mo:base/Debug";

actor Example {

  public func project(grades : [Float]) : async Float {
    var total : Float = 0;
    for (i in grades.vals()) {
      total := total + i;
    };

    let average : Float = total / Float.fromInt(grades.size());
    return average;
  };

  public func maxGrade(grades : [Float]) : async Float {
    var maxNum : Float = 0;
    for (i in grades.vals()) {
      if (i > maxNum) {
        maxNum := i;
      };
    };
    return maxNum;
  };

  var array1 : [Nat] = [1, 2, 3, 4, 5, 6];
  var array2 : [Nat] = [8, 9, 10, 11];

  public func addArray(array3 : [Nat], array4 : [Nat]) : async [Nat] {
    return Array.append(array3, array4);
  };

  private func _addOne(n : Nat) : Nat {
    n + 1;
  };

  public func addOne() : async [Nat] {
    return Array.map(array1, _addOne);
  };

  // Buffers IN Motoko
  let studentNames = Buffer.Buffer<Text>(10);
  studentNames.add("Osei");
  public func joinSchool(name : Text) : async Text {
    studentNames.add("Osei Assibey");
    studentNames.put(0, "Nana Antwi");
    return "Welcome to School " # studentNames.get(0);
  };
  public func showAllBufferElements() : async [Text] {
    return Buffer.toArray<Text>(studentNames);
  };
  public func removeElement(name : Text) : async [Text] {
    var counter : Nat = 0;
    for (element in studentNames.vals()) {
      if (element == name) {
        ignore studentNames.remove(counter);
      };
      counter := counter + 1;
    };
    return Buffer.toArray(studentNames);
  };
  var array5 : [var Nat] = [var 1, 2, 3, 4, 5];
  array5[3] := 9;
  Debug.print(debug_show (array5[3]));

  var i : Nat = 0;
  while (i < array5.size()) {
    Debug.print(debug_show (i));
  };

};
