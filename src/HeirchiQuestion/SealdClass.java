package HeirchiQuestion;

public sealed class SealdClass permits SealdedChildClass1,SealdedChildClass2 {

    public void  overrideMethod()
    {
        System.out.println("This is a overridden method in subclass");
    }


}
