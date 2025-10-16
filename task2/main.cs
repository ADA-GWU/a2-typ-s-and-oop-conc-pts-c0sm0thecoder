using System;

public class Developer
{
    // It is a standard method. The compiler will link to it based on the type of the
    // variable we use. It is an example for the static binding.
    public void SubmitPullRequest()
    {
        Console.WriteLine("Developer submits a pull request.");
    }

    // Here we declare a virtual method, which means that the way this method is
    // executed can vary. Which version to use will be decided in the runtime.
    // This is how dynamic binding works.
    public virtual void WriteCode()
    {
        Console.WriteLine("Developer writes code.");
    }
}

// This one is our first child class inheriting from the Developer class.
public class SeniorDeveloper : Developer
{
    // If you look at the Developer class (parent class) above, you can see that we
    // have this exact SubmitPullRequest method there too. By using the new keyword
    // in this child class, we shadow/hide the base method in the parent class.
    // Now, when this method is called through the instance of this class, the method
    // in this child class will be executed. However, if we treat this instance as the
    // Developer type, then the base method will be called.
    public new void SubmitPullRequest()
    {
        Console.WriteLine("Senior Developer submits a pull request.");
    }

    // Override provides the implementation for the virtual method in the parent class.
    // Unlike the new keyword, for this method, even if the instance of the derived class
    // is treated as the base class, the method in the derived class will be called.
    public override void WriteCode()
    {
        Console.WriteLine("Senior Developer writes code.");
    }
}

// This one is our second child class, which also inherits from the Developer class.
public class Intern : Developer
{
    public override void WriteCode()
    {
        Console.WriteLine("Intern writes code that destroys prod.");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        // The variable is a general Developer, which is our base class, but the person
        // doing the job is a SeniorDeveloper.
        Developer senior = new SeniorDeveloper();

        Console.Write("senior.SubmitPullRequest() -> ");
        // Because here a static binding happens, the compiler only sees a variable of type
        // Developer. It doesn't know anything about the new method in the SeniorDeveloper
        // class, so it calls the base method.
        senior.SubmitPullRequest();

        Console.Write("senior.WriteCode() -> ");
        // Because this method is virtual, dynamic binding occurs. The compiler generates
        // code that allows the runtime to check the object's true type. At runtime, the
        // object is identified as a SeniorDeveloper, so its overridden WriteCode() method is called.
        senior.WriteCode();

        // Again a Developer variable, but the person is an Intern.
        Developer intern = new Intern();

        Console.Write("intern.SubmitPullRequest() -> ");
        // Because of the static binding, the compiler again sees a variable of type Developer,
        // so it calls the method in the base class.
        intern.SubmitPullRequest();

        Console.Write("intern.WriteCode() -> ");
        // Because dynamic binding happens here, the compiler sees that the object is an Intern,
        // so it calls the overriden method in the Intern class
        intern.WriteCode();
        
        // You can find the output of this code in the out.txt file in the folder task2/
    }
}
