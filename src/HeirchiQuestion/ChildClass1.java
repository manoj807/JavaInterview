package HeirchiQuestion;

public class ChildClass1 extends  SupperClass1
{
        @Override
        public void  overrideMethod() throws ArithmeticException
        {
            System.out.println("This is a overridden method in subclass");
        }

        public  static void superMethod()
        {
            System.out.println("This is a super class method");
        }
}
