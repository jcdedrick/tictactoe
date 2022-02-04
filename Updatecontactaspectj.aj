import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public aspect Updatecontactaspectj {
	pointcut callUpdateContact(Updateaspectj contact) :
	    call(void updateContact()) && within(AddressBook) && target(contact);

	  before(Updateaspectj contact) : callUpdateContact(contact) {
	    try (PrintWriter writer = new PrintWriter(new FileWriter("UpdatesLog.txt", true))) {
	      writer.println("Contact updated -> " + contact);
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
	  }
	
}
