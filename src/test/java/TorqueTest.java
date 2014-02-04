package io.github.jbarber;

import org.junit.Assert;
import org.junit.Test;

public class TorqueTest {
    @Test public final void testPbs_connect()
        throws Exception
    {
        String server = "localhost";
        NarSystem.loadLibrary();
        int handle = pbs.pbs_connect(server);
        Assert.assertEquals( 0, handle );
    }

    /*
    private static void printAttributes (Attrl attr) {
        Attrl next = attr;
        do {
            System.out.println(next.getName() + " " + next.getValue());
            next = next.getNext();
        } while (next != null);
    }

    private static void printStatus (BatchStatus status) {
        if (status == null) {
            int err = pbs.getPbs_errno();
            System.out.println(pbs.pbs_strerror(err));
        }
        else {
            BatchStatus next = status;
            do {
                printAttributes(status.getAttribs());
                next = next.getNext();
            } while (next != null);
        }
    }

    public static void main(String argv[]) {
        String server = "localhost"; 
        if (argv.length != 0) {
            server = argv[0];
        }

        NarSystem.loadLibrary();
        System.out.println("Connecting to " + server);
        int handle = pbs.pbs_connect(server);
        if (handle < 0) {
            int err = pbs.getPbs_errno();
            System.out.println(pbs.pbs_strerror(err));
            System.exit(0);
        }
        else {
            System.out.println("Connected");

            // Create a new attribute list with 1 attribute
            Attrl attr = new Attrl();
            attr.setNext(null);
            attr.setName("");
            attr.setResource("");
            attr.setValue("");

            // Get all of the server status attributes
            BatchStatus status = pbs.pbs_statserver(handle, null, "");
            printStatus(status);
            if (status != null) {
                pbs.pbs_statfree(status);
            }
            System.out.println("############################################################");

            status = pbs.pbs_statque(handle, "batch", null, "");
            printStatus(status);
            if (status != null) {
                pbs.pbs_statfree(status);
            }
            System.out.println("############################################################");

            status = pbs.pbs_statnode(handle, null, null, "");
            printStatus(status);
            if (status != null) {
                pbs.pbs_statfree(status);
            }
            System.out.println("############################################################");

            status = pbs.pbs_statjob(handle, null, null, "");
            printStatus(status);
            if (status != null) {
                pbs.pbs_statfree(status);
            }
            System.out.println("############################################################");



            pbs.pbs_disconnect(handle);
        }
    }
*/
}
