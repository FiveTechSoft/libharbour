function Main()

   local hDLL := wapi_LoadLibrary( "libharbour.dll" )
   local n

   for n = 1 to 10 
      hb_threadDetach( hb_threadStart( @Test() ) )
   next

   hb_threadWaitForAll()
   
   wapi_FreeLibrary( hDll )

return nil

function Test()

   local hDLL := wapi_Loadlibrary( "libharbour.dll" )

   wapi_FreeLibrary( hDLL )

return nil   