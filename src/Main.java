import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args)
    {
        // Example usage of StreamsUtils



        List<Integer> numbers = List.of(1, 5,2, 3,3, 4, 1,4,5);
        numbers.stream().collect(Collectors.averagingInt(Integer::intValue));

        Integer maxNum = StreamsUtils.getMaxNum(numbers);
        Integer minNum = StreamsUtils.getMinNum(numbers);
        Integer sum = StreamsUtils.getSum(numbers);

        System.out.println("Max: " + maxNum);
        System.out.println("Min:    dfedd " + minNum    );

        System.out.println("Sum: " + sum);
        List<Integer> duplicateElement = StreamsUtils.findDuplicateElement(numbers);
        System.out.println("Squares: " + duplicateElement);

        Map.Entry<Character,Long> map = StreamsUtils.mostFrequentCharacter("banana");
        System.out.println("mapss: " + map);

        List<Integer> evenIndexElements = StreamsUtils.getEvenIndexList(numbers);
        System.out.println("evenIndexElements: " + evenIndexElements);

        String string = StreamsUtils.firstLimitcharacters("manoj kumar",3);
        System.out.println("firstLimitcharacters: " + string);

        int totalLength = StreamsUtils.mapAndReduceString(List.of("manoj", "kumar", "java"));
        System.out.println("Total Length of Strings: " + totalLength);

        Map<Character,List<String>> groupByFirstCharacter  = StreamsUtils.groupByFirstCharacter(List.of("manoj","monu", "kumar", "java"));

        System.out.println("groupByFirstCharacter: " + groupByFirstCharacter);

        String distinctString = StreamsUtils.getRemoveDuplicateCharacter("bansana");
        System.out.println("distinctString: " + distinctString);

        String strs=StreamsUtils.getFindWordsMostVowels(List.of("manoj","monu", "kumar", "java", "banana"));
        System.out.println("strs: " + strs);

        StreamsUtils.filterEmployeeWithSalary();

        List<Integer> palindromes = StreamsUtils.getListOfPrimeNumbersFromRangeNumber(2, 20);
        System.out.println("palindromes: " + palindromes);

        List<Integer> list = List.of(2, 3, 4, 5, 16, 17, 19, 20);
        List<Integer> findPrimeNumbers = StreamsUtils.findPrimeNumbers(list);
        System.out.println("findPrimeNumbers: " + findPrimeNumbers);

        StreamsUtils.filterListByIndex(List.of(2, 3, 4, 5));

       List<String> list111= StreamsUtils.getSubList("12244");
        System.out.println("list111: " + list111);

       // ThrowClass throwClass=new ThrowClass();
        //throwClass.throwMethod();


        //List<String> list222= List.of("A", "B", "C");
        //list222.add("hdsjjf");

//        List<String> list = List.of("RBI", "Sital", "IBIY", "abc", "idf");
//
//        List<String> result = list.stream()
//                .filter(s -> s.length() > 1)                         // Ensure index 1 exists
//                .filter(s -> s.charAt(1) == 'b' || s.charAt(1) == 'B')
//                .toList();

        //List<String> filterList = list222.stream().filter(item-> (item.length()>=2 && (item.charAt(1)=='B' ||   item.charAt(1)=='b'))).collect(Collectors.toList());

        System.out.println("Java".replace('a','A'));


        //int num1 = 12;
       // int num2 = 18;

        //System.out.println("GCD of " + num1 + " and " + num2 + " is " + StreamsUtils.findGCD(num1, num2));
        //System.out.println("GCD of " + num1 + " and " + num2 + " is " + StreamsUtils.findGCD(num1, num2));

        System.out.println(StreamsUtils.averageOfSquares(List.of(2, 2)));
        List<Integer> list11 = List.of(2, 3, -4, 5, 16, 17, 19, 20);
        boolean noneNeg = list11.stream().noneMatch(n -> n < 0);
        System.out.println("noneNeg:::"+noneNeg);




    }
}