### Sorts

#### Questions

What are all the different sorts?
- Counting sort
Which sorts are stable?
- Stable: Insertion sort and quicksort
- Not stable: in place quicksort
Online sorts/algorithms - ones that can start computing as the inputs
come in, without having the full input at the beginning

#### Tries
Also called radix tree, digital tree, prefix tree. A search tree, an ordered
tree data structure used to store a dynamic set or associative array (key value pairs
where the keys show up at most once) are usually strings


#### Scoping

#### Closures
“A closure is a special kind of object that combines two things: a function, and the environment in which that function was created. The environment consists of any local variables that were in-scope at the time that the closure was created.”

#### Event Loop
https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop

Has a stack, queue, and heap
- Messages go into the queue, and a function is associated with each message
- When the stack has capacity, a message is removed from the queue and processed
  - Processing calls the function, which adds a frame to the stack


#### Binary to Decimal
Convert decimal to binary:
keep dividing by 2, and the remainder is the 1 or 0. The solution is the result going backwards:
Convert 13 to binary:
Division
by 2	Quotient	Remainder	Bit #
13/2	6	1	0
6/2	3	0	1
3/2	1	1	2
1/2	0	1	3
So 13 = 1101

Convert binary to decimal:
Start from the right and for each digit, multiply that by an increasing power of two (start with 2^0 = 1). Then add them all up.
Find the decimal value of 111001:
binary number:	1	1	1	0	0	1
power of 2:	25	24	23	22	21	2^0
= 57

#### Web APIs
When a web server provides non-UI formatted information like Rails views serving json data, we call it a web API.
Server side:
- A server-side web API is a programmatic interface consisting of one or more publicly exposed endpoints to a defined request–response message system, typically expressed in JSON or XML, which is exposed via the web—most commonly by means of an HTTP-based web server.
- Endpoints
  - Rails views that serve raw JSON info = endpoints
  - Usually the access is via a URI to which HTTP requests are posed, and from which the response is thus expected.
  - This setup will let us write client-side Javascript that utilizes our endpoints to render our UI dynamically by requesting, posting, and displaying server information as it executes.
- Rails is smart enough to route HTTP requests (client side) for different data types to the corresponding views for that type. If a request with a header for Content-Type: application/json comes in, CatsController#index will automatically try to render app/views/cats/index.json.jbuilder instead of the app/views/cats/index.html.erb view we wrote earlier. All we have to do is write that view.
- Use our client side rendering scripts to make AJAX GET requests (which sets a content-type: applicaiton/json header) to localhost:3000/cats, you'll get JSON string back. Then client-side JS can parse and use the info

#### Networking
Server-side refers to operations that are performed by the server in a client–server relationship in computer networking. Typically, a server is a software program, such as a web server, that runs on a remote server, reachable from a user's local computer or workstation.

Client-side refers to operations that are performed by the client in a client–server relationship in a computer network. Typically, a client is a computer application, such as a web browser, that runs on a user's local computer or workstation and connects to a server as necessary.

#### HTTP
https://github.com/appacademy/curriculum/blob/39e94694a11278c9bb02f3f00a89762ec789e6ce/rails/readings/http.md
- TCP - transmission control protocol. Rules that govern the delivery of data over the internet and sets up a connection between the sending and receiving computers
- client-server model
  - https://en.wikipedia.org/wiki/Client%E2%80%93server_model#Client-host_and_server-host
  - A server host runs server programs which share their resources with clients. Clients don't share any resources but requests a server's content
  - servers await incoming requests, clients initiate communication sessions
  - ex. a web server serves web pages
  - clients and servers use a request-response messaging pattern
    - client sends a request, server returns a response.
    - to formalize the data exchange, the server can implement an API (application programming interface) - which is an abstraction layer for accessing a services
      - it restricts comms to a specific content format
  - Denial of service attacks exploit a server's obligation to process requests by overloading it with requests
  - Ex. a bank: client could be a web browser, which initiates a request to the bank's web server. Web server accesses the database server as a client to check the login credentials, then the web server accesses the database server as a client. An application server interprets the returned data and provides the output to the web server. The web server returns the result to the client web browser
- a network host is a computer connected to a comp network, may offer info resources, services, applications to nodes or users on the network. For networks that use the internet protocol suite, the computers are called IP hosts or internet hosts. They have IP addresses.
  - network hosts are servers or client systems if they're in the client-server model
  - All servers are hosts, but not all hosts are servers. Any device that has established a connection to a network qualifies as a host, whereas only hosts that accept connections from other devices (clients) qualify as servers.
- the request/responses can be HTTP
- HTTP ex. type in a URL
  - HTTP *Protocol* step 1: set up connection between our comp and the host (en.wikipedia.org). HTTP implemented on top of a TCP connection.
  - with this connection, our web browser can send an HTTP request to the host via the connection, then listen for a response
  - HTTP request is a string formatted with certain rules:
    - ex:
      GET /wiki/Cat HTTP/1.1
      Host: en.wikipedia.org
    - An HTTP request has 4 or 5 components:
        - HTTP method (GET, POST, PATCH, DELETE, etc.)
        - Request target (/wiki/Cat)
        - HTTP protocol version (HTTP/1.1)
        - Request header (Host: en.wikipedia.org in this example)
        - Request body (only used with certain HTTP methods; not present in this example)
    - An HTTP response is also a string, includes:
        - HTTP protocol version (HTTP/1.1)
        - Status code (200)
        - Textual description of the status code (OK)
        - Response header (everything from Content-Length: ... to ... 04:53:35 GMT)
        - Response body (everything from <!DOCTYPE html ... to </html>)

#### AJAX
Asynchronous Javascript and XML
- makes the HTTP request in the background, and when the request completes the browser won't load a new page like a regular HTTP request. Instead, when it gets the HTTP response, the browser will fire a JS callback function (ex. when you click "add to bookshelf", the callback might disable that button)
- a lot of people use JSON for the data format now

### Ruby
for i in 0..5
   puts "Value of local variable is #{i}"
end

### Javascript

#### Hoisting
let and const are declared (space in memory is allocated) but not initialized (so there's a )
var is declared and initialized at the top of the function, if you call it, it's returned as undefined.
Actual assignment occurs later in the function

#### callback functions
Functions that are passed to another function as a paramenter, and the callback funct is executed inside the other function.
Ex:
$("#btn_1").click(function() {
  alert("Btn 1 Clicked");
});
