import java.util.*;
class Main{
    static class Product{
        private int productId;//pID
        private String productName;
        private String category;

        public Product(int productId, String productName, String category){
            this.productId = productId;
            this.productName = productName;
            this.category = category;
        }

        public int getproductId(){
            return this.productId;
        }
        public String getproductName(){
            return this.productName;
        }
        public String getCategory(){
            return this.category;
        }
    }
    //Linear Search via product Id
    public static int linearSearchBypID(Product[] p, int target){
        int idx = -1;;
        for(int i = 0; i < p.length; i++){
            if(p[i].getproductId() == target){
                idx = i;
            }
        }
        return idx;
    }
    public static void sortBypId(Product[] p){
        Arrays.sort(p,Comparator.comparing(prod -> prod.productId));
    }
    //Binary search via product Id
    public static int binarySearchBypID(Product[] p, int target){
        int l = 0;
        int h = p.length - 1;
        while(l <= h){
            int m = (l + h)/2;
            if(p[m].productId == target){
                return m;
            } else if(p[m].productId < target){
                l = m + 1;
            }
            else if(p[m].productId > target){
                h = m - 1;
            }
        }
        return -1;
    }

    //Linear Search via product Name
    //I choose to return array of indices beacause,
    //Miltiple products can have same names(but different pids)
    public static int[] linearSearchBypName(Product[] p, String target){
        int [] res = new int[p.length];
        int x = -1;
        for(int i = 0; i < p.length; i++){
            if((p[i].getproductName()).equalsIgnoreCase(target)){
                res[++x] = i; 
            }
        }
        return Arrays.copyOfRange(res, 0, x + 1);
    }
    public static void sortBypName(Product[] p){
        Arrays.sort(p,Comparator.comparing(prod -> prod.productName.toLowerCase()));
    }
    public static int binarySearchBypName(Product[] p, String target){
        int l = 0, h = p.length - 1;
        while(l <= h){
            int m = (l + h)/2;
            int result = p[m].getproductName().compareToIgnoreCase(target);
            if(result == 0){
                return m;
            } else if(result < 0){
                l = m + 1;
            } else{
                h = m - 1;
            }
        }
        return -1; 
    }
    //Binary Search By PRoduct Name( for all product indices) O(k + log(n))
    public static int[] rangebinarySearchBypName(Product[] p, String target){
        int[] res = new int[p.length];
        int x = -1;
        int l = 0;
        int h = p.length - 1;
        while(l <= h){
            int m = (l + h)/2;
            int result = p[m].getproductName().compareToIgnoreCase(target);
            if(result == 0){
                int i = m;
                while(i >= 0 && p[i].getproductName().equalsIgnoreCase(target)){
                    i--;
                }
                i++;
                while(i < p.length && p[i].getproductName().equalsIgnoreCase(target)){
                    res[++x] = i;
                    i++;
                }
                break;
            } else if(result < 0){
                l = m + 1;
            }
            else if(result > 0){
                h = m - 1;
            }
        }
        return Arrays.copyOfRange(res, 0, x + 1);
    }

    //Linear Search via product Category
    //Miltiple products can fall unser same category(but different pids)
    public static int[] linearSearchBypCategory(Product[] p, String target){
        int [] res = new int[p.length];
        int x = -1;
        for(int i = 0; i < p.length; i++){
            if(p[i].getCategory().equalsIgnoreCase(target)){
                res[++x] = i; 
            }
        }
        return Arrays.copyOfRange(res, 0, x + 1);
    }
    public static void sortByCategory(Product[] p){
        Arrays.sort(p,Comparator.comparing(prod -> prod.category));
    }
    public static int binarySearchByCategory(Product[] p, String target){
        int l = 0, h = p.length - 1;
        while(l <= h){
            int m = (l + h)/2;
            int result = p[m].getCategory().compareToIgnoreCase(target);
            if(result == 0){
                return m;
            } else if(result < 0){
                l = m + 1;
            } else {
                h = m - 1;
            }
        }
        return -1; 
    }
    //Range Binary search via category O(k + log(n))
    public static int[] rangebinarySearchBypCat(Product[] p, String target){
        int[] res = new int[p.length];
        int x = -1;
        int l = 0;
        int h = p.length - 1;
        while(l <= h){
            int m = (l + h)/2;
            int result = p[m].getCategory().compareToIgnoreCase(target);
            if(result == 0){
                int i = m;
                while(i >= 0 && p[i].getCategory().equalsIgnoreCase(target)){
                    i--;
                }
                i++;
                while(i < p.length && p[i].getCategory().equalsIgnoreCase(target)){
                    res[++x] = i;
                    i++;
                }
                break;
            } else if(result < 0){
                l = m + 1;
            }
            else if(result > 0){
                h = m - 1;
            }
        }
        return Arrays.copyOfRange(res, 0, x + 1);
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter no of elemnts...");
        int n = sc.nextInt();

        Product[] p = new Product[n];

        for(int i = 0; i < n; i++){
            System.out.println("Enter product Id of product "+(i +1)+": ");
            int x = sc.nextInt();
            sc.nextLine();
            System.out.println("Enter product name of product "+(i +1)+": ");
            String name = sc.nextLine();
            System.out.println("Enter category(A/B/C) of product "+(i +1)+": ");
            String category = sc.nextLine();
            p[i] = new Product(x,name,category);
        }
        //Assumin product id is unique(Primary key attribute)
        System.out.println("\n--- Linear Search by productId: 102 ---");
        int idx1 = linearSearchBypID(p, 102);
        System.out.println(idx1 != -1 ? "result: " + p[idx1].getproductId() +"||" + p[idx1].getproductName()+"||"+ p[idx1].getCategory(): "Not found");

        System.out.println("\n--- Linear Search by productName: 'Mouse' ---");
        int[] idx3 = linearSearchBypName(p, "Mouse");
        if (idx3.length == 0) System.out.println("Not found");
        for (int i : idx3) System.out.println( "result: " + p[i].getproductId() +"||" + p[i].getproductName()+"||"+ p[i].getCategory());

        System.out.println("\n--- Linear Search by Category: 'A' ---");
        int[] idx5 = linearSearchBypCategory(p, "A");
        if (idx5.length == 0) System.out.println("Not found");
        for (int i : idx5) System.out.println("result: " + p[i].getproductId() +"||" + p[i].getproductName()+"||"+ p[i].getCategory());


        sortBypId(p);
        System.out.println("\n--- Binary Search by productId: 102 ---");
        int idx2 = binarySearchBypID(p, 102);
        System.out.println(idx2 != -1 ? "result: " + p[idx2].getproductId() +"||" + p[idx2].getproductName()+"||"+ p[idx2].getCategory(): "Not found");


        

        sortBypName(p);
        System.out.println("\n--- Binary Search by productName: 'Mouse' ---");
        int idx4 = binarySearchBypName(p, "Mouse");
        System.out.println(idx4 != -1 ?"result: " + p[idx4].getproductId() +"||" + p[idx4].getproductName()+"||"+ p[idx4].getCategory(): "Not found");
        
        System.out.println("\n--- Binary Search O(k + log(n)) by productName:       'Mouse' ---");
        int[] idx9 = rangebinarySearchBypName(p, "Mouse");
        if (idx9.length == 0) System.out.println("Not found");
        for (int i : idx9) System.out.println( "result: " + p[i].getproductId() +"||" + p[i].getproductName()+"||"+ p[i].getCategory());

        

        sortByCategory(p);
        System.out.println("\n--- Binary Search by Category: 'A' ---");
        int idx6 = binarySearchByCategory(p, "A");
        System.out.println(idx6 != -1 ?"result: " + p[idx6].getproductId() +"||" + p[idx6].getproductName()+"||"+ p[idx6].getCategory() : "Not found");
        
        System.out.println("\n--- Binary Search O(k + log(n)) by productCategory     : 'A' ---");
        int[] idx10 = rangebinarySearchBypCat(p, "A");
        if (idx10.length == 0) System.out.println("Not found");
        for (int i : idx10) System.out.println( "result: " + p[i].getproductId() +"||" + p[i].getproductName()+"||"+ p[i].getCategory());


        sc.close();
    }
}