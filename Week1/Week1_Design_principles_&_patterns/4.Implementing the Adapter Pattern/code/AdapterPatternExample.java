interface PaymentProcessor {
    void processPayment(int amt);
}

class PayPal {
    public void doPayment(int amt) {
        System.out.println("Rupees " + amt + " paid via PayPal");
    }
}

class GPay {
    public void pay(int amt) {
        System.out.println("Rupees " + amt + " paid via GPay");
    }
}

class AmazonPay {
    public void transfer(int amt) {
        System.out.println("Rupees " + amt + " paid via AmazonPay");
    }
}

class PayPalAdapter implements PaymentProcessor {
    private PayPal payObj = new PayPal();

    public void processPayment(int amt) {
        payObj.doPayment(amt);
    }
}

class GPayAdapter implements PaymentProcessor {
    private GPay payObj = new GPay();

    public void processPayment(int amt) {
        payObj.pay(amt);
    }
}

class AmazonPayAdapter implements PaymentProcessor {
    private AmazonPay payObj = new AmazonPay();

    public void processPayment(int amt) {
        payObj.transfer(amt);
    }
}

public class AdapterPatternExample {
    public static void main(String[] args) {
        PaymentProcessor payObj1 = new PayPalAdapter();
        PaymentProcessor payObj2 = new GPayAdapter();
        PaymentProcessor payObj3 = new AmazonPayAdapter();

        payObj1.processPayment(4000);
        payObj2.processPayment(4000);
        payObj3.processPayment(4000);

    }
}
