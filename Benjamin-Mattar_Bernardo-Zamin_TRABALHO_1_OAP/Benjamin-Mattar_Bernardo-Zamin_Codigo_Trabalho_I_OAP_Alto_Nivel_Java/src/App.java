import java.util.Scanner;
public class App {
    public static void main(String[] args) throws Exception {
        Scanner in = new Scanner(System.in);
        
        System.out.println("Programa Ackermann");
        System.out.println("========================");
        System.out.println("Componentes: <Benjamin Mattar e Bernardo Zamin>");
        System.out.println("========================");
        int m = 0;
        int n = 0;
        while (m >= 0 && n>=0) {
            System.out.println("Digite os parametros m e n para calcular A(m, n) ou -1 para abortar a execuçao");
            m = in.nextInt();
            if(m<0){
                break;
            }
            n = in.nextInt();
            if(n<0){
                break;
            }
            int resp = ackermann(m,n);
            System.out.printf("A(%d, %d) = %d\n", m,n,resp);
        }
        System.out.println("Valor negativo digitado! Programa encerrado!");
    }

    




    public static int ackermann(int m, int n){
        if(m==0){
            return n+1;
        }
        else if(m>0 && n==0){
            return ackermann(m-1,1);
        }
        else if(m>0 && n>0){
            return ackermann(m-1,ackermann(m, n-1));
        }
        return -1;
    }
}

