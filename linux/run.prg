function Main()

   local hDLL := dlopen( "libharbour.so" )
   local n

   for n = 1 to 10 
      hb_threadDetach( hb_threadStart( @Test() ) )
   next

   hb_threadWaitForAll()
   
   ? "ok"
   // dlclose( hDll )

return nil

function Test()

   local hDLL := dlopen( "libharbour.so" )

   // dlclose( hDLL )

return nil   

#pragma BEGINDUMP

#include <dlfcn.h>
#include <unistd.h>
#include <hbapi.h>

HB_FUNC( DLOPEN )
{
   hb_retptr( dlopen( hb_parc( 1 ), RTLD_LAZY ) );
}

HB_FUNC( DLCLOSE )
{
   hb_retnl( dlclose( hb_parptr( 1 ) ) );
}

#pragma ENDDUMP