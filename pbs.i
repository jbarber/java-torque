%module pbs
%{
    #include <torque/pbs_ifl.h>
    #include <torque/pbs_error.h>
    #include <torque/pbs_ifl.h>
    #include <torque/rm.h>
    #include <torque/rpp.h>
    #include <torque/tm.h>
%}

%rename(Attrl) attrl;
%rename(BatchStatus) batch_status;

%immutable;
extern int pbs_errno;
%mutable;

struct attrl {
    struct attrl  *next;
    char          *name;
    char          *resource;
    char          *value;
    //enum batch_op  op;
};

struct batch_status {
    struct batch_status *next;
    char                *name;
    struct attrl        *attribs;
    char                *text;
};

int pbs_connect(char *);
char *pbs_strerror(int);
struct batch_status *pbs_statserver(int, struct attrl *, char *);
void pbs_statfree(struct batch_status *);
int pbs_disconnect(int);
char *pbs_geterrmsg(int);
struct batch_status *pbs_statque(int, char *, struct attrl *, char *);
struct batch_status *pbs_statnode(int, char *, struct attrl *, char *);
struct batch_status *pbs_statjob(int, char *, struct attrl *, char *);

// Automatically load the library
%pragma(java) jniclasscode=%{
    static {
        try {
            System.loadLibrary("pbs");
        } catch (UnsatisfiedLinkError e) {
            System.err.println("Native code library failed to load. \n" + e);
            System.exit(1);
        }
    }
%}
