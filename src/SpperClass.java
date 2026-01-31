import java.io.FileNotFoundException;
import java.io.IOException;

public class SpperClass {



    static {
        try {
            throw new Exception("Exception");
        }catch (Exception e)
        {

        }
    }

    public void  overrideMethod() throws ArithmeticException
    {

    }

    public  static void superMethod()
    {
        System.out.println("This is a super class method");
    }


    public  static void main(String ar[])
    {
          new SpperClass().overrideMethod();
    }




}
