---
layout: default
permalink: /docs/http/Load_Table_Data/
sidebar: yes
---

Load data into a table:

     POST /api/archive/:instance/tables/:name/data
    
Use HTTP header (antyhing else is not supported):

    Content-Type: application/protobuf

The data is a stream of <tt>Row</tt>s, each <tt>Row</tt> being composed of a list of <tt>Cell</tt>s. Each <tt>Row</tt> is preceded by its size in bytes varint encoded.

Each row has an optional associated list of <tt>ColumnInfo</tt> messages that define the table columns conainted in the row. The <ColumnInfo> message assigns an integer <tt>id</tt> for each column and the <tt>id</tt> is present in each cell belonging to that column (this is done in order to avoid sending the <tt>ColumnInfo</tt> with each <tt>Cell</tt>). The column id starts from 0 and is incremented with each new column present in the load. The ids are only valid during one single load.

The table has to exist in order to load data into it.

Chuncked data encoding can be used to send a large number of rows without knowing the total size in advance.


{% proto table/table.proto %}
message ColumnInfo {
  optional uint32 id = 1;
  optional string name = 2;
  //one of the types defined in org.yamcs.yarch.DataType
  //INT, STRING, DOUBLE, PROTOBUF(x.y.z), etc
  optional string type = 3; 
}

message Cell {
   optional uint32 columnId = 1; 
   optional bytes data = 2;
}

message Row {
  //the column info is only present for new columns in a stream of Row messages
  repeated ColumnInfo column = 1; 
  repeated Cell cell = 2;
}
{% endproto %}


### Response
Response can be PROTOBUF or JSON depending on the "Accept" header of the request.

<pre class="header">Status: 200 OK</pre>
{% proto table/table.proto %}
message TableLoadResponse {
   optional uint32 numRowsLoaded = 1;  
}
{% endproto %}

<pre class="header">Status: 400 BAD_REQUEST</pre>
{% proto rest/rest.proto %}
message RestExceptionMessage {
   optional string type = 1;
   optional string msg = 2;
   optional uint32 numRowsLoaded = 100;
}
{% endproto %}

If there is an error during the load, the HTTP status will be 4xy or 5xy and the <tt>msg</tt> will contain more information about the error. One possible error could be that the table has defined a (primary) key and one of the loaded rows contains no value for one of the columns of the key.

As the data is streamed to the server, if there is an error, there would have been certanly more data sent after the bad row, so the error is not about the last row sent. The numRowsLoaded response parameter can be used to know how many rows have been successfully loaded (the bad row is the numRowsLoaded+1 in the stream).

Note that if the server detects an error, it will send back the error message and close the connection regardless of the Keep-Alive option in the request header.
