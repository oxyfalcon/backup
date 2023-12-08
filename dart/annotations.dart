import "dart:mirrors";

void main() {
  var object = new Class1();
  var classMirror = reflectClass(object.runtimeType);
  // Retrieve 'HelloMetadata' for 'object'
  HelloMetadata hello = getAnnotation(classMirror, HelloMetadata);
  print("'HelloMetadata' for object: $hello");

  // Retrieve 'Goodbye' for 'object.method'
  var methodMirror = (reflect(object.method) as ClosureMirror).function;
  Goodbye goodbye = getAnnotation(methodMirror, Goodbye);
  print("'Goodbye' for object: $goodbye");

  // Retrieve all 'Goodbye' for 'object.method'
  List<Goodbye> goodbyes = getAnnotations(methodMirror, Goodbye);
  print("'Goodbye's for object.method': $goodbyes");

  // Retrieve all metadata for 'object.method'
  List all = getAnnotations(methodMirror);
  print("'Metadata for object.method': $all");
}

Object? getAnnotation(DeclarationMirror declaration, Type annotation) {
  for (var instance in declaration.metadata) {
    if (instance.hasReflectee) {
      var reflectee = instance.reflectee;
      if (reflectee.runtimeType == annotation) {
        return reflectee;
      }
    }
  }

  return null;
}

List getAnnotations(DeclarationMirror declaration, [Type annotation]) {
  var result = [];
  for (var instance in declaration.metadata) {
    if (instance.hasReflectee) {
      var reflectee = instance.reflectee;
      if (annotation == null) {
        result.add(reflectee);
      } else if (reflectee.runtimeType == annotation) {
        result.add(reflectee);
      }
    }
  }

  return result;
}

@HelloMetadata("Class1")
class Class1 {
  @HelloMetadata("method")
  @Goodbye("method")
  @Goodbye("Class1")
  void method() {}
}

class HelloMetadata {
  final String text;
  const HelloMetadata(this.text);
  String toString() => "Hello '$text'";
}

class Goodbye {
  final String text;
  const Goodbye(this.text);
  String toString() => "Goodbye '$text'";
}
