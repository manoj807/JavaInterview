import java.io.IOException;

public class ThrowClass
{

    public void throwMethod() throws ArithmeticException, IOException
    {
        throw new ArithmeticException("This is an exception");
    }
}
