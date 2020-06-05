function Main()

   local pDLL := hb_LibLoad( "./libharbour.so" )

   for n = 1 to 10 
      hb_threadDetach( hb_threadStart( @Test() ) )
   next

   hb_threadWaitForAll()

   hb_libFree( pDll )

   ? "done"
    
return nil

function Test()

   local pDLL := hb_LibLoad( "./libharbour.so" )

   // hb_libFree( pDLL )

return nil   