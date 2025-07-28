package code;

interface Notifier{
  void send(String message);
}

class EmailNotifier implements Notifier{
  public void send(String message){
    System.out.println("Email: " + message);
  }
}

class NotifierDecorator implements Notifier{
  private Notifier notifier;
  public NotifierDecorator(Notifier notifier){
    this.notifier = notifier;
  }
  public void send(String message){
    notifier.send(message);
  }
}

class SMSNotifierDecorator extends NotifierDecorator{
  public SMSNotifierDecorator(Notifier notifier){
    super(notifier);
  }
  public void send(String message){
    super.send(message);
    System.out.println("SMS: "+ message);
  }
}

public class DecoratorPatternExample {
    public static void main(String[] args) {
      Notifier notifier = new SMSNotifierDecorator(new EmailNotifier());
      notifier.send("Hello!");
  }
}