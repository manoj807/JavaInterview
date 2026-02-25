package HeirchiQuestion;

public class MainClass
{
    public static void main(String[] args) {
        SupperClass1 childClass1 = new ChildClass1();
        childClass1.overrideMethod();

        SupperClass1 supperClass1= new SupperClass1();
        ((ChildClass1) supperClass1).overrideMethod();


    }
}
