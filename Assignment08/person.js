var Person = function(name, password) {
  // Name is a property on Person instances.
  this.name = name;

  // Password won't be exposed as a property. It's only a local variable here.
  // We'll expose it with the getter below.
  var password = password;

  this.getPassword = function() {
    return password;
  }

  // The counter returned is a property defined on the constructor function
  // itself. This is one way to "share" a value. Since it behaves like a
  // "static" variable, it makes little sense to pass it in as a constructor
  // argument.
  this.getCounter = function() {
    return Person.counter;
  }

  // This will increment the shared value for demo purposes.
  this.incCounter = function() {
    Person.counter += 1;
  }
}

Person.counter = 0;

console.log("Creating a person instance p1 with name 'Jack' and password '123456'");
var p1 = new Person("Jack", "123456");

console.log("Creating a person instance p2 with name 'Jill' and password 'foobar'");
var p2 = new Person("Jill", "foobar");

console.log("\nDemostrating that the name property is accessible");
console.log("p1.name: " + p1.name);
console.log("p2.name: " + p2.name);

console.log("\nDemostrating that the password property is not accessible, i.e. undefined");
console.log("p1.password: " + p1.password);
console.log("p2.password: " + p2.password);

console.log("\nDemostrating that the password could be accessed via a getter");
console.log("p1.getPassword(): " + p1.getPassword());
console.log("p2.getPassword(): " + p2.getPassword());

console.log("\nDemostrating that counter is shared");
console.log("p1.getCounter(): " + p1.getCounter());
console.log("p2.getCounter(): " + p2.getCounter());
console.log("Calling p1.incCounter()");
p1.incCounter();
console.log("p1.getCounter(): " + p1.getCounter());
console.log("p2.getCounter(): " + p2.getCounter());
