request HB_GTCGI

static cResult := ""

function Main()

   cResult += "Process Attach" + hb_OsNewLine()

   ? cResult
   Printf( cResult )

return nil 

function ThreadAttach()

   local n

   cResult += "New thread" + Str( hb_ThreadId() ) + hb_OsNewLine()

   // for n = 1 to 100000
   // next

return nil

function ThreadDetach()

   cResult += "thread detach" + Str( hb_ThreadId() ) + hb_OsNewLine()

return nil

function ProcessDetach()

   cResult += "Process detach" + hb_OsNewLine()

   ? cResult 

return nil

#pragma BEGINDUMP

#include <hbapi.h>

HB_FUNC( PRINTF )
{
   printf( "%s", hb_parc( 1 ) );
}

#pragma ENDDUMP