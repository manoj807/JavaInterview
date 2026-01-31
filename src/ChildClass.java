import java.io.FileNotFoundException;
import java.io.IOException;

public class ChildClass extends  SpperClass{



    ChildClass(){

        super();
    }

    ChildClass(String s){
         this();

    }
    @Override
    public void  overrideMethod() throws  NullPointerException
    {

    }

    public static void main(String[] args) {

        superMethod();
    }


}

//supper class method
//-- throw check exception then sub class method must throw same exception or its child exception or unchecked exception or no exception
//-- throw uncheck exception then sub class method may or may not throw exception but not check exception
//-- does not throw any exception then sub class method may or may not throw only uncheck exception

