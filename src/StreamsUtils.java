import java.awt.desktop.AboutEvent;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class StreamsUtils
{



    public static List<Employee> getEmployeeList()
    {
        return List.of(
                new Employee("Alice", "HR", 3000),
                new Employee("Bob", "IT", 4000),
                new Employee("Charlie", "IT", 3500),
                new Employee("David", "Sales", 2000),
                new Employee("Eve", "HR", 3200)
        );
    }

    public static Integer getMaxNum(List<Integer> list) {
        //return list.stream().max(Integer::compare).orElse(-1);
        return list.stream().max(Integer::compareTo).orElse(-1);
        //not working
       // return list.stream().max(item-> Comparator.comparing(item)).orElse(-1);
    }

    public static Integer getMinNum(List<Integer> list) {
        //return list.stream().min(Integer::compare).orElse(-1);
        return list.stream().min(Integer::compareTo).orElse(-1);
    }

    public static Integer getSum(List<Integer> list) {

        //return list.stream().reduce(0, Integer::sum);
       return  list.stream().mapToInt(Integer::intValue).sum();
       //return list.stream().mapToInt(i->i).sum();

        /*return  list.stream()
                .reduce(0, (a, b) -> a + b);*/
    }

    public static List<Integer> getSquareOfEachElement(List<Integer> list) {

        return list.stream().map(i -> i * i).toList();
    }


    public static List<String> convertEachElementToUpperCase(List<String> list) {

        return list.stream().map(String::toUpperCase).toList();
    }



    public static List<Integer> removeDuplicateElement(List<Integer> list) {

        return list.stream().distinct().toList();
    }

    public static List<Integer> findDuplicateElement(List<Integer> list) {

      // return   list.stream().filter(i->list.stream().filter(j->j.equals(i)).count()>1).distinct().toList();
        Set<Integer> set= new HashSet<Integer>();
        return list.stream().filter(n->!set.add(n)).toList();
    }

    public static List<Character> findDuplicateCharacters(String strs)
    {
        Set<Character> set= new HashSet<>();

        return strs.chars().mapToObj(c->(char)c).filter(c->!set.add(c)).toList();


    }


    public static Map.Entry<Character, Long> mostFrequentCharacter(String str) {

        return str.chars().mapToObj(c->(char)c)
                .collect(Collectors.groupingBy(Function.identity(), Collectors.counting()))
                .entrySet().stream()
                .max(Map.Entry.comparingByValue()).orElse(null);
    }

    public static boolean isListSorted(List<Integer> list)
    {

        return IntStream.range(0, list.size()-1).allMatch(i-> list.get(i)<=list.get(i+1));

    }


    public static List<Integer> getEvenIndexList(List<Integer> list)
    {

        return IntStream.range(0, list.size()).filter(i -> i % 2 == 0).mapToObj(list::get).toList();
    }

    public static  String firstLimitcharacters(String strs, int limit)
    {

         /*List<Character> list= strs.chars().mapToObj(c->(char)c).limit(limit).toList();
         String srt=list.stream().map(String::valueOf).collect(Collectors.joining());*/
        return strs.chars().limit(limit).mapToObj(c-> String.valueOf((char)c)).collect(Collectors.joining());

    }

    public static  String lastLimitcharactersFrom(String strs, int limit)
    {

         /*List<Character> list= strs.chars().mapToObj(c->(char)c).limit(strs.length()-limit).toList();
         String srt=list.stream().map(String::valueOf).collect(Collectors.joining());*/
        return strs.chars().skip(strs.length()-limit).mapToObj(c-> String.valueOf((char)c)).collect(Collectors.joining());

    }

    public static  int mapAndReduceString(List<String> words)
    {
        //int totalLength= words.stream().map(String::length).reduce(0, Integer::sum);

      // int totalLength= words.stream().map(String::length).reduce(0,(a, b)->a+b);
        int totalLength= words.stream().map(String::length).reduce(0, (a, b)->a+b);
       return  totalLength;


    }

    public  static Map<Character, List<String>>  groupByFirstCharacter(List<String> list)
    {

        return  list.stream().collect(Collectors.groupingBy(w->w.charAt(0)));

    }


    public  static String getRemoveDuplicateCharacter(String srt)
    {

       return  srt.chars().distinct().mapToObj(c->String.valueOf((char) c)).collect(Collectors.joining());

    }

    public static String getFindWordsMostVowels(List<String> words)
    {
        return words.stream().max(Comparator.comparing(w->w.replaceAll("^[aouieAOUIE]", "").length())).orElse(null);
    }




   public static void filterEmployeeWithSalary()
   {
       List<Employee> list=getEmployeeList();

       list.stream().filter(e->e.getSalary()>3000).forEach(System.out::println);
   }

   public  static  int sumOfEvenNumbers(List<Integer> list)
   {
      // return list.stream().filter(n->n%2==0).reduce(0,Integer::sum);

       return list.stream().filter(n->n%2==0).mapToInt(Integer::intValue).sum();

   }

   public  static  Integer[] convertListToArray(List<Integer> list)
   {
       //return list.toArray(Integer[]::new);

       return list.stream().toArray(Integer[]::new);
   }

   public static char findFirstNonRepeatingCharacter(String str)
   {
       /*Map<Character, Long> charCountMap = str.chars()
               .mapToObj(c -> (char) c)
               .collect(Collectors.groupingBy(Function.identity(), LinkedHashMap::new, Collectors.counting()));

       return charCountMap.entrySet().stream()
               .filter(entry -> entry.getValue() == 1)
               .map(Map.Entry::getKey)
               .findFirst()
               .orElse('\0'); // Return null character if no non-repeating character is found*/




         return str.chars().mapToObj(chr->(char)chr).filter(ch->str.indexOf(ch)==str.lastIndexOf(ch)).findFirst().orElse('\0');



   }


   public static char findFirstRepeatingCharacter(String str) {


//       Map<Character, Long> charCountMap = str.chars().mapToObj(c->(char)c).collect(Collectors.groupingBy(Function.identity(), LinkedHashMap::new , Collectors.counting()));
//       return  charCountMap.entrySet().stream().filter(entry->entry.getValue()>1).map(Map.Entry::getKey).findFirst().orElse('\0');


       return str.chars().mapToObj(c->(char)c).filter(ch->str.indexOf(ch)!=str.lastIndexOf(ch)).findFirst().orElse('\0');



   }


   public static String removerSpecialCharacter(String str) {

       return str.chars().filter(Character::isLetterOrDigit).mapToObj(ch->String.valueOf((char)ch)).collect(Collectors.joining());
   }


   public static Map<Character, List<String>> groupWordsByLastCharacter(List<String> words)
   {
       return words.stream().collect(Collectors.groupingBy(w->w.charAt(0)));
   }

   public static List<Integer> getListOfPrimeNumbersFromRangeNumber(int start, int end)
   {
       return  IntStream.rangeClosed(start,end).filter(n->IntStream.rangeClosed(start, (int)Math.sqrt(n)).allMatch(i->n%i!=0)).boxed().toList();
   }

   public static String getMaxLengthString(List<String> list)
   {


       return  list.stream().max(Comparator.comparingInt(String::length)).orElse(null);
   }

    public static String getMinLengthString(List<String> list) {
        return list.stream().min(Comparator.comparingInt(String::length)).orElse(null);
    }
   public static List<Integer> findPrimeNumbers( List<Integer> list)
   {



   //not optimize solution
     //return   list.stream().filter(n-> IntStream.rangeClosed(2, n/2).allMatch(i->n%i!=0)).toList();

       return list.stream().filter(n-> IntStream.rangeClosed(2, (int)Math.sqrt(n)).allMatch(i-> n%i==0)).toList();

   }

   public  static Map<Character,Integer> getCharacterCount(String str)
   {

       return str.chars().mapToObj(c->(char)c).collect(Collectors.groupingBy(Function.identity(), Collectors.summingInt(c->1)));
   }

    public  static Map<Character,Long> getCharacterCount2(String str)
    {

        return str.chars().mapToObj(c->(char)c).collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));
    }

    public  static double  averageOfSquares(List<Integer> list)
    {
      //  return list.stream().mapToInt(i->i*i).average().orElse(0);
        return list.stream().map(i->i*i).collect(Collectors.averagingInt(i->(int)i));
    }

    public  static List<Character>  findDublicateChar(String str)
    {
       // Set<Character> set=new HashSet<>();
       // return  str.chars().mapToObj(c->(char)c).filter(c->!set.add(c)).distinct().collect(Collectors.toList());

        return  str.chars().mapToObj(c->(char)c).filter(c->str.indexOf(c)!=str.lastIndexOf(c)).distinct().toList();
    }

    public static List<Integer> filterListByIndex(List<Integer> list)
    {

        List<Integer> numbers = List.of(1, 2, 3, 4, 5);

        int sum = numbers.stream()
                .filter(n -> n % 2 == 0)
                .mapToInt(i-> (int)i)
                .sum();

        int sum2=numbers.stream().filter(n->n%2==0).reduce(0, Integer::sum);

        System.out.println("sum2::"+sum2);



//        List<Integer> numbers = List.of(1, 2, 3, 4, 5);
//
//        int sum = numbers.stream()
//                .filter(n -> n % 2 == 0)
//                //.mapToInt(Integer::intValue)
//                .sum();

        return IntStream.range(0, list.size())
                .filter(i -> i % 2 == 0) // Example: filter even indices
//                .mapToObj(list::get)
                .boxed()
                .collect(Collectors.toList());
    }

    public  static double getSquareOfAverage(List<Integer> list)
    {
        //return  list.stream().mapToInt(i->i*i).average().orElse(0);
        return  list.stream().map(i->i*i).collect(Collectors.averagingInt(i->(int)i));

    }


    public  static String isfindOnlyAlfabatAndDigit(String str)
    {

       String sss= str.chars()
                .filter(Character::isAlphabetic)
                .mapToObj(String::valueOf).collect(Collectors.joining());


        List<Character> list= str.chars().distinct().mapToObj(c -> (char)c).collect(Collectors.toList());

        String s = "a1b2c3";

        //int total = s.chars().filter(Character::isDigit).map(c -> c - '0').sum();
       // int total = s.chars().filter(Character::isDigit).map(i->Integer.parseInt(String.valueOf((char)i))).sum();
        //int total = s.chars().filter(Character::isDigit).map(i->Integer.valueOf(String.valueOf(i))).sum();
        int total = s.chars().filter(Character::isDigit).mapToObj(c -> Integer.parseInt(String.valueOf(c))).reduce(0, (a,b)->a+b);


       List<Character> chList= s.chars().mapToObj(c->(char)c).filter(c->s.indexOf(c)!=s.lastIndexOf(c)).distinct().collect(Collectors.toList());

        List<Object> mixed = List.of(1, "a", 2, "b");
        List<Integer> list1= mixed.stream().filter(o -> o instanceof Integer).map(item-> (Integer) item).collect(Collectors.toList());

       // String str = "abc";
//        List<String> chars = str.chars().mapToObj(c -> String.valueOf((char)c)).toList();
        List<Character> list22=str.chars().mapToObj(c -> (char)c).collect(Collectors.toList());
      List<String> lss=List.of("hjsdhjc","sjhjsdhjf");
       // int totalLen = lss.stream().map(String::length).reduce(0, Integer::sum);
        int totalLen = lss.stream().mapToInt(String::length).reduce(0, Integer::sum);
        //int totalLen = lss.stream().mapToInt(String::length).sum();

        String string=lss.stream().max(Comparator.comparing(w -> w.replaceAll("[^aeiouAEIOU]", "").length())).orElse(null);

        String stringww=lss.stream().max(Comparator.comparingInt(w -> w.replaceAll("[^aeiouAEIOU]", "").length())).orElse(null);

    List<Integer> lissss=List.of(1,3,4,5,6);
      List<Integer> lsis= IntStream.range(0, lissss.size())
                .filter(i -> i % 2 == 0)
                .mapToObj(lissss::get).collect(Collectors.toList());




     List<Character> sss111 = "DEERER".chars().mapToObj(c->(char)c).collect(Collectors.toList());

        String li= "DEERER".chars().mapToObj(c->String.valueOf((char)c)).collect(Collectors.joining());
        String sr=s.chars().limit(3).mapToObj(c -> String.valueOf((char)c)).collect(Collectors.joining());

        int squareSum = lissss.stream().mapToInt(n -> n * n).sum();





        List<String> strNums = List.of("10", "20", "30");
        List<Integer> intNums = strNums.stream()
                .map(Integer::parseInt)
                .collect(Collectors.toList());


        List<Integer> l1 = List.of(1, 2, 3, 4);
        List<Integer> l2 = List.of(2, 3, 5);
        List<Integer> l3 = List.of(3, 4, 2);



        Set<Integer> s2 = new HashSet<>(l2);
        Set<Integer> s3 = new HashSet<>(l3);

       List<Integer> list111= l1.stream()
                .filter(s2::contains)
                .filter(s3::contains).distinct().collect(Collectors.toList());

     Optional<String> op=Optional.of("2");
     if(op.isPresent())
     {
         op.orElse("");
     }

        Integer[] arr = l3.stream().toArray(Integer[]::new);

        int[] arr1 = l3.stream().mapToInt(i->i).toArray();


        list.stream().map(n -> n * n).reduce(0, Integer::sum);
        list.stream().mapToInt(n -> n * n).sum();

        List<Integer> merged = Stream.concat(List.of(1, 2).stream(), List.of(3, 4).stream()).toList();

        List<String> names = List.of("Tom", "Jerry");
        Map<String, Long> map = names.stream()
                .collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));

        Map<String, Integer> map11 = names.stream()
                .collect(Collectors.toMap(Function.identity(), String::length));

        List<Integer> l11 = List.of(1, 2, 3, 4);
        Optional<Integer> secondMax = l11.stream()
                .distinct()
                .sorted(Comparator.reverseOrder())
                .skip(1).findFirst();

//        secondMax.isPresent();
//        secondMax.orElse("")

        List<Integer> liiii=Stream.iterate(1, n -> n + 1).limit(5).collect(Collectors.toList());





        List<Employee> employees = List.of(
                new Employee("Alice", "HR", 3000),
                new Employee("Bob", "IT", 4000),
                new Employee("Charlie", "IT", 3500),
                new Employee("David", "Sales", 2000),
                new Employee("Eve", "HR", 3200)
        );

       Employee list11 = employees.stream().sorted(Comparator.comparingInt(Employee::getSalary).reversed()).skip(2).findFirst().orElse(null);


        List<String> list1111= Arrays.asList("java", "spring", "hibernate", "jpa", "boot");
       // int totalLen = list1111.stream().map(String::length).reduce(0, Integer::sum);
        int totalLen22 = list1111.stream().mapToInt(String::length).sum();

        List<String> sorted = list1111.stream()
                .sorted(Comparator
                        .comparingInt(String::length)      // 1. Sort by length
                        .thenComparing(Comparator.naturalOrder())) // 2. Sort alphabetically
                .collect(Collectors.toList());


        List<String> sorted11 = list1111.stream()
                .sorted(Comparator.comparingInt(String::length).thenComparing(String::compareTo))
                .toList();

        long vowels = str.chars().mapToObj(c->(char)c).filter(c -> "aeiou".indexOf(c) != -1).count();

        IntStream.range(0, s.length()).forEach(i ->
                IntStream.range(i + 1, s.length() + 1)
                        .mapToObj(j -> s.substring(i, j))
                        .forEach(System.out::println));

        int sum = IntStream.rangeClosed(1, 5).sum();

        double avg = l11.stream().mapToInt(i -> i).average().orElse(0);
        int sum11 = l11.stream().filter(n -> n % 2 == 0)
                .mapToInt(i->i ).sum();



        return "";

    }


    public  static  List<String> getSubList(String str)
    {
        int arr[]={2,3,1,4};
        int ar[]=new int[arr.length];
        int pos=0;
        int arrrr[]= Arrays.stream(arr).map(skipItem->Arrays.stream(arr).filter(item-> item !=skipItem).reduce(1, (a,b)->a*b)).distinct().toArray();
        //List<Integer> list= Arrays.stream(arr).map(skipItem->Arrays.stream(arr).filter(item-> item !=skipItem).reduce(1, (a,b)->a*b)).distinct().mapToObj(i-> Integer.valueOf(i)).toList();
        List<Integer> merged = Stream.concat(List.of(1, 2).stream(), List.of(3, 4).stream()).toList();


        String s = "abc";
        List<String> list=new ArrayList<>();
        IntStream.range(0, s.length()).forEach(i ->
                IntStream.range(i + 1, s.length() + 1)
                        .mapToObj(j -> s.substring(i, j))
                        .forEach(item-> list.add(item)));



      return  list;
    }


    public static int findGCD(int a, int b) {
        while (b > 0) {
            int temp = b;
            b = a % b;  // remainder
            a = temp;
        }


       
        return a;
    }

    private  static int add(int a, int b) {
        return a + b;
    }







//    or create a new repository on the command line
//    echo "# reeeee11" >> README.md
//    git init
//    git add README.md
//    git commit -m "first commit"
//    git branch -M main
//    git remote add origin https://github.com/manoj807/reeeee11.git
//    git push -u origin main
//…or push an existing repository from the command line
//    git remote add origin https://github.com/manoj807/reeeee11.git
//    git branch -M main
//    git push -u origin main


}
