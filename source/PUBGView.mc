using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;

class PUBGView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        makeRequest();
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
    // set up the response callback function
   function onReceieve(responseCode, data) {
       if (responseCode == 200){
           System.println("Request Successful");                  // print success
           System.println("Response: " + responseCode);
           System.println(data);
       }
       else {
           System.println("Response: " + responseCode);            // print response code
           System.println(data);
       }

   }

   function makeRequest() {                                        // start the function
       //var url = "https://pubgtracker.com/api/profile/pc/AnonLucario";
       var url = "https://battlefieldtracker.com/bf1/api/Stats/BasicStats?platform=&displayName=&game=";
       
       var param = { "platform" => "3", "displayName" => "tylerjosephrose" };
       
       var headers = {
            //"TRN-API-KEY" => "acd803f6-fbe8-4f41-aa24-8b401d4edef5",
            //acd803f6-fbe8-4f41-aa24-8b401d4edef5
            //88f862d4-25f2-474f-b04c-570b61da0f40
            
            //Battlefield key
            //"TRN-Api-Key" => "6015d133-c1a7-4c7b-83ab-1573751fcb57",
            
            "Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON,
            
            "platform" => "3", "displayName" => "tylerjosephrose"

            // accept responses that are reported as json-compatible
            //"Accept" => "application/json"
        };

        var options = {
            :method => Comm.HTTP_REQUEST_METHOD_GET,
            :headers => headers,
            :responseType => Comm.HTTP_RESPONSE_CONTENT_TYPE_JSON
        };
       
       /*var options = {};
       options.put(:method, Comm.HTTP_REQUEST_METHOD_GET);
       
       options.put(:headers, {"Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON});
       //options.put(:headers, {"Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON, "TRN-API-KEY" => "acd803f6-fbe8-4f41-aa24-8b401d4edef5"});
       //options.put(:headers, {"TRN-API-KEY" => "acd803f6-fbe8-4f41-aa24-8b401d4edef5", "Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON});
       
       options.put(:responseType, Comm.HTTP_RESPONSE_CONTENT_TYPE_JSON);*/

       //var responseCallback = method(:onReceive);                  // set responseCallback to
                                                                   // onReceive() method
       // Make the Communications.makeWebRequest() call
       Comm.makeWebRequest(url, param, options, method(:onReceieve));
   }

}
