request HB_GT_NUL

function Main()

   printf( "Process Attach" )

return nil 

function Execute( cFileName )

   printf( cFileName )

return "ok"   

function ProcessDetach()

   printf( "Process Detach" )

return nil

#pragma BEGINDUMP

#include <hbapi.h>

HB_FUNC( PRINTF )
{
   printf( "%s\n", hb_parc( 1 ) );
}

#pragma ENDDUMP